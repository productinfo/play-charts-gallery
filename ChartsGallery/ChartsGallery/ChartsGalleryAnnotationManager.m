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
    
    // Create three sets of custom annotations. Each set feature two custom vertical line annotations and a text annotation.
    // The custom vertical line annotations are shorter in height that regular vertical line annotations.
    // The custom text annotations are offset from the y axis.
    [self initLeftLineAnnotationLefttextAnnotationRightLineAnnotationWithText:@"Anaerobic" minYPosition:@135 maxYPosition:@200 color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.5f]];
    [self initLeftLineAnnotationLefttextAnnotationRightLineAnnotationWithText:@"Aerobic" minYPosition:@95 maxYPosition:@135 color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.5f]];
    [self initLeftLineAnnotationLefttextAnnotationRightLineAnnotationWithText:@"Resting" minYPosition:@0 maxYPosition:@95 color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.5f]];
  }
  return self;
}

- (void)initLeftLineAnnotationLefttextAnnotationRightLineAnnotationWithText:(NSString*)text minYPosition:(id)minYPosition maxYPosition:(id)maxYPosition color:(UIColor*)color {

  SChartAxis *xAxis = self.chart.xAxis;
  SChartAxis *yAxis = self.chart.yAxis;
  
  ChartsGalleryShortVerticalLineAnnotation *lineAnnotationLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:minYPosition
                                                                                                                           maxYPosition:maxYPosition
                                                                                                                                  xAxis:xAxis
                                                                                                                                  yAxis:yAxis
                                                                                                                                  color:color];
  [self.lineAnnotationsLeft addObject:lineAnnotationLeft];
  [self.chart addAnnotation:lineAnnotationLeft];
  
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
  // Update the positions of the annotations so they remain visible at all time, and redraw the chart
  for (int i = 0; i < self.lineAnnotationsLeft.count; ++i) {
    [self updateLineAnnotationLeft:self.lineAnnotationsLeft[i] textAnnotation:self.textAnnotations[i]
               lineAnnotationRight:self.lineAnnotationsRight[i] withXAxisRange:xRange];
  }
  
  [self.chart redrawChart];
}

- (void)updateLineAnnotationLeft:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationLeft
                  textAnnotation:(ChartsGalleryAnchoredTextAnnotation*)textAnnotation
             lineAnnotationRight:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationRight
                  withXAxisRange:(SChartRange *)xRange {
  float height = ([self.chart.yAxis pixelValueForDataValue:lineAnnotationLeft.maxYPosition] - [self.chart.yAxis pixelValueForDataValue:lineAnnotationRight.minYPosition]);
  lineAnnotationLeft.frame = CGRectMake(lineAnnotationLeft.frame.origin.x, lineAnnotationRight.frame.origin.y, 6, height);
  lineAnnotationLeft.xValue = xRange.minimum;

  textAnnotation.xValue = xRange.minimum;

  lineAnnotationRight.frame = CGRectMake(lineAnnotationLeft.frame.origin.x, lineAnnotationRight.frame.origin.y, 6, height);
  lineAnnotationRight.xValue = xRange.maximum;
}

@end
