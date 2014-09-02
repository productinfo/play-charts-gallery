//
//  MultiChartView.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryMultitypeViewController.h"
#import "ChartsGalleryMultitypeDataSource.h"

@interface ChartsGalleryMultitypeViewController()

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) ChartsGalleryMultitypeDataSource *dataSource;

@end

@implementation ChartsGalleryMultitypeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryMultitypeDataSource new];
  self.chart.datasource = self.dataSource;
  self.chart.title = @"Historic monthly weather data for Heathrow Airport";
  self.chart.backgroundColor = [UIColor whiteColor];
  self.chart.legend.hidden = NO;
  self.chart.legend.position = SChartLegendPositionMiddleRight;
  self.chart.legend.placement = SChartLegendPlacementOutsidePlotArea;
  self.chart.canvasInset = UIEdgeInsetsMake(20, 0, 0, 20);
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.defaultRange = [self.dataSource getDateRange];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  // Add first y-axis: temperature
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:0 andMaximum:@28];
  self.chart.yAxis.title = @"Temperature (°C)";
  
  // Add second y-axis: rainfall, in reverse position (i.e. on right hand side)
  SChartNumberAxis *secondAxis = [SChartNumberAxis new];
  secondAxis.axisPosition = SChartAxisPositionReverse;
  secondAxis.title = @"Rainfall (mm)";
  [self.chart addYAxis:secondAxis];
  
  [self.chart reloadData];
}

@end
