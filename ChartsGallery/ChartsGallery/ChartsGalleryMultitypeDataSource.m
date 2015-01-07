//
//  MultiChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryMultitypeDataSource.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryMultitypeDataSource()

@property (strong, nonatomic) NSArray *seriesTitles;
@property (strong, nonatomic) NSDateComponents *dateComponents;
@property (strong, nonatomic) NSCalendar *calendar;

@end

@implementation ChartsGalleryMultitypeDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-multitype-data"];
  if (self) {
    self.seriesTitles = @[@"Rainfall (mm)", @"Max/Min Temp (°C)"];
    
    self.dateComponents = [NSDateComponents new];
    [self.dateComponents setDay:1];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  }
  return self;
}

// Show about a third of the data in the initial range
- (SChartDateRange *)getInitialDateRange {
  return [[SChartDateRange alloc] initWithDateMinimum:[self convertIndexToDate:0]
                                       andDateMaximum:[self convertIndexToDate:(self.dataCollection.count/3)]];
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 2;
}

- (SChartAxis *)sChart:(ShinobiChart *)chart yAxisForSeriesAtIndex:(NSInteger)index {
  if (index == 0) {
    // Rainfall series, so we need the secondary axis
    return chart.allYAxes[1];
  } else {
    // Temperature series, so we use the primary axis
    return chart.yAxis;
  }
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartSeries *series = nil;
  if(index == 0) {
    // Rainfall: column series
    SChartColumnSeries *columnSeries = [SChartColumnSeries new];
    columnSeries.style.areaColor = [UIColor shinobiPlayBlueColor];
    columnSeries.style.showAreaWithGradient = NO;
    series = columnSeries;
  } else {
    // Temperature: band series
    SChartBandSeries *bandSeries = [SChartBandSeries new];
    bandSeries.style.lineWidth = @2;
    bandSeries.style.lineColorHigh = [UIColor shinobiPlayRedColor];
    bandSeries.style.lineColorLow = [UIColor shinobiPlayOrangeColor];
    bandSeries.style.areaColorNormal = [[[UIColor shinobiPlayRedColor] shinobiLightColor]
                                        colorWithAlphaComponent:0.5];
    bandSeries.style.areaColorInverted = bandSeries.style.areaColorNormal;
    series = bandSeries;
  }
  series.crosshairEnabled = YES;
  series.title = self.seriesTitles[index];
  return series;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex
        forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dp;
  
  if (seriesIndex == 0) {
    // Rainfall, simply get y value from dataCollection
    dp = [SChartDataPoint new];
    dp.yValue = self.dataCollection[dataIndex][@"mm_rain"];
  } else {
    // Temperature is a band, so needs a multi data point
    SChartMultiYDataPoint *mydp = [SChartMultiYDataPoint new];
    mydp.yValues = [@{SChartBandKeyLow : self.dataCollection[dataIndex][@"min_temp"],
                      SChartBandKeyHigh : self.dataCollection[dataIndex][@"max_temp"]}
                    mutableCopy];
    dp = mydp;
  }
  
  dp.xValue = [self convertIndexToDate:dataIndex];
  return dp;
}

- (NSDate *)convertIndexToDate:(NSInteger)dataIndex {
  // Data in plist is monthly data starting at January 2000, so we use the dataIndex to
  // calculate the month and year
  self.dateComponents.month = (dataIndex%12)+1;
  self.dateComponents.year = dataIndex/12 + 2000;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
