//
//  FirstSampleView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryLineViewController.h"
#import "ChartsGalleryLineDataSource.h"

@implementation ChartsGalleryLineViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryLineDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Average Temperature (°F)";
  
  self.chart.title = @"Line chart";
  
  [super setupChart];
}

@end
