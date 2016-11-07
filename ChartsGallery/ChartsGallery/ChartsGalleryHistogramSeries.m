//
//  ChartsGalleryHistogramSeries.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ChartsGalleryHistogramSeries.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

static NSArray *histogramColors;

@implementation ChartsGalleryHistogramSeries

+ (void)initialize {
  histogramColors = [UIColor shinobiPlayColorArray];
}

- (SChartColumnSeriesStyle *)styleForPoint:(id<SChartData>)point {
  
  SChartColumnSeriesStyle *newStyle = (SChartColumnSeriesStyle *)[super styleForPoint:point];
  
  int xValue = [[point sChartXValue] intValue];
  newStyle.showAreaWithGradient = NO;
  newStyle.areaColor = histogramColors[(xValue/5)%histogramColors.count];
  
  return newStyle;
}

@end
