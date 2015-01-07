//
//  ChartsGalleryDonutDataSource.m
//  ChartsGallery
//
//  Created by Alison Clarke on 02/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryDonutDataSource.h"

@interface ChartsGalleryDonutDataSource ()

@end

@implementation ChartsGalleryDonutDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartDonutSeries *series = [SChartDonutSeries new];
  series.title = [NSString stringWithFormat:@"Series %ld", (long)index];
  series.style.showFlavour = YES;
  series.style.showLabels = YES;
  series.selectedPosition = @0;
  series.labelFormatString = @"%.0f%%";
  series.gesturePanningEnabled = YES;
  series.style.initialRotation = @(-0.22 * M_PI);
  series.style.protrusion = 0;
  series.selectedStyle.protrusion = 20;
  return series;
}


@end
