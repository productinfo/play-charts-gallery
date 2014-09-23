//
//  StackedBarChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedBarViewController.h"
#import "ChartsGalleryStackedBarDataSource.h"

@implementation ChartsGalleryStackedBarViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStackedBarDataSource new];
  
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"SAT Score";
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartCategoryAxis new];
  self.chart.yAxis.title = @"School";
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"SAT scores for schools";
  
  [self setupChart];
}

@end
