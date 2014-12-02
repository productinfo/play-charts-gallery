//
//  ChartsGalleryAnimatedViewController.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 27/11/2014.
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

#import "ChartsGalleryAnimatedViewController.h"
#import "ChartsGalleryAnimatedDataSource.h"

@implementation ChartsGalleryAnimatedViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAnimatedDataSource new];
}

- (void)setupChart {  
  self.chart.xAxis = [SChartCategoryAxis new];
  self.chart.xAxis.title = @"";
  self.chart.xAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@-0.5 andMaximum:@5.5];
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"% purchased an item";
  self.chart.yAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0 andMaximum:@100.5];
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"Items purchased online by age in 2011";
  self.chart.legend = NO;
  
  [super setupChart];
}

- (IBAction)toggleSeriesZero:(id)sender {
  [self toggleChartSeriesHidden:0];
}

- (IBAction)toggleSeriesOne:(id)sender {
  [self toggleChartSeriesHidden:1];
}

- (IBAction)toggleSeriesTwo:(id)sender {
  [self toggleChartSeriesHidden:2];
}

- (IBAction)toggleSeriesThree:(id)sender {
  [self toggleChartSeriesHidden:3];
}

- (void)toggleChartSeriesHidden:(NSInteger)series {
  SChartColumnSeries *columnSeries = self.chart.series[series];
  [columnSeries setHidden:!columnSeries.hidden];
  [self.chart redrawChart];
}

@end
