//
//  BarChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBarViewController.h"
#import "ChartsGalleryBarDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@implementation ChartsGalleryBarViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryBarDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"% purchased an item";
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartCategoryAxis new];
  self.chart.yAxis.title = @"";
  self.chart.yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:@-0.5 andMaximum:@5.5];
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"Bar chart";
  
  [super setupChart];
  
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
}

@end
