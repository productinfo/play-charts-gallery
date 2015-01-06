//
//  MultiChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryMultitypeViewController.h"
#import "ChartsGalleryMultitypeDataSource.h"

@implementation ChartsGalleryMultitypeViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryMultitypeDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.defaultRange = [(ChartsGalleryMultitypeDataSource *)self.chart.datasource getInitialDateRange];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  // Add first y-axis: temperature
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:0 andMaximum:@28];
  self.chart.yAxis.title = @"Temperature (°C)";
  
  // Add second y-axis: rainfall, in reverse position (i.e. on right hand side)
  SChartNumberAxis *secondAxis = [SChartNumberAxis new];
  secondAxis.axisPosition = SChartAxisPositionReverse;
  secondAxis.defaultRange = [[SChartRange alloc] initWithMinimum:0 andMaximum:@160];
  secondAxis.title = @"Rainfall (mm)";
  [self.chart addYAxis:secondAxis];
  
  self.chart.title = @"Multitype chart";
  
  [super setupChart];
}

@end
