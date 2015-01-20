//
//  ChartsGalleryCommonViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
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

#import "ChartsGalleryCommonViewController.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryCommonViewController()

@end

@implementation ChartsGalleryCommonViewController

- (void)setupChart {
  // Get the theme to set the basic fonts and colours
  SChartTheme *theme = [SChartiOS7Theme new];
  UIColor *darkGrayColor = [UIColor shinobiDarkGrayColor];
  theme.chartTitleStyle.font = [UIFont shinobiFontOfSize:18];
  theme.chartTitleStyle.textColor = darkGrayColor;
  theme.chartTitleStyle.titleCentresOn = SChartTitleCentresOnChart;
  theme.chartStyle.backgroundColor = [UIColor whiteColor];
  theme.legendStyle.borderWidth = 0;
  theme.legendStyle.font = [UIFont shinobiFontOfSize:16];
  theme.legendStyle.titleFontColor = darkGrayColor;
  theme.legendStyle.fontColor = darkGrayColor;
  theme.crosshairStyle.defaultFont = [UIFont shinobiFontOfSize:14];
  theme.crosshairStyle.defaultTextColor = [UIColor shinobiDarkGrayColor];
  [self styleAxisStyle:theme.xAxisStyle useLightLabelFont:YES];
  [self styleAxisStyle:theme.yAxisStyle useLightLabelFont:YES];
  [self styleAxisStyle:theme.xAxisRadialStyle useLightLabelFont:NO];
  [self styleAxisStyle:theme.yAxisRadialStyle useLightLabelFont:NO];
  [self.chart applyTheme:theme];
  
  self.chart.delegate = self;
  self.chart.legend.hidden = NO;
  
  for (SChartAxis *axis in self.chart.allAxes) {
    axis.enableGesturePanning = YES;
    axis.enableGestureZooming = YES;
    axis.enableMomentumPanning = YES;
    axis.enableMomentumZooming = YES;
  }
}

- (void)styleAxisStyle:(SChartAxisStyle *)style useLightLabelFont:(BOOL)useLightLabelFont {
  style.titleStyle.font = [UIFont shinobiFontOfSize:16];
  style.titleStyle.textColor = [UIColor shinobiDarkGrayColor];
  if (useLightLabelFont) {
    style.majorTickStyle.labelFont = [UIFont lightShinobiFontOfSize:14];
  } else {
    style.majorTickStyle.labelFont = [UIFont shinobiFontOfSize:14];
  }
  style.majorTickStyle.labelColor = style.titleStyle.textColor;
  style.lineColor = style.titleStyle.textColor;
}

- (void)useHorizontalLegend {
  self.chart.legend.style.orientation = SChartLegendOrientationHorizontal;
  self.chart.legend.style.horizontalPadding = @10;
  self.chart.legend.position = SChartLegendPositionBottomMiddle;
  self.chart.legend.style.symbolAlignment = SChartSeriesLegendAlignSymbolsLeft;
  self.chart.legend.style.textAlignment = NSTextAlignmentLeft;
}

@end
