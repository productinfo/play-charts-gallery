//
//  AreaChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAreaViewController.h"
#import "ChartsGalleryAreaDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@implementation ChartsGalleryAreaViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAreaDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithDay:1];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Units sold";

  self.chart.title = @"Area chart";
  
  [super setupChart];
}

@end
