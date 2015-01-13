//
//  ChartsGalleryStepDataSource.m
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

#import "ChartsGalleryStepDataSource.h"

@implementation ChartsGalleryStepDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-step-data"];
  if (self) {
    self.seriesNames = @[@"usd", @"eur", @"gbp", @"aud"];
    self.dateComponents.day = 1;
    self.dateComponents.month = 1;
  }
  return self;
}

// Show all the data plus an extra day (to avoid the end line being cut off)
- (SChartDateRange *)getInitialDateRange {
  return [[SChartDateRange alloc] initWithDateMinimum:[self convertIndexToDate:0]
                                       andDateMaximum:[self convertIndexToDate:self.dataCollection.count]];
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartStepLineSeries *series = [SChartStepLineSeries new];
  series.title = [self.seriesNames[index] uppercaseString];
  series.style.lineWidth = @2;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self convertIndexToDate:dataIndex];
}

- (NSDate *)convertIndexToDate:(NSInteger)dataIndex {
  // Data in plist is yearly data starting at 1979, so we use the dataIndex to
  // calculate the year
  self.dateComponents.year = dataIndex + 1979;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
