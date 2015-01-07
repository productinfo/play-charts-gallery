//
//  ColumnChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryScatterViewController.h"
#import "ChartsGalleryScatterDataSource.h"

@implementation ChartsGalleryScatterViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryScatterDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"Height (inches)";
  self.chart.xAxis.rangePaddingLow = @1;
  self.chart.xAxis.rangePaddingHigh = @1;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Average Weight (lbs)";
  self.chart.yAxis.rangePaddingLow = @3;
  self.chart.yAxis.rangePaddingHigh = @3;
  
  self.chart.title = @"Scatter chart";
  
  [super setupChart];
  
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
  self.chart.legend.style.showSymbols = YES;
}

@end
