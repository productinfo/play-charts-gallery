//
//  ColumnChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryColumnViewController.h"
#import "ChartsGalleryColumnDataSource.h"

@implementation ChartsGalleryColumnViewController

- (id<SChartDatasource>)createDataSource {
  return [ChartsGalleryColumnDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartCategoryAxis new];
  self.chart.xAxis.title = @"School";
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@2.5 andMaximum:@5.5];
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"SAT Score";
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"SAT scores for schools";
  
  [super setupChart];
}

@end
