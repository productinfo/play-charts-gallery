//
//  ColumnChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
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
