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

@end

@implementation ChartsGalleryStackedColumnDataSource

- (id)init {
  self = [super initWithDataFromFile:@"ChartsGallery-stackedColumn-data"];
  if (self) {
    self.seriesNames = @[@"q1", @"q2", @"q3", @"q4"];
    self.categories = @[@"Ford", @"Vauxhall", @"Peugeot", @"VW", @"Renault", @"BMW",
                        @"Citroën", @"Nissan", @"Toyota", @"Fiat", @"Mercedes", @"Honda",
                        @"Rover"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [SChartColumnSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.animationEnabled = YES;
  series.stackIndex = @1;
  return series;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
    SChartDataPoint *dp = [[SChartDataPoint alloc] init];
    dp.yValue = @([self.dataCollection[dataIndex][self.seriesNames[seriesIndex]] floatValue] / 1000000.f);
    dp.xValue = self.categories[dataIndex];
    return dp;
}
@end
