//
//  BandChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBandViewController.h"
#import "ChartsGalleryBandDataSource.h"

@implementation ChartsGalleryBandViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryBandDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Price ($)";
  
  self.chart.title = @"Historical crude oil prices";
  
  [super setupChart];
  
  self.chart.legend.hidden = YES;
}

@end
