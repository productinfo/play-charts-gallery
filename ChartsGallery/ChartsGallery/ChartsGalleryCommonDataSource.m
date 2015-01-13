//
//  ChartsGalleryCommonDataSource.m
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

#import "ChartsGalleryCommonDataSource.h"

@implementation ChartsGalleryCommonDataSource

- (instancetype)initWithDataFromFile:(NSString *)filename {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.dataCollection = [[NSMutableArray alloc] initWithContentsOfFile:path];
    }
  }
  return self;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Should be implemented in subclass
  return nil;
}

- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  if (self.seriesNames != nil) {
    return self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  } else {
    // Should be implemented in subclass
    return nil;
  }
}

#pragma mark - SChartDatasource methods
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dp = [SChartDataPoint new];
  dp.xValue = [self xValueAtIndex:dataIndex forSeriesAtIndex:seriesIndex];
  dp.yValue = [self yValueAtIndex:dataIndex forSeriesAtIndex:seriesIndex];
  return dp;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  if (self.seriesNames == nil) {
    return 1;
  } else {
    return self.seriesNames.count;
  }
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection.count;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  // Should be implemented in subclass
  return nil;
}

@end
