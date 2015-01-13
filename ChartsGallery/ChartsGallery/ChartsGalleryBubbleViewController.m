//
//  ChartsGalleryBubbleViewController.m
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

#import "ChartsGalleryBubbleViewController.h"
#import "ChartsGalleryBubbleDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@implementation ChartsGalleryBubbleViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryBubbleDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"Longitude";
  self.chart.xAxis.rangePaddingLow = @20;
  self.chart.xAxis.rangePaddingHigh = @30;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Latitude";
  self.chart.yAxis.rangePaddingLow = @10;
  self.chart.yAxis.rangePaddingHigh = @10;

  self.chart.title = @"Bubble chart";
  
  [super setupChart];
  
  self.chart.legend.hidden = YES;
}

// Pass delegate method through to data source
- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series {
  return [(ChartsGalleryBubbleDataSource*)self.chart.datasource sChart:chart
                                                   alterDataPointLabel:label
                                                          forDataPoint:dataPoint
                                                              inSeries:series];
}

@end
