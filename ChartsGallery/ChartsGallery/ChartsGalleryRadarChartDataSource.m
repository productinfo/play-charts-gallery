//
//  ChartsGalleryRadarChartDataSource.m
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

#import "ChartsGalleryRadarChartDataSource.h"

@interface ChartsGalleryRadarChartDataSource ()

@property (nonatomic, strong) NSArray *categories;

@end

@implementation ChartsGalleryRadarChartDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-radar-data"];
  if (self) {
      self.seriesNames = @[@"England", @"Scotland", @"Wales",
                           @"Northern Ireland"];
      self.categories = @[@"January", @"February", @"March",
                          @"April", @"May", @"June",
                          @"July", @"August", @"September",
                          @"October", @"November", @"December"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartRadialLineSeries *radialSeries = [SChartRadialLineSeries new];
  radialSeries.title = self.seriesNames[index];
  radialSeries.pointsWrapAround = YES;
  return radialSeries;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dataPoint = [SChartDataPoint new];
  dataPoint.xValue = self.categories[dataIndex];
  dataPoint.yValue = self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  return dataPoint;
}

@end
