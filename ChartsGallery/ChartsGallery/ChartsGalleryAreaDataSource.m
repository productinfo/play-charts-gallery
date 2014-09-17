//
//  AreaChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryAreaDataSource.h"

@implementation ChartsGalleryAreaDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-area-data"];
  if (self) {
    self.seriesNames = @[@"north", @"east", @"south", @"west"];
    self.dateComponents.month = 4;
    self.dateComponents.year = 2011;
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.style.showFill = YES;
  series.style.lineWidth = @2;
  series.baseline = @0;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.day = dataIndex + 1;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
