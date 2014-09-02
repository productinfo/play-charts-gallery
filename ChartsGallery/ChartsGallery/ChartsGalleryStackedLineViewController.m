//
//  StackedLineChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedLineViewController.h"
#import "ChartsGalleryStackedLineDataSource.h"

@interface ChartsGalleryStackedLineViewController()

@property (strong, nonatomic) ChartsGalleryStackedLineDataSource *dataSource;
@property (strong, nonatomic) IBOutlet ShinobiChart *chart;

@end

@implementation ChartsGalleryStackedLineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStackedLineDataSource new];
  self.chart.datasource = self.dataSource;
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Sales value in millions";
  
  self.chart.legend.hidden = NO;
  self.chart.title = @"UK monthly retail sales";
  self.chart.backgroundColor = [UIColor whiteColor];
}

@end
