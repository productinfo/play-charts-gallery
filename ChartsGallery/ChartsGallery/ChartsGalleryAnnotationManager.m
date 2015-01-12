//
//  ChartsGalleryAnnotationManager.m
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

#import "ChartsGalleryAnnotationManager.h"
#import "ChartsGalleryShortVerticalLineAnnotation.h"
#import "ChartsGalleryAnchoredTextAnnotation.h"

@interface ChartsGalleryAnnotationManager ()

@property (nonatomic, strong) ShinobiChart *chart;

@property (nonatomic, strong) NSMutableArray *lineAnnotationsLeft;
@property (nonatomic, strong) NSMutableArray *textAnnotations;
@property (nonatomic, strong) NSMutableArray *lineAnnotationsRight;

@end

@implementation ChartsGalleryAnnotationManager

- (instancetype)initWithChart:(ShinobiChart *)chart datasource:(id)datasource {
  self = [super init];
  if (self) {
    self.chart = chart;
    
    self.lineAnnotationsLeft = [NSMutableArray new];
    self.textAnnotations = [NSMutableArray new];
    self.lineAnnotationsRight = [NSMutableArray new];
    
    // Adds three sets of custom annotations to the chart.
    // Each set of annotations feature two custom vertical line annotations and a text annotation.
    [self addAnnotationsForBandWithText:@"Anaerobic" minYPosition:@135 maxYPosition:@200
                                  color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.5f]];
    [self addAnnotationsForBandWithText:@"Aerobic" minYPosition:@95 maxYPosition:@135
                                  color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.5f]];
    [self addAnnotationsForBandWithText:@"Resting" minYPosition:@0 maxYPosition:@95
                                  color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.5f]];
  }
  return self;
}

- (void)addAnnotationsForBandWithText:(NSString*)text minYPosition:(id)minYPosition maxYPosition:(id)maxYPosition color:(UIColor*)color {
  SChartAxis *xAxis = self.chart.xAxis;
  SChartAxis *yAxis = self.chart.yAxis;
  
  // The custom vertical line annotations are shorter in height than regular vertical line annotations
  // They are also offset from the y axis.
  ChartsGalleryShortVerticalLineAnnotation *lineAnnotationLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:minYPosition
                                                                                                                           maxYPosition:maxYPosition
                                                                                                                                  xAxis:xAxis
                                                                                                                                  yAxis:yAxis
                                                                                                                                  color:color];
  [self.lineAnnotationsLeft addObject:lineAnnotationLeft];
  [self.chart addAnnotation:lineAnnotationLeft];
  
  // The custom text annotations are at a fixed offset from the y axis.
  ChartsGalleryAnchoredTextAnnotation *textAnnotation = [[ChartsGalleryAnchoredTextAnnotation alloc] initWithText:text
                                                                                                        withXAxis:xAxis
                                                                                                         andYAxis:yAxis
                                                                                                      atXPosition:nil
                                                                                              betweenMinYPosition:minYPosition
                                                                                                  andMaxYPosition:maxYPosition];
  textAnnotation.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
  [self.textAnnotations addObject:textAnnotation];
  [self.chart addAnnotation:textAnnotation];
  
  ChartsGalleryShortVerticalLineAnnotation *lineAnnotationRight = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:minYPosition
                                                                                                                            maxYPosition:maxYPosition
                                                                                                                                    xAxis:xAxis
                                                                                                                                    yAxis:yAxis
                                                                                                                                    color:color];
  [self.lineAnnotationsRight addObject:lineAnnotationRight];
  [self.chart addAnnotation:lineAnnotationRight];
}

#pragma mark - API Methods

- (void)updateValueAnnotationForXAxisRange:(SChartRange *)xRange yAxisRange:(SChartRange *)yRange {
  // Update the positions of the annotations so they remain visible at all times
  for (int i = 0; i < self.lineAnnotationsLeft.count; ++i) {
    
    // Both of the vertical line annotations have their x position fixed with respect to the x axis
    // They also have their y position and height altered depending on the charts current zoom level
    ChartsGalleryShortVerticalLineAnnotation *lineAnnotationLeft = self.lineAnnotationsLeft[i];
    float height = ([self.chart.yAxis pixelValueForDataValue:lineAnnotationLeft.maxYPosition] - [self.chart.yAxis pixelValueForDataValue:lineAnnotationLeft.minYPosition]);
    lineAnnotationLeft.frame = CGRectMake(lineAnnotationLeft.frame.origin.x, lineAnnotationLeft.frame.origin.y, 6, height);
    lineAnnotationLeft.xValue = xRange.minimum;
    
    // The text annotation also has its x position fixed with respect to the x axis
    // They also have their y position altered depending on the charts current zoom level
    ChartsGalleryShortVerticalLineAnnotation *textAnnotation = self.textAnnotations[i];
    textAnnotation.xValue = xRange.minimum;
    
    ChartsGalleryShortVerticalLineAnnotation *lineAnnotationRight = self.lineAnnotationsRight[i];
    lineAnnotationRight.frame = CGRectMake(lineAnnotationRight.frame.origin.x, lineAnnotationRight.frame.origin.y, 6, height);
    lineAnnotationRight.xValue = xRange.maximum;
  }
  
  // Redraw the chart
  [self.chart redrawChart];
}

@end
