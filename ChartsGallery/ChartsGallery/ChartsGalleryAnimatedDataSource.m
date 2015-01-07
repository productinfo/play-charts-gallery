//
//  ChartsGalleryAnimatedDataSource.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 27/11/2014.
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

#import "ChartsGalleryAnimatedDataSource.h"
#import "ChartsGalleryCustomColumnSeries.h"
#import "ChartsGalleryCustomBandSeries.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryAnimatedDataSource ()

@property (nonatomic,strong) NSArray *seriesTitles;
@property (nonatomic,strong) NSArray *categories;

@end

@implementation ChartsGalleryAnimatedDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartSeries *series = nil;
  if(index == 0) {
    // Rainfall: column series
    ChartsGalleryCustomColumnSeries *columnSeries = [[ChartsGalleryCustomColumnSeries alloc]
                                                     initWithChart:chart];
    columnSeries.style.areaColor = [UIColor shinobiPlayBlueColor];
    columnSeries.style.showAreaWithGradient = NO;
    series = columnSeries;
  } else {
    // Temperature: band series
    ChartsGalleryCustomBandSeries *bandSeries = [[ChartsGalleryCustomBandSeries alloc]
                                                 initWithChart:chart];
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
  series.animationEnabled = YES;
  series.entryAnimation.duration = @1;
  series.exitAnimation = [series.entryAnimation copy];
  return series;
}

@end
