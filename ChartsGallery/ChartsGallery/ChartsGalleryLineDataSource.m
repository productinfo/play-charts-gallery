//
//  ChartsGalleryLineDataSource.m
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

#import "ChartsGalleryLineDataSource.h"

@interface ChartsGalleryLineDataSource()

@property (nonatomic,strong) NSArray *seriesTitles;

@end

@implementation ChartsGalleryLineDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-line-data"];
  if (self) {
    self.seriesNames = @[@"boston", @"seattle", @"miami", @"la"];
    self.seriesTitles = @[@"Boston", @"Seattle", @"Miami", @"LA"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = self.seriesTitles[index];
  series.style.lineWidth = @2;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.day = [self.dataCollection[dataIndex][@"day"] integerValue];
  self.dateComponents.month = [self.dataCollection[dataIndex][@"month"] integerValue];
  self.dateComponents.year = [self.dataCollection[dataIndex][@"year"] integerValue];
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
