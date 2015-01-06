//
//  ChartsGalleryCrosshairDataSource.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 16/12/2014.
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

#import "ChartsGalleryCrosshairDataSource.h"

@implementation ChartsGalleryCrosshairDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-running-data"];
  if (self) {
    self.seriesNames = @[@"Heart Rate"];
    self.dateComponents.minute = 1;
  }
  return self;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  self.dateComponents.minute = dataIndex;
  return [self.calendar dateFromComponents:self.dateComponents];
}

#pragma mark - SChartDatasource methods
- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = [SChartLineSeries new];
  series.title = self.seriesNames[index];
  series.style.lineColor = [UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:1];
  series.crosshairEnabled = YES;
  series.style.lineWidth = @4;
  series.style.pointStyle.showPoints = YES;
  series.style.pointStyle.radius = @15;
  series.style.pointStyle.innerRadius = @8;
  series.style.pointStyle.color = series.style.lineColor;
  return series;
}

@end
