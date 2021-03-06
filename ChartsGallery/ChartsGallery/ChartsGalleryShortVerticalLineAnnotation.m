//
//  ChartsGalleryShortVerticalLineAnnotation.m
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

#import "ChartsGalleryShortVerticalLineAnnotation.h"

@implementation ChartsGalleryShortVerticalLineAnnotation

- (instancetype)initWithMinYPosition:(id)minYPosition maxYPosition:(id)maxYPosition
                               xAxis:(SChartAxis *)xAxis yAxis:(SChartAxis*)yAxis
                               color:(UIColor*)color {
  // Calculate the annotation height based on the yAxis bands
  self = [super initWithFrame:CGRectMake(0, 0, 6, 0)];
  if (self) {
    self.xAxis = xAxis;
    self.yAxis = yAxis;
    self.yValue = @(([maxYPosition floatValue] + [minYPosition floatValue]) / 2);
    self.xValue = nil;
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 3.0f;
    self.layer.borderColor = color.CGColor;
    self.position = SChartAnnotationBelowData;
    
    self.minYPosition = minYPosition;
    self.maxYPosition = maxYPosition;
  }
  return self;
}

@end
