//
//  StackLineChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedLineDataSource.h"

@interface ChartsGalleryStackedLineDataSource()

@property (nonatomic,strong) NSArray *seriesTitles;
@property (nonatomic,strong) NSDateFormatter *format;

@end

@implementation ChartsGalleryStackedLineDataSource

- (id)init {
  self = [super initWithDataFromFile:@"ChartsGallery-stackedLine-data"];
  if (self) {
    self.seriesNames = [[NSArray alloc] initWithObjects:@"food", @"nonfood", @"online", @"other", nil];
    self.seriesTitles = [[NSArray alloc] initWithObjects:@"Food", @"Non-Food", @"Online", @"Other", nil];
    
    self.format = [NSDateFormatter new];
    [self.format setDateFormat:@"yyyy MMM"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [[SChartLineSeries alloc] init];
  series.title = self.seriesTitles[index];
  series.style.lineWidth = @2;
  series.stackIndex = @1;
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.format dateFromString:self.dataCollection[dataIndex][@"month"]];
}

@end
