//
//  ChartsGalleryCustomCrosshairTooltip.m
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

#import "ChartsGalleryCustomCrosshairTooltip.h"
#import <ShinobiCharts/SChartCanvas.h>
#import "ChartsGalleryCrosshairDataSource.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

static const CGFloat CustomCrosshairChartTooltipLabelPadding = 5.f;

@interface ChartsGalleryCustomCrosshairTooltip ()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) UILabel *heartRate;
@property (strong, nonatomic) UILabel *pace;

@property (strong, nonatomic) NSArray *allLabels;

@end

@implementation ChartsGalleryCustomCrosshairTooltip

- (instancetype)init {
  self = [super init];
  if (self) {
    self.dateFormatter = [NSDateFormatter new];
    [self.dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.heartRate = [self createTooltipLabel];
    [self addSubview:self.heartRate];
    
    self.pace = [self createTooltipLabel];
    [self addSubview:self.self.pace];
    
    self.allLabels = @[self.label, self.heartRate, self.pace];
  }
  return self;
}

// Method to create a label to add to the tooltip
- (UILabel*)createTooltipLabel {
  UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  newLabel.backgroundColor = [UIColor clearColor];
  newLabel.font = [UIFont shinobiFontOfSize:12];
  newLabel.textColor = [UIColor shinobiDarkGrayColor];
  return newLabel;
}

- (void)setDataPoint:(id<SChartData>)dataPoint fromSeries:(SChartSeries *)series fromChart:(ShinobiChart *)chart {
  SChartDataPoint *chartDataPoint = (SChartDataPoint*)dataPoint;
  
  // Get a date string from the data point and display as label text
  self.label.text = [self.dateFormatter stringFromDate:chartDataPoint.xValue];
  
  NSInteger dataPointIndex = chartDataPoint.index;
  ChartsGalleryCrosshairDataSource *dataSource = chart.datasource;
  NSDictionary *dataCollection = dataSource.dataCollection[dataPointIndex];
  self.heartRate.text = [NSString stringWithFormat:@"Heart Rate: %@ bpm", dataCollection[@"Heart Rate"]];
  self.pace.text = [NSString stringWithFormat:@"Pace: %@ kph", dataCollection[@"Pace"]];
}

- (void)setPosition:(struct SChartPoint)position onCanvas:(SChartCanvas*)canvas {
  [super setPosition:position onCanvas:canvas];
  
  // Lay out the labels, keeping track of the maximum width
  CGFloat maxLabelWidth = 0;
  CGFloat currentMaxHeight = CustomCrosshairChartTooltipLabelPadding;
  
  for (UILabel *label in self.allLabels) {
    // Position the label
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin = CGPointMake(CustomCrosshairChartTooltipLabelPadding, currentMaxHeight);
    label.frame = frame;
    
    maxLabelWidth = MAX(maxLabelWidth, label.frame.size.width);
    currentMaxHeight += label.frame.size.height;
  }
  
  // Further customize top most label in crosshair tooltip
  // To center the top most label after we have deduced the maximum label width of all the labels.
  UILabel *topMostLabel = self.allLabels[0];
  CGRect labelFrame = topMostLabel.frame;
  labelFrame.size.width = maxLabelWidth;
  topMostLabel.frame = labelFrame;
  
  // Resize tooltip frame
  CGRect frame = self.frame;
  frame.size.width = maxLabelWidth + (2 * CustomCrosshairChartTooltipLabelPadding);
  frame.size.height = currentMaxHeight + CustomCrosshairChartTooltipLabelPadding;
  frame.origin.y = canvas.glView.frame.origin.y;
  frame.origin.x = position.x - (frame.size.width / 2);
  self.frame = frame;
}

@end
