//
//  ChartsGalleryAreaDataSource.m
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

#import "ChartsGalleryAreaDataSource.h"

@implementation ChartsGalleryAreaDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-area-data"];
  if (self) {
    self.seriesNames = @[@"north", @"east", @"south", @"west"];
    self.dateComponents.month = 4;
    self.dateComponents.year = 2011;
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.style.showFill = YES;
  series.style.lineWidth = @2;
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.day = dataIndex + 1;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
