//
//  ColumnChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedColumnViewController.h"
#import "ChartsGalleryStackedColumnDataSource.h"

@implementation ChartsGalleryStackedColumnViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryStackedColumnDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartCategoryAxis new];
  self.chart.xAxis.title = @"";
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@-0.5 andMaximum:@6.5];
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Unit sales in millions";
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"Value of retail trade";
  
  [super setupChart];
}

@end
