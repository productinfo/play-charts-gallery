//
//  AreaChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAreaViewController.h"
#import "ChartsGalleryAreaDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@interface ChartsGalleryAreaViewController()

@property (strong, nonatomic) ChartsGalleryAreaDataSource *dataSource;
@property (strong, nonatomic) IBOutlet ShinobiChart *chart;

@end

@implementation ChartsGalleryAreaViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryAreaDataSource new];
  self.chart.datasource = self.dataSource;
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithDay:1];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Units sold";

  self.chart.legend.hidden = NO;
  self.chart.title = @"Unit sales by region in 2011";
  self.chart.backgroundColor = [UIColor whiteColor];
}

@end
