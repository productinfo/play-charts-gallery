//
//  ChartsGalleryScatterDataSource.h
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

#import "ChartsGalleryScatterDataSource.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@interface ChartsGalleryScatterDataSource()

@property (nonatomic, strong) NSDictionary *dataCollection;
@property (nonatomic, strong) NSArray *seriesNames;

@end

@implementation ChartsGalleryScatterDataSource

- (instancetype)init {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChartsGallery-scatter-data" ofType:@"plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      self.dataCollection = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    }
    self.seriesNames = @[@"male", @"female"];
  }
  return self;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartScatterSeries *series = [SChartScatterSeries new];
  series.title = [self.seriesNames[index] capitalizedString];
  series.style.pointStyle.radius = @40;
  series.style.pointStyle.texture = [UIImage imageNamed:series.title];
  series.style.pointStyle.innerColor = (index == 0) ? [UIColor shinobiPlayBlueColor]
                                                    : [UIColor shinobiPlayGreenColor];
  return series;
}

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 2;
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  return [self.dataCollection[self.seriesNames[seriesIndex]] count];
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartDataPoint *dp = [SChartDataPoint new];
  dp.xValue = self.dataCollection[self.seriesNames[seriesIndex]][dataIndex][@"height"];
  dp.yValue = self.dataCollection[self.seriesNames[seriesIndex]][dataIndex][@"weight"];
  return dp;
}

@end
