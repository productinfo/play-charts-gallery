//
//  ChartsGalleryDataLabelViewController.m
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

#import "ChartsGalleryDataLabelViewController.h"
#import"ChartsGalleryDataLabelDataSource.h"

@implementation ChartsGalleryDataLabelViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryDataLabelDataSource new];
}

- (void)setupChart {
  [super setupChart];
  self.chart.title = @"Stacked bar chart showing individual data point labels";
}

- (void)sChart:(ShinobiChart *)chart alterDataPointLabel:(SChartDataPointLabel *)label
  forDataPoint:(SChartDataPoint *)dataPoint inSeries:(SChartSeries *)series{
  // We need to reposition the label by updating its origin values.
  // By default the label is centered horizontally so that half of it overlaps the end of the bar.
  // The label is moved to the left so that it appears 5 pixels from the end of the bar thus removing the overlap.
  CGRect newLabelFrame = label.frame;
  newLabelFrame.origin.x = CGRectGetMidX(label.frame) - (newLabelFrame.size.width + 5.f);
  label.frame = newLabelFrame;
}

@end
