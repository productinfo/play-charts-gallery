//
//  FirstSampleView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStepViewController.h"
#import "ChartsGalleryStepDataSource.h"

@implementation ChartsGalleryStepViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryStepDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"";
  [self.chart.xAxis setDefaultRange:[(ChartsGalleryStepDataSource *)self.chart.datasource
                                     getInitialDateRange]];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Value";
  
  self.chart.title = @"Step chart";
  
  [super setupChart];
}

@end
