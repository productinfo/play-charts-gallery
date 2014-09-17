//
//  ColumnChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryScatterDataSource.h"

@interface ChartsGalleryScatterDataSource()

@property (nonatomic, strong) NSDictionary *dataCollection;
@property (nonatomic, strong) NSArray *seriesNames;

@end

@implementation ChartsGalleryScatterDataSource

- (instancetype)init {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChartsGallery-scatter-data" ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.dataCollection = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    }
    self.seriesNames = @[@"female", @"male"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartScatterSeries *series = [SChartScatterSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.style.pointStyle.radius = @15;
  return series;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 2;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.dataCollection[self.seriesNames[seriesIndex]] count];
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dp = [SChartDataPoint new];
  dp.xValue = self.dataCollection[self.seriesNames[seriesIndex]][dataIndex][@"weight"];
  dp.yValue = self.dataCollection[self.seriesNames[seriesIndex]][dataIndex][@"height"];
  return dp;
}

@end
