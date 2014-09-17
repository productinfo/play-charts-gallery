//
//  LineChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStepDataSource.h"

@implementation ChartsGalleryStepDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-step-data"];
  if (self) {
    self.seriesNames = @[@"usd", @"eur", @"gbp", @"aud"];
    self.dateComponents.day = 1;
    self.dateComponents.month = 1;
  }
  return self;
}

// Show all the data plus an extra day (to avoid the end line being cut off)
- (SChartDateRange *)getInitialDateRange {
  return [[SChartDateRange alloc] initWithDateMinimum:[self convertIndexToDate:0]
                                       andDateMaximum:[self convertIndexToDate:self.dataCollection.count]];
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartStepLineSeries *series = [SChartStepLineSeries new];
  series.title = [self.seriesNames[index] uppercaseString];
  series.style.lineWidth = @2;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self convertIndexToDate:dataIndex];
}

- (NSDate *)convertIndexToDate:(NSInteger)dataIndex {
  // Data in plist is yearly data starting at 1979, so we use the dataIndex to
  // calculate the year
  self.dateComponents.year = dataIndex + 1979;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
