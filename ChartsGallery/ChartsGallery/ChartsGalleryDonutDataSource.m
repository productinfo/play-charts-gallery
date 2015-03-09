//
//  ChartsGalleryDonutDataSource.m
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

#import "ChartsGalleryDonutDataSource.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@implementation ChartsGalleryDonutDataSource

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  SChartDonutSeries *series = [SChartDonutSeries new];
  series.title = [NSString stringWithFormat:@"Series %ld", (long)index];
  series.style.showFlavour = YES;
  series.style.showLabels = YES;
  series.labelFormatString = @"%.0f%%";
  series.gesturePanningEnabled = YES;
  // Set the initial rotation to be at the middle of the first slice, which is 22% of the
  // full circle
  series.style.initialRotation = @(-0.22 * M_PI);
  series.style.protrusion = 0;
  series.selectedStyle.protrusion = 20;
  
  NSMutableArray *selectedSegmentColours = [NSMutableArray new];
  for (UIColor *color in [UIColor shinobiPlayColorArray]) {
    [selectedSegmentColours addObject:[color shinobiBrightColor]];
  }
  series.selectedStyle.flavourColors = selectedSegmentColours;
  return series;
}


@end
