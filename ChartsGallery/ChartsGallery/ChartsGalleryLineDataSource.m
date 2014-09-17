//
//  LineChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryLineDataSource.h"

@interface ChartsGalleryLineDataSource()

@property (nonatomic,strong) NSArray *seriesTitles;

@end

@implementation ChartsGalleryLineDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-line-data"];
  if (self) {
    self.seriesNames = @[@"la", @"boston", @"seattle", @"miami",];
    self.seriesTitles = @[@"LA", @"Boston", @"Seattle", @"Miami"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = self.seriesTitles[index];
  series.style.lineWidth = @2;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.day = [self.dataCollection[dataIndex][@"day"] integerValue];
  self.dateComponents.month = [self.dataCollection[dataIndex][@"month"] integerValue];
  self.dateComponents.year = [self.dataCollection[dataIndex][@"year"] integerValue];
  return [self.calendar dateFromComponents:self.dateComponents];
}

@end
