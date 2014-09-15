//
//  StackedAreaChartDataSource.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedAreaDataSource.h"

@interface ChartsGalleryStackedAreaDataSource()

@property (nonatomic,strong) NSArray *seriesNames;
@property (nonatomic,strong) NSArray *dataCollection;
@property (strong, nonatomic) NSDateComponents *dateComponents;
@property (strong, nonatomic) NSCalendar *calendar;

@end

@implementation ChartsGalleryStackedAreaDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
    SChartLineSeries *series = (SChartLineSeries *)[super sChart:chart seriesAtIndex:index];
    series.stackIndex = @1;
    return series;
}

@end