//
//  ChartsGalleryCustomTextAnnotation.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 09/01/2015.
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

#import "ChartsGalleryCustomTextAnnotation.h"

@implementation ChartsGalleryCustomTextAnnotation

- (instancetype)initWithText:(NSString *)text withXAxis:(SChartAxis *)xAxis
                    andYAxis:(SChartAxis *)yAxis atXPosition:(id)xPosition {
  self = [super init];
  if (self) {
    // Set all the required properties
    self.xAxis = xAxis;
    self.yAxis = yAxis;
    self.xValue = xPosition;
    
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor blackColor];
    self.label.text = text;
    self.label.textAlignment = NSTextAlignmentCenter;
    [self customiseLabel];
    [self.label sizeToFit];
    [self addSubview:self.label];
    
    [self sizeToFit];
  }
  return self;
}

- (void)customiseLabel {
  // Implement this method in the subclass to perform any extra customisations to the label 
}

@end
