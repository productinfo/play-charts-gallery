//
//  OHLCChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryOHLCDataSource.h"

@interface ChartsGalleryOHLCDataSource ()

@property (nonatomic, strong) NSDate *startDate;

@end


@implementation ChartsGalleryOHLCDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-ohlc-data"];
  if (self) {
    // Data in plist is daily data starting at 1st October 2012, so create start date
    self.dateComponents.year = 2012;
    self.dateComponents.month = 10;
    self.dateComponents.day = 1;
    self.startDate = [self.calendar dateFromComponents:self.dateComponents];
    
    // Reset dateComponents so we can use it for adding days later on
    self.dateComponents.year = 0;
    self.dateComponents.month = 0;
    self.dateComponents.day = 0;
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartOHLCSeries *series = [[SChartOHLCSeries alloc] init];
  series.style.trunkWidth = @3;
  series.style.armWidth = @3;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Data in plist is daily data, so add dataIndex days to the start date
  self.dateComponents.day = dataIndex;
  return [self.calendar dateByAddingComponents:self.dateComponents toDate:self.startDate options:0];
}

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  // Data in plist is daily data, so add dataIndex days to the start date
  self.dateComponents.day = dataIndex;
  return [@{SChartOHLCKeyLow : self.dataCollection[dataIndex][@"low"],
            SChartOHLCKeyHigh : self.dataCollection[dataIndex][@"high"],
            SChartOHLCKeyOpen : self.dataCollection[dataIndex][@"open"],
            SChartOHLCKeyClose : self.dataCollection[dataIndex][@"close"]}
          mutableCopy];
}

@end
