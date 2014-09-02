//
//  AlternateLineChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 30/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAlternateLineViewController.h"
#import "ChartsGalleryAlternateLineDataSource.h"

@interface ChartsGalleryAlternateLineViewController()

@property (strong, nonatomic) ChartsGalleryAlternateLineDataSource *dataSource;
@property (strong, nonatomic) IBOutlet ShinobiChart *chart;

@end

@implementation ChartsGalleryAlternateLineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryAlternateLineDataSource new];
  self.chart.datasource = self.dataSource;
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.rangePaddingHigh = [SChartDateFrequency dateFrequencyWithDay:1];
  self.chart.xAxis.title = @"Date in February";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Number of boys";
  self.chart.yAxis.rangePaddingHigh = @10;
  
  self.chart.backgroundColor = [UIColor whiteColor];
  self.chart.legend.hidden = NO;
  self.chart.title = @"Names of boys born in Liverpool during February 1964";
}

@end
