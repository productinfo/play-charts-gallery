//
//  ChartsGalleryRadarDataSource.m
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

#import "ChartsGalleryMultivariateDataSource.h"

@implementation ChartsGalleryMultivariateDataSource

- (instancetype)init {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChartsGallery-radar-data" ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.data = [[NSDictionary alloc] initWithContentsOfFile:path];
      self.seriesTitles = [self.data allKeys];
      self.categories = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    }
  }
  return self;
}

#pragma mark - SChartDataSource methods

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return self.data.count;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.categories.count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Should be implemented in subclass
  return nil;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  // Should be implemented in subclass
  return nil;
}

@end
