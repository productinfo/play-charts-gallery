//
//  BubbleChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBubbleViewController.h"
#import "ChartsGalleryBubbleDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@implementation ChartsGalleryBubbleViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryBubbleDataSource new];
  self.chart.delegate = (ChartsGalleryBubbleDataSource*)self.dataSource;
  
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"Longitude";
  self.chart.xAxis.rangePaddingLow = @20;
  self.chart.xAxis.rangePaddingHigh = @30;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Latitude";
  self.chart.yAxis.rangePaddingLow = @10;
  self.chart.yAxis.rangePaddingHigh = @10;

  self.chart.title = @"Populations by latitude and longitude";
  
  [self setupChart];
  
  self.chart.legend.hidden = YES;
}

@end
