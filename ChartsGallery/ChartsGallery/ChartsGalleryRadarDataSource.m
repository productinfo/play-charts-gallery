//
//  ChartsGalleryRadarDataSource.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 13/11/2014.
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

#import "ChartsGalleryRadarDataSource.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryRadarDataSource ()

@property (nonatomic, strong) NSArray *categories;

@end

@implementation ChartsGalleryRadarDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-radar-data"];
  if (self) {
      self.seriesNames = @[@"Scotland", @"Wales",
                           @"Northern Ireland", @"England"];
      self.categories = @[@"January", @"February", @"March",
                          @"April", @"May", @"June",
                          @"July", @"August", @"September",
                          @"October", @"November", @"December"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartRadialLineSeries *radialSeries = [SChartRadialLineSeries new];
  radialSeries.title = self.seriesNames[index];
  radialSeries.pointsWrapAround = YES;
  radialSeries.style.showFill = YES;
  
  if (index == 0) {
    radialSeries.style.areaColor = [[UIColor shinobiPlayBlueColor] colorWithAlphaComponent:200.0f/255];
  } else if (index == 1) {
    radialSeries.style.areaColor = [[UIColor shinobiPlayGreenColor] colorWithAlphaComponent:200.0f/255];
  } else if (index == 2) {
    radialSeries.style.areaColor = [[UIColor shinobiPlayOrangeColor] colorWithAlphaComponent:200.0f/255];
  } else {
    radialSeries.style.areaColor = [[UIColor shinobiPlayRedColor] colorWithAlphaComponent:200.0f/255];
  }
  
  return radialSeries;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return self.categories[dataIndex];
}

@end
