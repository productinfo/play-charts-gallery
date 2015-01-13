//
//  ChartsGalleryBubbleDataSource.h
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

#import "ChartsGalleryBubbleDataSource.h"
#import "ChartsGalleryBubbleSeries.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"

@implementation ChartsGalleryBubbleDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-bubble-data"];
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  return [ChartsGalleryBubbleSeries new];
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return self.dataCollection.count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartBubbleDataPoint *dp = [SChartBubbleDataPoint new];
  dp.xValue = self.dataCollection[dataIndex][@"longitude"];
  dp.yValue = self.dataCollection[dataIndex][@"latitude"];
  dp.area = [self.dataCollection[dataIndex][@"population"] floatValue];
  return dp;
}

- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series {
  CGPoint center = label.center;
  label.text = [self.dataCollection[dataPoint.index][@"country"] capitalizedString];
  label.font = [UIFont shinobiFontOfSize:10];
  [label sizeToFit];
  label.center = center;
}

@end
