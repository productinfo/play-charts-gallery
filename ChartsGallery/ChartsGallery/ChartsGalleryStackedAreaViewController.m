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

- (id<SChartDatasource>)createDataSource {
  return [ChartsGalleryStackedAreaDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Day in April";
  self.chart.xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithDay:1];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Units sold";
  
  self.chart.title = @"Unit sales by region in 2011";
  
  [super setupChart];
}

@end
