//
//  ColumnChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
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
  series.animationEnabled = YES;
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.categories[dataIndex];
}

@end
