//
//  BubbleChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryBubbleViewController.h"
#import "ChartsGalleryBubbleDataSource.h"
#import <ShinobiCharts/ShinobiCharts.h>

@implementation ChartsGalleryBubbleViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryBubbleDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"Longitude";
  self.chart.xAxis.rangePaddingLow = @20;
  self.chart.xAxis.rangePaddingHigh = @30;
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Latitude";
  self.chart.yAxis.rangePaddingLow = @10;
  self.chart.yAxis.rangePaddingHigh = @10;

  self.chart.title = @"Populations by latitude and longitude";
  
  [super setupChart];
  
  self.chart.legend.hidden = YES;
}

// Pass delegate method through to data source
- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series {
  return [(ChartsGalleryBubbleDataSource*)self.chart.datasource sChart:chart
                                                   alterDataPointLabel:label
                                                          forDataPoint:dataPoint
                                                              inSeries:series];
}

@end
