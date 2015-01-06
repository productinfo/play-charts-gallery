//
//  ChartsGalleryCommonViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryCommonViewController.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryCommonViewController()

@end

@implementation ChartsGalleryCommonViewController

- (void)setupChart {
  SChartTheme *theme = [SChartiOS7Theme new];
  theme.chartTitleStyle.font = [UIFont shinobiFontOfSize:18];
  theme.chartTitleStyle.textColor = [UIColor shinobiDarkGrayColor];
  theme.chartTitleStyle.titleCentresOn = SChartTitleCentresOnChart;
  theme.chartStyle.backgroundColor = [UIColor whiteColor];
  theme.legendStyle.borderWidth = 0;
  theme.legendStyle.font = [UIFont shinobiFontOfSize:16];
  theme.legendStyle.titleFontColor = [UIColor shinobiDarkGrayColor];
  theme.legendStyle.fontColor = [UIColor shinobiDarkGrayColor];
  theme.xAxisStyle.titleStyle.font = [UIFont shinobiFontOfSize:16];
  theme.xAxisStyle.titleStyle.textColor = [UIColor shinobiDarkGrayColor];
  theme.xAxisStyle.majorTickStyle.labelFont = [UIFont lightShinobiFontOfSize:14];
  theme.xAxisStyle.majorTickStyle.labelColor = [UIColor shinobiDarkGrayColor];
  theme.xAxisStyle.lineColor = [UIColor shinobiDarkGrayColor];
  theme.yAxisStyle.titleStyle.font = [UIFont shinobiFontOfSize:16];
  theme.yAxisStyle.titleStyle.textColor = [UIColor shinobiDarkGrayColor];
  theme.yAxisStyle.majorTickStyle.labelFont = [UIFont lightShinobiFontOfSize:14];
  theme.yAxisStyle.majorTickStyle.labelColor = [UIColor shinobiDarkGrayColor];
  theme.yAxisStyle.lineColor = [UIColor shinobiDarkGrayColor];
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
