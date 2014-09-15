//
//  StackedBarChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedBarDataSource.h"

@interface ChartsGalleryStackedBarDataSource()

@property (nonatomic,strong) NSArray *categories;

@end

@implementation ChartsGalleryStackedBarDataSource

- (id)init {
  self = [super initWithDataFromFile:@"ChartsGallery-column-data"];
  if (self) {
    self.seriesNames = @[@"reading", @"math", @"writing"];
    self.categories = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
  SChartBarSeries *series = [SChartBarSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.animationEnabled = YES;
  series.stackIndex = @1;
  series.baseline = @0;
  return series;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
  // This is a bar chart, so the category is the y-value and the actual data is the x-value
  SChartDataPoint *dp = [[SChartDataPoint alloc] init];
  dp.xValue = self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  dp.yValue = self.categories[dataIndex];
  return dp;
}


@end
