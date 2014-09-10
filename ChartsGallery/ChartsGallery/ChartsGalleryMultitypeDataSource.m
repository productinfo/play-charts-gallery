//
//  MultiChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryMultitypeDataSource.h"

@interface ChartsGalleryMultitypeDataSource()

@property (strong, nonatomic) NSArray *seriesTitles;
@property (strong, nonatomic) NSDateComponents *dateComponents;
@property (strong, nonatomic) NSCalendar *calendar;

@end

@implementation ChartsGalleryMultitypeDataSource

- (id)init {
  self = [super initWithDataFromFile:@"ChartsGallery-multitype-data"];
  if (self) {
    self.seriesNames = @[@"mm_rain", @"max_temp", @"min_temp"];
    self.seriesTitles = @[@"Rainfall (mm)", @"Max Temp (°C)", @"Min Temp (°C)"];
    
    self.dateComponents = [NSDateComponents new];
    [self.dateComponents setDay:1];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  }
  return self;
}

// Show about a third of the data in the initial range
- (SChartDateRange *)getInitialDateRange {
  return [[SChartDateRange alloc] initWithDateMinimum:[self convertIndexToDate:0]
                                       andDateMaximum:[self convertIndexToDate:(self.dataCollection.count/3)]];
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
    series = [SChartColumnSeries new];
  } else {
    // Temperature: line series
    SChartLineSeries *ls = [SChartLineSeries new];
    ls.style.lineWidth = @2;
    series = ls;
  }
  series.crosshairEnabled = YES;
  series.title = self.seriesTitles[index];
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self convertIndexToDate:dataIndex];
}

- (NSDate *)convertIndexToDate:(NSInteger)dataIndex {
  // Data in plist is monthly data starting at January 2000, so we use the dataIndex to
  // calculate the month and year
  self.dateComponents.month = (dataIndex%12)+1;
  self.dateComponents.year = dataIndex/12 + 2000;
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
