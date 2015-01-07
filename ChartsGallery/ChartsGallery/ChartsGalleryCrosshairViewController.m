//
//  ChartsGalleryCrosshairViewController.m
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

#import "ChartsGalleryCrosshairViewController.h"
#import "ChartsGalleryCrosshairDataSource.h"
#import "ChartsGalleryCustomCrosshair.h"
#import "ChartsGalleryCustomCrosshairTooltip.h"

@interface ChartsGalleryCrosshairViewController ()

@end

@implementation ChartsGalleryCrosshairViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryCrosshairDataSource new];
}

- (void)setupChart {
  [super setupChart];
  
  self.chart.xAxis = [SChartDateTimeAxis new];
  self.chart.xAxis.title = @"Time (Minutes)";
  
  self.chart.yAxis = [SChartNumberAxis new];
  self.chart.yAxis.title = @"Heart Rate (bpm)";
  self.chart.yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:@0 andMaximum:@200];
  
  self.chart.legend.hidden = YES;
  
  self.chart.title = @"Line chart with custom crosshair";
  
  self.dateComponents = [NSDateComponents new];
  self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  
  self.dateComponents.minute = 1.5;
  
  self.chart.crosshair = [[ChartsGalleryCustomCrosshair alloc] initWithChart:self.chart];
  self.chart.crosshair.tooltip = [ChartsGalleryCustomCrosshairTooltip new];
  self.chart.crosshair.enableCrosshairLines = YES;  
}

@end
