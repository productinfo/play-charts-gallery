//
//  CandlestickChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryCandlestickDataSource.h"

@implementation ChartsGalleryCandlestickDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartCandlestickSeries *series = [[SChartCandlestickSeries alloc] init];
  return series;
}

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [@{SChartCandlestickKeyLow : self.dataCollection[dataIndex][@"low"],
            SChartCandlestickKeyHigh : self.dataCollection[dataIndex][@"high"],
            SChartCandlestickKeyOpen : self.dataCollection[dataIndex][@"open"],
            SChartCandlestickKeyClose : self.dataCollection[dataIndex][@"close"]}
          mutableCopy];
}


@end
