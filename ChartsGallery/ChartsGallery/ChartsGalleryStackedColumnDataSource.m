//
//  ChartsGalleryStackedColumnDataSource.h
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

#import "ChartsGalleryStackedColumnDataSource.h"

@interface ChartsGalleryStackedColumnDataSource()

@property (nonatomic,strong) NSArray *categories;
@property (nonatomic,strong) NSArray *seriesTitles;

@end

@implementation ChartsGalleryStackedColumnDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-stackedColumn-data"];
  if (self) {
    self.seriesNames = @[@"q1", @"q2", @"q3", @"q4"];
    self.seriesTitles = @[@"Quarter 1", @"Quarter 2", @"Quarter 3", @"Quarter 4"];
    self.categories = @[@"Ford", @"Vauxhall", @"Peugeot", @"VW", @"Renault", @"BMW",
                        @"Citroën", @"Nissan", @"Toyota", @"Fiat", @"Mercedes", @"Honda",
                        @"Rover"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [SChartColumnSeries new];
  series.title = self.seriesTitles[index];
  series.stackIndex = @1;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.categories[dataIndex];
}

- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // We want to display data in 100,000s
  return @([self.dataCollection[dataIndex][self.seriesNames[seriesIndex]] floatValue] / 100000.f);
}

@end
