//
//  ChartsGalleryAnimatedDataSource.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 27/11/2014.
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

#import "ChartsGalleryAnimatedDataSource.h"

@interface ChartsGalleryAnimatedDataSource ()

@property (nonatomic,strong) NSArray *seriesTitles;
@property (nonatomic,strong) NSArray *categories;

@end

@implementation ChartsGalleryAnimatedDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-bar-data"];
  if (self) {
    self.seriesNames = @[@"under_34",@"3544",@"4554", @"55"];
    self.seriesTitles = @[@"Under 34", @"35-44", @"45-54", @"55"];
    self.categories = @[@"Clothing", @"Media", @"Household", @"Books", @"Tickets",
                        @"Travel", @"Hotels", @"Games", @"Electricals", @"Food",
                        @"Investments", @"Telecoms", @"IT", @"e-learning", @"Medicine",
                        @"Other"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [SChartColumnSeries new];
  series.title = self.seriesTitles[index];
  series.animationEnabled = YES;
  series.exitAnimation = [series.entryAnimation copy];
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // This is a bar chart, so the x-value is the category
  return self.categories[dataIndex];
}

- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
}

@end
