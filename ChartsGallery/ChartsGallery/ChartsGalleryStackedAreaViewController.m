//
//  StackedAreaChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedAreaViewController.h"
#import "ChartsGalleryStackedAreaDataSource.h"

@implementation ChartsGalleryStackedAreaViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStackedAreaDataSource new];
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Day in April";
  self.chart.xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithDay:1];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Units sold";
  
  self.chart.title = @"Unit sales by region in 2011";
  
  [self setupChart];
}

@end
