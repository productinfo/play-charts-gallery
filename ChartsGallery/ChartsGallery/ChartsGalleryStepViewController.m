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

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStepDataSource new];
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"";
  [self.chart.xAxis setDefaultRange:[(ChartsGalleryStepDataSource *)self.dataSource getInitialDateRange]];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Value";
  
  self.chart.title = @"Historical price of gold";
  
  [self setupChart];
}

@end
