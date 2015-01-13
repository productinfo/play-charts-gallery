//
//  ChartsGalleryColumnDataSource.m
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

#import "ChartsGalleryColumnDataSource.h"

@interface ChartsGalleryColumnDataSource()

@property (nonatomic,strong) NSArray *categories;

@end

@implementation ChartsGalleryColumnDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-column-data"];
  if (self) {
    self.seriesNames = @[@"reading", @"math", @"writing"];
    self.categories = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [SChartColumnSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.categories[dataIndex];
}

@end
