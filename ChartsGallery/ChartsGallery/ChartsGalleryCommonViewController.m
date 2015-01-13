//
//  ChartsGalleryCommonViewController.h
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
  theme.xAxisStyle.titleStyle.font = [UIFont shinobiFontOfSize:16];
  theme.xAxisStyle.titleStyle.textColor = darkGrayColor;
  theme.xAxisStyle.majorTickStyle.labelFont = [UIFont lightShinobiFontOfSize:14];
  theme.xAxisStyle.majorTickStyle.labelColor = darkGrayColor;
  theme.xAxisStyle.lineColor = darkGrayColor;
  // Set yAxisStyle to match xAxisStyle (note we can't just copy the whole style object
  // as that will make the axis label the wrong orientation)
  theme.yAxisStyle.titleStyle.font = theme.yAxisStyle.titleStyle.font;
  theme.yAxisStyle.titleStyle.textColor = theme.yAxisStyle.titleStyle.textColor;
  theme.yAxisStyle.majorTickStyle = theme.xAxisStyle.majorTickStyle;
  theme.yAxisStyle.minorTickStyle = theme.xAxisStyle.minorTickStyle;
  theme.yAxisStyle.lineColor = theme.xAxisStyle.lineColor;
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

@end
