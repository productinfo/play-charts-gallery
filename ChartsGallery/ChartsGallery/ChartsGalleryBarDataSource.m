//
//  BarChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBarDataSource.h"

@interface ChartsGalleryBarDataSource()

@property (nonatomic,strong) NSArray *seriesTitles;
@property (nonatomic,strong) NSArray *categories;

@end

@implementation ChartsGalleryBarDataSource

- (id)init {
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
  SChartBarSeries *series = [SChartBarSeries new];
  series.title = self.seriesTitles[index];
  series.baseline = @0;
  return series;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // This is a bar chart, so the category is the y-value and the actual data is the x-value
  SChartDataPoint *dp = [[SChartDataPoint alloc] init];
  dp.xValue = self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  dp.yValue = self.categories[dataIndex];
  return dp;
}

@end
