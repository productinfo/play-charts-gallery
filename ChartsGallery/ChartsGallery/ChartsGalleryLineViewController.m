//
//  ChartsGalleryLineViewController.m
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

#import "ChartsGalleryLineViewController.h"
#import "ChartsGalleryLineDataSource.h"

@implementation ChartsGalleryLineViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryLineDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Date";
  self.chart.xAxis.labelFormatString = @"MMM yyyy";
  self.chart.xAxis.majorTickFrequency = [SChartDateFrequency dateFrequencyWithMonth:1];
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Average Temperature (°F)";
  self.chart.yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:@20 andMaximum:@90];
  
  self.chart.title = @"Line chart";
  
  [super setupChart];
  
  [self useHorizontalLegend];
}

@end
