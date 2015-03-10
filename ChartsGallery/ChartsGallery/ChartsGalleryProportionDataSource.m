//
//  ChartsGalleryProportionDataSource.m
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

#import "ChartsGalleryProportionDataSource.h"

@interface ChartsGalleryProportionDataSource()

@property (nonatomic, strong) NSMutableArray *datapoints;

@end

@implementation ChartsGalleryProportionDataSource
- (instancetype)init {
  self = [super init];
  if (self) {
    NSArray *data = @[@22, @32, @14, @6, @19, @7];
    NSArray *labels = @[@"Action", @"Comedy", @"Drama", @"Musical", @"Romance", @"Sci-fi"];
    self.datapoints = [NSMutableArray new];
    for (int i = 0; i < [data count]; i++) {
      SChartRadialDataPoint *dp = [SChartRadialDataPoint new];
      dp.name = labels[i];
      dp.value = data[i];
      [self.datapoints addObject:dp];
    }
  }
  return self;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.datapoints count];
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

- (NSArray *)sChart:(ShinobiChart *)chart dataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.datapoints;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.datapoints[dataIndex];
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  // Should be implemented in subclass
  return nil;
}

@end
