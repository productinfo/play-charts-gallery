//
//  ChartsGalleryMultitypeViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ChartsGalleryMultitypeViewController.h"
#import "ChartsGalleryMultitypeDataSource.h"

@implementation ChartsGalleryMultitypeViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryMultitypeDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.defaultRange = [(ChartsGalleryMultitypeDataSource *)self.chart.datasource getInitialDateRange];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  
  // Add first y-axis: temperature
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@28];
  self.chart.yAxis.title = @"Temperature (°C)";
  
  // Add second y-axis: rainfall, in reverse position (i.e. on right hand side)
  SChartNumberAxis *secondAxis = [SChartNumberAxis new];
  secondAxis.axisPosition = SChartAxisPositionReverse;
  secondAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@160];
  secondAxis.title = @"Rainfall (mm)";
  [self.chart addYAxis:secondAxis];
  
  self.chart.title = @"Multi-axis chart";
  
  [super setupChart];
  
  [self useHorizontalLegend];
}

@end
