//
//  ChartsGalleryAnnotationsDataSource.m
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

#import "ChartsGalleryAnnotationsDataSource.h"

@implementation ChartsGalleryAnnotationsDataSource

- (id<SChartData>)findDataPointWithHighestYValueForSeries:(SChartSeries*)chartSeries {
  id<SChartData> dataPointWithHighestYValue;
  SChartDataSeries *chartDataSeries = chartSeries.dataSeries;
  for (id<SChartData> dataPoint in chartDataSeries.dataPoints) {
    if (!dataPointWithHighestYValue ||
        [[dataPoint sChartYValue] floatValue] > [[dataPointWithHighestYValue sChartYValue] floatValue]) {
      dataPointWithHighestYValue = dataPoint;
    }
  }
  return dataPointWithHighestYValue;
}

#pragma mark - SChartDatasource methods
- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartLineSeries *series = (SChartLineSeries*)[super sChart:chart seriesAtIndex:index];
  series.crosshairEnabled = NO;
  return series;
}

@end