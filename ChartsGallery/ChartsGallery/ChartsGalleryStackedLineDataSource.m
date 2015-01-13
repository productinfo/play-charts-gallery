//
//  ChartsGalleryStackedLineDataSource.m
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

#import "ChartsGalleryStackedLineDataSource.h"

@interface ChartsGalleryStackedLineDataSource()

@property (nonatomic,strong) NSArray *seriesTitles;
@property (nonatomic,strong) NSDateFormatter *format;

@end

@implementation ChartsGalleryStackedLineDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-stackedLine-data"];
  if (self) {
    self.seriesNames = [[NSArray alloc] initWithObjects:@"food", @"nonfood", @"online", @"other", nil];
    self.seriesTitles = [[NSArray alloc] initWithObjects:@"Food", @"Non-Food", @"Online", @"Other", nil];
    
    self.format = [NSDateFormatter new];
    [self.format setDateFormat:@"yyyy MMM"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [[SChartLineSeries alloc] init];
  series.title = self.seriesTitles[index];
  series.style.lineWidth = @2;
  series.stackIndex = @1;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.format dateFromString:self.dataCollection[dataIndex][@"month"]];
}

@end
