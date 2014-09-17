//
//  BandChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBandDataSource.h"

@interface ChartsGalleryBandDataSource ()

@property (nonatomic,strong) NSDateFormatter *format;

@end


@implementation ChartsGalleryBandDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-band-data"];
  if (self) {
    self.format = [NSDateFormatter new];
    [self.format setDateFormat:@"dd/MM/yyyy"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartBandSeries *series = [[SChartBandSeries alloc] init];
  series.style.lineWidth = @2;
  series.style.showFill = YES;
  
  SChartTheme *theme = [SChartiOS7Theme new];
  series.style.lineColorHigh = [theme lineSeriesStyleForSeriesAtIndex:1 selected:NO].lineColor;
  series.style.lineColorLow = [theme lineSeriesStyleForSeriesAtIndex:2 selected:NO].lineColor;
  series.style.areaColorNormal = [[theme lineSeriesStyleForSeriesAtIndex:1 selected:NO].areaColor colorWithAlphaComponent:.6f];
  series.style.areaColorInverted = [[theme lineSeriesStyleForSeriesAtIndex:2 selected:NO].areaColor colorWithAlphaComponent:.6f];
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.format dateFromString:self.dataCollection[dataIndex][@"date"]];
}

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [@{SChartBandKeyLow : self.dataCollection[dataIndex][@"close"],
            SChartBandKeyHigh : self.dataCollection[dataIndex][@"open"]}
          mutableCopy];
}

@end
