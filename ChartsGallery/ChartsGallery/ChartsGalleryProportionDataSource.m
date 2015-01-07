//
//  ShinobiLibraryProportionDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryProportionDataSource.h"

@interface ChartsGalleryProportionDataSource()

@property (nonatomic, strong) NSMutableArray *datapoints;

@end

@implementation ChartsGalleryProportionDataSource
- (instancetype)init {
  self = [super init];
  if (self) {
    NSArray *data = @[@22, @32, @14, @6, @19, @7];
    NSArray *labels = @[@"Action", @"Comedy", @"Drama", @"Musical", @"Romance", @"Sci-fi"];
    self.datapoints = [NSMutableArray new];
    for (int i = 0; i < [data count]; i++) {
      SChartRadialDataPoint *dp = [SChartRadialDataPoint new];
      dp.name = labels[i];
      dp.value = data[i];
      if (i == 0) {
        dp.selected = YES;
      }
      [self.datapoints addObject:dp];
    }
  }
  return self;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.datapoints count];
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

- (NSArray *)sChart:(ShinobiChart *)chart dataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.datapoints;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.datapoints[dataIndex];
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  // Should be implemented in subclass
  return nil;
}

@end
