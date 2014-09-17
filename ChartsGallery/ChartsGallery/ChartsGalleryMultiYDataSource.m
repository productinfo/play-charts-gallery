//
//  ChartsGalleryMultiYDataSource.m
//  ChartsGallery
//
//  Created by Alison Clarke on 16/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryMultiYDataSource.h"

@implementation ChartsGalleryMultiYDataSource

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Should be implemented in subclass
  return nil;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartMultiYDataPoint *dp = [[SChartMultiYDataPoint alloc] init];
  dp.xValue = [self xValueAtIndex:dataIndex forSeriesAtIndex:seriesIndex];
  dp.yValues = [self yValuesAtIndex:dataIndex forSeriesAtIndex:seriesIndex];
  return dp;
}

@end
