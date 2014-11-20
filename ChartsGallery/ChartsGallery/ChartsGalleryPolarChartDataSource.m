//
//  ChartsGalleryPolarChartDataSource.m
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

#import "ChartsGalleryPolarChartDataSource.h"

@implementation ChartsGalleryPolarChartDataSource

const int step = 5;

- (instancetype)init {
  self = [super init];
  if (self) {
    self.seriesNames = @[@"Archimedean", @"Logarithmic"];
    self.dataCollection = [NSMutableArray new];
    
    for(int i = 0; i < 216; ++i){
      int j = i * step;
      
      // Archimedean  equation
      NSNumber *archimedeanSpiralYValue = [NSNumber numberWithFloat:1 + (1 * j)];
      
      // Logarithmic  equation
      NSNumber *logarithmicSpiralYValue = [NSNumber numberWithFloat:1 * (exp(0.0065 * j))];
      
      self.dataCollection[i] = @{@"Archimedean" : archimedeanSpiralYValue, @"Logarithmic" : logarithmicSpiralYValue};
    }
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartRadialLineSeries *radialSeries = [SChartRadialLineSeries new];
  radialSeries.title = self.seriesNames[index];
  return radialSeries;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dataPoint = [SChartDataPoint new];
  dataPoint.xValue = [NSNumber numberWithFloat:fmod((dataIndex * step), 360)];
  dataPoint.yValue = self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  return dataPoint;
}

@end
