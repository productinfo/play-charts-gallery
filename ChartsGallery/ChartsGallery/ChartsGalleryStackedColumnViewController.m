//
//  ChartsGalleryStackedColumnViewController.m
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

#import "ChartsGalleryStackedColumnViewController.h"
#import "ChartsGalleryStackedColumnDataSource.h"

@implementation ChartsGalleryStackedColumnViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryStackedColumnDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartCategoryAxis new];
  self.chart.xAxis.title = @"";
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@-0.5 andMaximum:@6.5];
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Unit sales in 100,000s";
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"Stacked column chart";
  
  [super setupChart];
  
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
}

@end
