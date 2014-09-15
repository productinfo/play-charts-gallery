//
//  ChartsGalleryCommonViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryCommonViewController.h"

@implementation ChartsGalleryCommonViewController

- (void)setupChart {
  self.chart.datasource = self.dataSource;
  self.chart.legend.hidden = NO;
  self.chart.backgroundColor = [UIColor whiteColor];
  
  for (SChartAxis *axis in self.chart.allAxes) {
    axis.enableGesturePanning = YES;
    axis.enableGestureZooming = YES;
    axis.enableMomentumPanning = YES;
    axis.enableMomentumZooming = YES;
  }
}

@end