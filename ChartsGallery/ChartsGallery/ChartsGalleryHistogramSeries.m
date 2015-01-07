//
//  ChartsGalleryColumnSeries.m
//  ChartsGallery
//
//  Created by Alison Clarke on 15/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryHistogramSeries.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

static NSArray *histogramColors;

@implementation ChartsGalleryHistogramSeries

+ (void)initialize {
  histogramColors = [UIColor shinobiPlayColorArray];
}


- (SChartColumnSeriesStyle *)styleForPoint:(id<SChartData>)point {
  
  SChartColumnSeriesStyle *newStyle = [super styleForPoint:point];
  
  int xValue = [[point sChartXValue] intValue];
  newStyle.showAreaWithGradient = NO;
  newStyle.areaColor = histogramColors[(xValue/5)%histogramColors.count];
  
  return newStyle;
}

@end
