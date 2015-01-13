//
//  ChartsGalleryAlternateLineViewController.m
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

#import "ChartsGalleryAlternateLineViewController.h"
#import "ChartsGalleryAlternateLineDataSource.h"

@implementation ChartsGalleryAlternateLineViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAlternateLineDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.rangePaddingHigh = [SChartDateFrequency dateFrequencyWithDay:1];
  self.chart.xAxis.title = @"Date in February";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Number of boys";
  self.chart.yAxis.rangePaddingHigh = @10;
  
  self.chart.title = @"Line chart showing points";
  
  [super setupChart];
  
  self.chart.legend.style.orientation = SChartLegendOrientationHorizontal;
  self.chart.legend.style.horizontalPadding = @10;
  self.chart.legend.position = SChartLegendPositionBottomMiddle;
  self.chart.legend.style.symbolAlignment = SChartSeriesLegendAlignSymbolsLeft;
  self.chart.legend.style.textAlignment = NSTextAlignmentLeft;
}

@end
