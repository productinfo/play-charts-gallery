//
//  HistogramChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryHistogramViewController.h"
#import "ChartsGalleryHistogramDataSource.h"

@implementation ChartsGalleryHistogramViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryHistogramDataSource new];
  
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@80];
  self.chart.xAxis.animationEdgeBouncing = NO;
  self.chart.xAxis.style.interSeriesPadding = @0;
  self.chart.xAxis.style.interSeriesSetPadding = @0;
  self.chart.xAxis.majorTickFrequency = @10;
  self.chart.xAxis.minorTickFrequency = @5;
  self.chart.xAxis.title = @"Age in years";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.rangePaddingLow = @0;
  self.chart.yAxis.title = @"Number of participants";
  
  self.chart.title = @"Age distribution of event participants";
  
  [self setupChart];
  self.chart.legend.hidden = YES;
}

@end
