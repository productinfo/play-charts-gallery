//
//  ShinobiLibraryCommonChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryCommonDataSource.h"

@implementation ChartsGalleryCommonDataSource

- (instancetype)initWithDataFromFile:(NSString *)filename {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.dataCollection = [[NSMutableArray alloc] initWithContentsOfFile:path];
    }
  }
  return self;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Should be implemented in subclass
  return nil;
}

#pragma mark - SChartDatasource methods
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dp = [SChartDataPoint new];
  dp.xValue = [self xValueAtIndex:dataIndex forSeriesAtIndex:seriesIndex];
  dp.yValue = self.dataCollection[dataIndex][self.seriesNames[seriesIndex]];
  return dp;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return self.seriesNames.count;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection.count;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  // Should be implemented in subclass
  return nil;
}

@end
