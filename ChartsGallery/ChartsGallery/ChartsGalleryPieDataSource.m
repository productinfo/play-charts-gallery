//
//  PieChartDataSource.m
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryPieDataSource.h"

@implementation ChartsGalleryPieDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartPieSeries *series = [SChartPieSeries new];
  series.title = [NSString stringWithFormat:@"Series %ld", (long)index];
  series.selectedPosition = @0;
  series.innerRadius = 0.f;
  series.labelFormatString = @"%.0f%%";
  series.gesturePanningEnabled = YES;
  series.selectedPosition = 0;
  series.style.protrusion = 0;
  series.selectedStyle.protrusion = 50;
  return series;
}

@end
