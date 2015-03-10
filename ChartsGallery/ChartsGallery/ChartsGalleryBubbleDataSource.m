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
#import "ShinobiPlayUtils/UIFont+SPUFont.h"

@implementation ChartsGalleryBubbleDataSource

- (instancetype)init {
  self = [super initWithDataFromFile:@"ChartsGallery-bubble-data"];
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartBubbleSeries *bubbleSeries = [SChartBubbleSeries new];
  bubbleSeries.scale = @0.008;
  bubbleSeries.style.dataPointLabelStyle.showLabels = YES;
  switch (index) {
    case 0:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartBlueBubble"];
      break;
    case 1:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartGreenBubble"];
      break;
    case 2:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartOrangeBubble"];
      break;
    case 3:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartRedBubble"];
      break;
    case 4:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartPurpleBubble"];
      break;
    case 5:
    default:
      bubbleSeries.style.pointStyle.texture = [UIImage imageNamed:@"BubbleChartSilverBubble"];
      break;
  }
  return bubbleSeries;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return self.dataCollection.count;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.dataCollection[seriesIndex] count];
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartBubbleDataPoint *dp = [SChartBubbleDataPoint new];
  dp.xValue = self.dataCollection[seriesIndex][dataIndex][@"longitude"];
  dp.yValue = self.dataCollection[seriesIndex][dataIndex][@"latitude"];
  dp.area = [self.dataCollection[seriesIndex][dataIndex][@"population"] floatValue];
  return dp;
}

- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series {
  CGPoint center = label.center;
  
  NSInteger seriesIndex = [chart.series indexOfObject:series];
  label.text = self.dataCollection[seriesIndex][dataPoint.index][@"country"];
  label.font = [UIFont boldShinobiFontOfSize:10];
  [label sizeToFit];
  label.center = center;
}

@end
