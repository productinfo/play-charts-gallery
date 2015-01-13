//
//  ChartsGalleryBandDataSource.h
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

#import "ChartsGalleryBandDataSource.h"

@interface ChartsGalleryBandDataSource ()

@property (nonatomic,strong) NSDateFormatter *format;

@end


@implementation ChartsGalleryBandDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-band-data"];
  if (self) {
    self.format = [NSDateFormatter new];
    [self.format setDateFormat:@"dd/MM/yyyy"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartBandSeries *series = [[SChartBandSeries alloc] init];
  series.title = @"Open/Close";
  series.style.lineWidth = @2;
  series.style.showFill = YES;
  
  SChartTheme *theme = [SChartiOS7Theme new];
  series.style.lineColorHigh = [theme lineSeriesStyleForSeriesAtIndex:1 selected:NO].lineColor;
  series.style.lineColorLow = [theme lineSeriesStyleForSeriesAtIndex:2 selected:NO].lineColor;
  series.style.areaColorNormal = [[theme lineSeriesStyleForSeriesAtIndex:1 selected:NO].areaColor colorWithAlphaComponent:.6f];
  series.style.areaColorInverted = [[theme lineSeriesStyleForSeriesAtIndex:2 selected:NO].areaColor colorWithAlphaComponent:.6f];
  return series;
}

- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.format dateFromString:self.dataCollection[dataIndex][@"date"]];
}

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  return [@{SChartBandKeyLow : self.dataCollection[dataIndex][@"open"],
            SChartBandKeyHigh : self.dataCollection[dataIndex][@"close"]}
          mutableCopy];
}

@end
