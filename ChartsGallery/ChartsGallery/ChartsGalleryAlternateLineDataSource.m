//
//  AlternateLineChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 30/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAlternateLineDataSource.h"

@implementation ChartsGalleryAlternateLineDataSource

- (id)init {
  self = [super initWithDataFromFile:@"ChartsGallery-alternateLine-data"];
  if (self) {
    self.seriesNames = @[@"John", @"Paul", @"George", @"Ringo"];
    self.dateComponents.month = 2;
    self.dateComponents.year = 1964;
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = self.seriesNames[index];
  series.style.lineWidth = @2;
  series.style.pointStyle.showPoints = YES;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.day = dataIndex + 1;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
