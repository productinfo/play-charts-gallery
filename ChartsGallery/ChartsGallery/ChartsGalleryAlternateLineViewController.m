//
//  AlternateLineChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 30/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAlternateLineViewController.h"
#import "ChartsGalleryAlternateLineDataSource.h"

@implementation ChartsGalleryAlternateLineViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAlternateLineDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.rangePaddingHigh = [SChartDateFrequency dateFrequencyWithDay:1];
  self.chart.xAxis.title = @"Date in February";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Number of boys";
  self.chart.yAxis.rangePaddingHigh = @10;
  
  self.chart.title = @"Names of boys born in Liverpool during February 1964";
  
  [super setupChart];
}

@end
