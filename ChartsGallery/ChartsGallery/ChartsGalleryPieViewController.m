//
//  ChartsGalleryPieViewController.m
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

#import "ChartsGalleryPieViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ChartsGalleryPieDataSource.h"

@interface ChartsGalleryPieViewController ()

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) ChartsGalleryPieDataSource *dataSource;

@end

@implementation ChartsGalleryPieViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Set the first slice as selected when the demo is opened for the first time
  self.selectedDonutIndices[@0] = @[@0];
  // Set the initial rotation to be at the middle of the first slice, which is 22% of the
  // full circle
  self.rotations[@(0)] = @(-0.22 * M_PI);
}

- (void)createDataSource {
  self.dataSource = [ChartsGalleryPieDataSource new];
}

- (void)setupChart {
  self.chart.title = @"Pie chart";
  [super setupChart];
  self.chart.titleCentresOn = SChartTitleCentresOnPlottingArea;
  self.chart.legend.position = SChartLegendPositionMiddleRight;
  self.chart.legend.placement = SChartLegendPlacementOutsidePlotArea;
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
}

@end
