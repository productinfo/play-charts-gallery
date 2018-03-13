//
//  ChartsGalleryCustomCrosshair.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 17/12/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ChartsGalleryCustomCrosshair.h"
#import <ShinobiCharts/SChartCanvas.h>
#import <ShinobiCharts/SChartCanvasOverlay.h>
#import <ShinobiCharts/SChartGLView.h>
#import <ShinobiCharts/SChartPixelToPointMapper.h>
#import <ShinobiCharts/SChartPixelToPointMapping.h>
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryCustomCrosshair ()

@property (strong, nonatomic) CAShapeLayer *line;
@property (strong, nonatomic) UIView<ChartsGalleryCrosshairTooltip> *crosshairTooltip;

@end

@implementation ChartsGalleryCustomCrosshair

@synthesize style;
@synthesize tooltip;

- (instancetype)initWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth
                      tooltip:(UIView<ChartsGalleryCrosshairTooltip> *)crosshairTooltip {
  self = [super initWithFrame:frame];
  if (self) {
    self.clipsToBounds = YES;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, frame.origin.y)];
    [path addLineToPoint:CGPointMake(0, frame.origin.y + frame.size.height)];
    self.line = [CAShapeLayer layer];
    self.line.path = path.CGPath;
    self.line.strokeColor = lineColor.CGColor;
    self.line.lineWidth = lineWidth;
    [self.layer addSublayer:self.line];
    
    self.crosshairTooltip = crosshairTooltip;
    [self addSubview:self.crosshairTooltip];
  }
  
  return self;
}

- (void)showAtPoint:(CGPoint)pointInChart inChart:(ShinobiChart *)chart {
  self.frame = [chart plotAreaFrame];
  [self moveToPoint:pointInChart inChart:chart];
  [self showInChart:chart];
}

- (void)showInChart:(ShinobiChart *)chart {
  [chart.canvas.overlay addSubview:self];
  [chart redrawChart];
}

- (void)moveToPoint:(CGPoint)pointInChart inChart:(ShinobiChart *)chart {
  CGFloat xPosition = pointInChart.x;
  
  // Get the nearest data point to pointInChart so we know where to move the crosshair to.
  SChartMappedSeries *series = (SChartMappedSeries *)chart.series[0];
  SChartPixelToPointMapper *mapper = [SChartPixelToPointMapper new];
  SChartPixelToPointMapping *mapping = [mapper mappingForPoint:pointInChart
                                                seriesToSearch:@[series]
                                                       onChart:chart];
  
  // The mapper interpolates data between points on a line series, but we want the crosshair
  // to always be on a real data point, so we use the mapping's data point's index and
  // go back to the data source to get the actual data point
  NSInteger dataPointIndex = [mapping.dataPoint sChartDataPointIndex];
  SChartDataPoint *dp = [chart.datasource sChart:chart dataPointAtIndex:dataPointIndex forSeriesAtIndex:0];
  // Convert the data point back to a pixel point
  xPosition = [chart.xAxis pixelValueForDataValue:dp.xValue];
  
  // Hide crosshair if out of range of chart (leaving some leeway for gestures)
  if (xPosition > self.frame.size.width + 10 || xPosition < -10) {
    [self hide];
  } else {
    if (!self.superview) {
      [self showInChart:chart];
    }
    
    // Update the tooltip
    [self.crosshairTooltip updateWithDataPoint:dp];
    
    // Position it on top of the crosshair
    CGFloat tooltipHalfWidth = self.crosshairTooltip.frame.size.width/2;
    CGFloat tooltipXPosition = xPosition;
    // Fix tooltipXPosition so the tooltip doesn't sit off the screen
    if (tooltipXPosition < tooltipHalfWidth) {
      tooltipXPosition = tooltipHalfWidth;
    } else if (tooltipXPosition > self.frame.size.width - tooltipHalfWidth) {
      tooltipXPosition = self.frame.size.width - tooltipHalfWidth;
    }
    self.crosshairTooltip.center = CGPointMake(tooltipXPosition,
                                               self.crosshairTooltip.frame.size.height/2);
    
    // Move the crosshair line
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:0];
    self.line.position = CGPointMake(xPosition, self.line.position.y);
    [CATransaction commit];
  }
}

- (void)hide {
  [self removeFromSuperview];
}

- (BOOL)isHidden {
  return self.superview == nil;
}

@end
