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

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-column-data"];
  if (self) {
    self.seriesNames = @[@"reading", @"math", @"writing"];
    self.categories = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartBarSeries *series = [SChartBarSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.animationEnabled = YES;
  series.stackIndex = @1;
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // This is a bar chart, so the x-value is the actual data
  return self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
}

- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // This is a bar chart, so the y-value is the category
  return self.categories[dataIndex];
}

@end
