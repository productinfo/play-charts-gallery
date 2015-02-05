//
//  ChartsGalleryRadarViewController.m
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

#import "ChartsGalleryRadarViewController.h"
#import "ChartsGalleryRadarDataSource.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@implementation ChartsGalleryRadarViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryRadarDataSource new];
}

- (void)setupChart {
  self.chart.xAxis = [SChartCategoryAxis new];
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.defaultRange = [[SChartNumberRange alloc] initWithMinimum:@0
                                                                  andMaximum:@180];
  self.chart.yAxis.majorTickFrequency = @20;
  self.chart.title = @"Radar chart";
    
  [super setupChart];
  
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
  self.chart.xAxis.style.majorTickStyle.lineColor = [UIColor shinobiDarkGrayColor];
  self.chart.yAxis.style.majorTickStyle.lineColor = [UIColor shinobiDarkGrayColor];
  self.chart.xAxis.style.lineColor = [UIColor shinobiDarkGrayColor];
  self.chart.yAxis.style.lineColor = [UIColor shinobiDarkGrayColor];
  self.chart.xAxis.style.majorGridLineStyle.lineRenderMode = SChartRadialLineRenderModeLinear;
  self.chart.xAxis.style.majorGridLineStyle.showMajorGridLines = YES;
  self.chart.yAxis.style.majorGridLineStyle.lineRenderMode = SChartRadialLineRenderModeLinear;
  self.chart.yAxis.style.majorGridLineStyle.showMajorGridLines = YES;
}

@end
