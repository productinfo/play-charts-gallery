//
//  ChartsGalleryPolarViewController.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 13/11/2014.
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

#import "ChartsGalleryPolarViewController.h"
#import "ChartsGalleryPolarDataSource.h"

@implementation ChartsGalleryPolarViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryPolarDataSource new];
}

- (void)setupChart {
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.majorTickFrequency = @250;
  self.chart.yAxis.style.majorTickStyle.tickGap = @-50;
  
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@360];
  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
  [numberFormatter setPositiveFormat:@"0°"];
  [numberFormatter setNegativeFormat:@"0°"];
  SChartTickLabelFormatter *labelFormatter = [SChartTickLabelFormatter new];
  labelFormatter.formatter = numberFormatter;
  self.chart.xAxis.labelFormatter = labelFormatter;

  self.chart.title = @"Polar chart";
  
  [super setupChart];
}

@end
