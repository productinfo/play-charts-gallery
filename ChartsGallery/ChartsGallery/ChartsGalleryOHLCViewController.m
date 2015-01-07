//
//  OHLCChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryOHLCViewController.h"
#import "ChartsGalleryOHLCDataSource.h"

@implementation ChartsGalleryOHLCViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryOHLCDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Value in £s";
  self.chart.yAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@5600 andMaximum:@5950];
  
  self.chart.title = @"OHLC chart";
  
  [super setupChart];
  
  self.chart.legend.hidden = YES;
}

@end
