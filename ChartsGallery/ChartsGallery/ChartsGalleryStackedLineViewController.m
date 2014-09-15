//
//  StackedLineChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedLineViewController.h"
#import "ChartsGalleryStackedLineDataSource.h"

@implementation ChartsGalleryStackedLineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStackedLineDataSource new];
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Sales value in millions";
  
  self.chart.title = @"UK monthly retail sales";
  
  [self setupChart];
}

@end