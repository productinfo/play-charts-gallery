//
//  CandlestickChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryCandlestickViewController.h"
#import "ChartsGalleryCandlestickDataSource.h"

@implementation ChartsGalleryCandlestickViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryCandlestickDataSource new];
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Value in £s";
  self.chart.yAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@5600 andMaximum:@5950];
  
  self.chart.title = @"FTSE 100 values 2012";
  
  [self setupChart];
  
  self.chart.legend.hidden = YES;
}

@end
