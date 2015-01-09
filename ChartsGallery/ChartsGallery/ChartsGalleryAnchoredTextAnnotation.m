//
//  ChartsGalleryAnchoredTextAnnotation.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 07/01/2015.
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

#import "ChartsGalleryAnchoredTextAnnotation.h"

@implementation ChartsGalleryAnchoredTextAnnotation

- (instancetype)initWithText:(NSString *)text withXAxis:(SChartAxis *)xAxis andYAxis:(SChartAxis *)yAxis
                 atXPosition:(id)xPosition betweenMinYPosition:(id)minYPosition andMaxYPosition:(id)maxYPosition{
  self = [super initWithText:text withXAxis:xAxis andYAxis:yAxis atXPosition:xPosition];
  if (self) {
    // Set all the required properties
    self.yValue = @(([maxYPosition floatValue] + [minYPosition floatValue]) / 2);
    self.position = SChartAnnotationBelowData;
  }
  return self;
}

- (void)updateViewWithCanvas:(SChartCanvas *)canvas {
  [super updateViewWithCanvas:canvas];
  // Move us so we are anchored above the minimum value
  self.center = CGPointMake(self.center.x + (self.label.bounds.size.height * 2), self.center.y);
}

@end
