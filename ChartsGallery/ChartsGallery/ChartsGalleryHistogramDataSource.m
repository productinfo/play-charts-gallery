//
//  HistogramDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryHistogramDataSource.h"
#import "ChartsGalleryHistogramSeries.h"

@implementation ChartsGalleryHistogramDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-histogram-data"];
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [ChartsGalleryHistogramSeries new];
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return @([self.dataCollection[dataIndex][0] floatValue] + 2.5f);
}

- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection[dataIndex][1];
}

@end
