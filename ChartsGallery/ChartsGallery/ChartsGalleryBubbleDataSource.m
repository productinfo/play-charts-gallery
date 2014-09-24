//
//  BubbleChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBubbleDataSource.h"
#import "ChartsGalleryBubbleSeries.h"

@implementation ChartsGalleryBubbleDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-bubble-data"];
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  return [ChartsGalleryBubbleSeries new];
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection.count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartBubbleDataPoint *dp = [SChartBubbleDataPoint new];
  dp.xValue = self.dataCollection[dataIndex][@"longitude"];
  dp.yValue = self.dataCollection[dataIndex][@"latitude"];
  dp.area = [self.dataCollection[dataIndex][@"population"] floatValue];
  return dp;
}

- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series {
  CGPoint center = label.center;
  label.text = [self.dataCollection[dataPoint.index][@"country"] capitalizedString];
  label.font = [UIFont systemFontOfSize:10];
  [label sizeToFit];
  label.center = center;
}

@end
