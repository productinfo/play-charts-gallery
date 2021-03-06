//
//  ChartsGalleryHistogramViewController.m
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

#import "ChartsGalleryHistogramViewController.h"
#import "ChartsGalleryHistogramDataSource.h"

@implementation ChartsGalleryHistogramViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryHistogramDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@80];
  self.chart.xAxis.animationEdgeBouncing = NO;
  self.chart.xAxis.majorTickFrequency = @10;
  self.chart.xAxis.minorTickFrequency = @5;
  self.chart.xAxis.title = @"Age in years";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.rangePaddingLow = @0;
  self.chart.yAxis.title = @"Number of participants";
  
  self.chart.title = @"Histogram";
  
  [super setupChart];
  
  self.chart.xAxis.style.interSeriesPadding = @0;
  self.chart.xAxis.style.interSeriesSetPadding = @0;
  
  self.chart.legend.hidden = YES;
}

@end
