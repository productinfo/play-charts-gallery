//
//  ChartsGalleryDonutViewController.m
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

#import "ChartsGalleryDonutViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ChartsGalleryDonutDataSource.h"

@interface ChartsGalleryDonutViewController ()

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) ChartsGalleryDonutDataSource *dataSource;

@end

@implementation ChartsGalleryDonutViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.selectedDonutIndices[@0] = [NSMutableArray new];
  [self.selectedDonutIndices[@0] addObject:@(0)];
  
  self.rotations[@(0)] = @(5.5841);
}

- (void)createDataSource {
  self.dataSource = [ChartsGalleryDonutDataSource new];
}

- (void)setupChart {
  self.chart.title = @"Donut chart";
  [super setupChart];
  self.chart.titleCentresOn = SChartTitleCentresOnPlottingArea;
  self.chart.legend.position = SChartLegendPositionMiddleRight;
  self.chart.legend.placement = SChartLegendPlacementOutsidePlotArea;
  self.chart.legend.style.textAlignment = NSTextAlignmentRight;
}

@end
