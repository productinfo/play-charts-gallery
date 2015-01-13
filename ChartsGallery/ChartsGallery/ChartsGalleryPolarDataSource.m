//
//  ChartsGalleryPolarDataSource.m
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

#import "ChartsGalleryPolarDataSource.h"

@interface ChartsGalleryPolarDataSource ()

@property (strong, nonatomic) NSArray *seriesNames;
@property (strong, nonatomic) NSMutableArray *dataCollection;
@property (strong, nonatomic) NSArray *numberOfRotations;
@property (strong, nonatomic) NSArray *degreeStep;

@end

@implementation ChartsGalleryPolarDataSource

- (instancetype)init {
  self = [super init];
  if (self) {
    self.seriesNames = @[@"Archimedean", @"Logarithmic", @"Hyperbolic"];
    self.dataCollection = [NSMutableArray new];
    self.numberOfRotations = @[@3, @3, @5];
    self.degreeStep = @[@5, @5, @10];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartRadialLineSeries *radialSeries = [SChartRadialLineSeries new];
  radialSeries.title = self.seriesNames[index];
  radialSeries.style.lineWidth = @1;
  return radialSeries;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return self.seriesNames.count;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  // Draw the correct number of points to depending on how fast the spirals radius grows
  // relative to the other two spirals and ensure several complete rotations are visible.
  return [self.numberOfRotations[seriesIndex] intValue] * 360 / [self.degreeStep[seriesIndex] intValue] + 1;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  
  SChartDataPoint *dataPoint = [SChartDataPoint new];
  
  if ((seriesIndex == 0) || (seriesIndex == 1)) {
    // X (theta) values are mod totalDegreesInCircle to make the spiral does several full rotations.
    NSInteger theta = dataIndex * [self.degreeStep[seriesIndex] integerValue];
    dataPoint.xValue = @(fmod(theta, 360));
    
    if (seriesIndex == 0) {
      // Archimedean spiral equation: r = a + (b * theta)
      // a = b = 1
      dataPoint.yValue = @(1 + theta);
    } else {
      // Logarithmic spiral equation: r = a * (e ^ (b * theta))
      // a = 1, b = 0.0065
      dataPoint.yValue = @(1 + exp(0.0065 * theta));
    }
  } else {
    // X (theta) values are mod totalDegreesInCircle to make the spiral does several full rotations.
    // X values are reversed so direction of logarithmic spiral matches archimedean and hyperbolic spirals
    // Need to start with |theta| > 0 so we're not trying to plot infinity
    NSInteger theta = dataIndex * [self.degreeStep[seriesIndex] integerValue] + 45;
    dataPoint.xValue = @(360 - fmod(theta, 360));
    
    // Hyperbolic spiral equation: r = a \ theta
    // a = 51000
    dataPoint.yValue = @(51000.f / theta);
  }
  return dataPoint;
}

@end
