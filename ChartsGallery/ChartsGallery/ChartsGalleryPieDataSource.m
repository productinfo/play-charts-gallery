//
//  ChartsGalleryPieDataSource.h
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

#import "ChartsGalleryPieDataSource.h"

@implementation ChartsGalleryPieDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartPieSeries *series = [SChartPieSeries new];
  series.title = [NSString stringWithFormat:@"Series %ld", (long)index];
  series.innerRadius = 0.f;
  series.labelFormatString = @"%.0f%%";
  series.gesturePanningEnabled = YES;
  // Set the initial rotation to be at the middle of the first slice, which is 22% of the
  // full circle
  series.style.initialRotation = @(-0.22 * M_PI);
  series.style.protrusion = 0;
  series.selectedStyle.protrusion = 20;
  
  CGFloat brightness = 0.1;
  NSArray *selectedSegmentColours= @[[UIColor colorWithHue:211.0f/360 saturation:100.0f/100 brightness:(80.0f/100) + brightness alpha:1],
                                     [UIColor colorWithHue:130.0f/360 saturation:65.0f/100 brightness:(68.0f/100) + brightness alpha:1],
                                     [UIColor colorWithHue:35.0f/360 saturation:100.0f/100 brightness:(90.0f/100) + brightness alpha:1],
                                     [UIColor colorWithHue:349.0f/360 saturation:82.0f/100 brightness:(90.0f/100) + brightness alpha:1],
                                     [UIColor colorWithHue:241.0f/360 saturation:60.0f/100 brightness:(67.0f/100) + brightness alpha:1],
                                     [UIColor colorWithHue:240.0f/360 saturation:3.0f/100 brightness:(58.0f/100) + brightness alpha:1]];
  series.selectedStyle.flavourColors = [selectedSegmentColours mutableCopy];
  return series;
}

@end
