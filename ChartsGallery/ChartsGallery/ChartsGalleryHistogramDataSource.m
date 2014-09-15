//
//  HistogramDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryHistogramDataSource.h"
#import "ChartsGalleryHistogramSeries.h"

@interface ChartsGalleryHistogramDataSource()

@property (nonatomic, strong) NSArray *dataCollection;

@end

@implementation ChartsGalleryHistogramDataSource

- (instancetype)init {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChartsGallery-histogram-data" ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.dataCollection = [[NSMutableArray alloc] initWithContentsOfFile:path];
    }
  }
  return self;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection.count;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartColumnSeries *series = [ChartsGalleryHistogramSeries new];
  return series;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
  SChartDataPoint *fixedData = [SChartDataPoint new];
  fixedData.xValue = @([self.dataCollection[dataIndex][0] floatValue] + 2.5f);
  fixedData.yValue = self.dataCollection[dataIndex][1];
  return fixedData;
}

@end
