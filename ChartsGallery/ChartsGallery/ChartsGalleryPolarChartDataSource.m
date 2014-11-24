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

- (instancetype)init {
  self = [super init];
  if (self) {
    self.seriesNames = @[@"Archimedean", @"Logarithmic", @"Hyperbolic"];
    self.dataCollection = [NSMutableArray new];
  }
  return self;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  if (seriesIndex == 2) {
    return 75;
  }
  else{
    return 217;
  }
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartRadialLineSeries *radialSeries = [SChartRadialLineSeries new];
  radialSeries.title = self.seriesNames[index];
  radialSeries.style.lineWidth = @2;
  return radialSeries;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  
  const CGFloat regularStep = 5;
  const CGFloat hyperbolicStep = 18;
  const CGFloat totalDegreesInCircle = 360;
  const CGFloat logarithmicSpiralMaxYValue = 1100;
  const CGFloat logarithmicSpiralScale = 0.0065;
  
  SChartDataPoint *dataPoint = [SChartDataPoint new];
  if ((seriesIndex == 0) || (seriesIndex == 1)) {
    // X values are mod totalDegreesInCircle to make the spiral does several full rotations.
    dataPoint.xValue = [NSNumber numberWithFloat:fmod((dataIndex * regularStep), totalDegreesInCircle)];
  
    if (seriesIndex == 0) {
      // Archimedean spiral equation: r = a + (b * theta)
      dataPoint.yValue = [NSNumber numberWithFloat:1 + (dataIndex * regularStep)];
    } else {
      // X values are mod totalDegreesInCircle to make the spiral does several full rotations.
      dataPoint.xValue = [NSNumber numberWithFloat:fmod((dataIndex * regularStep), totalDegreesInCircle)];
    
      // Logarithmic spiral equation: r = a \ theta
      dataPoint.yValue = [NSNumber numberWithFloat:1 + (exp(logarithmicSpiralScale * dataIndex * regularStep))];
    }
  } else {
    // X values are mod totalDegreesInCircle to make the spiral does several full rotations.
    // X values are reversed so direction of logarithmic spiral matches archimedean and hyperbolic spirals
    dataPoint.xValue = [NSNumber numberWithFloat:totalDegreesInCircle - fmod((dataIndex * hyperbolicStep), totalDegreesInCircle)];
    
    // Hyperbolic spiral equation: r = a * (e ^ (b * theta)),
    dataPoint.yValue = [NSNumber numberWithFloat:logarithmicSpiralMaxYValue / (dataIndex + 1.0)];
    
  }
  return dataPoint;
}

@end
