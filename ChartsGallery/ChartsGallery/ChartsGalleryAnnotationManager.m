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
#import "ChartsGalleryMaxHeartRateAnnotation.h"
#import <ShinobiCharts/SChartCanvas.h>
#import <ShinobiCharts/SChartGLView.h>

@interface ChartsGalleryAnnotationManager ()

@property (nonatomic, strong) ShinobiChart *chart;
@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSCalendar *calendar;

@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationAnaerobicLeft;
@property (nonatomic, strong) ChartsGalleryAnchoredTextAnnotation *textAnnotationAnaerobic;
@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationAnaerobicRight;

@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationAerobicLeft;
@property (nonatomic, strong) ChartsGalleryAnchoredTextAnnotation *textAnnotationAerobic;
@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationAerobicRight;

@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationRestingLeft;
@property (nonatomic, strong) ChartsGalleryAnchoredTextAnnotation *textAnnotationResting;
@property (nonatomic, strong) ChartsGalleryShortVerticalLineAnnotation *lineAnnotationRestingRight;

@property (nonatomic, strong) ChartsGalleryMaxHeartRateAnnotation *textAnnotationMaxHeartRate;

@end

@implementation ChartsGalleryAnnotationManager

- (instancetype)initWithChart:(ShinobiChart *)chart datasource:(id)datasource {
  self = [super init];
  if (self) {
    self.chart = chart;
    self.dateComponents = [NSDateComponents new];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    self.lineAnnotationAnaerobicLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@135 maxYPosition:@200 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationAnaerobicLeft];
    
    self.textAnnotationAnaerobic = [[ChartsGalleryAnchoredTextAnnotation alloc] initWithText:@"Anaerobic"
                                                                                   withXAxis:self.chart.xAxis
                                                                                    andYAxis:self.chart.yAxis
                                                                                 atXPosition:nil
                                                                         betweenMinYPosition:@135
                                                                             andMaxYPosition:@200];
    self.textAnnotationAnaerobic.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
    [self.chart addAnnotation:self.textAnnotationAnaerobic];
    
    self.lineAnnotationAnaerobicRight = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@135 maxYPosition:@200 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationAnaerobicRight];
    
    self.lineAnnotationAerobicLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@95 maxYPosition:@135 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationAerobicLeft];
    
    self.textAnnotationAerobic = [[ChartsGalleryAnchoredTextAnnotation alloc] initWithText:@"Aerobic"
                                                                                 withXAxis:self.chart.xAxis
                                                                                  andYAxis:self.chart.yAxis
                                                                               atXPosition:nil
                                                                       betweenMinYPosition:@95
                                                                           andMaxYPosition:@135];
    self.textAnnotationAerobic.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
    [self.chart addAnnotation:self.textAnnotationAerobic];
    
    self.lineAnnotationAerobicRight = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@95 maxYPosition:@135 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationAerobicRight];
    
    self.lineAnnotationRestingLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@0 maxYPosition:@95 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationRestingLeft];
    
    self.textAnnotationResting = [[ChartsGalleryAnchoredTextAnnotation alloc] initWithText:@"Resting"
                                                                                 withXAxis:self.chart.xAxis
                                                                                  andYAxis:self.chart.yAxis
                                                                               atXPosition:nil
                                                                       betweenMinYPosition:@0
                                                                           andMaxYPosition:@95];
    self.textAnnotationResting.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
    [self.chart addAnnotation:self.textAnnotationResting];
    
    self.lineAnnotationRestingRight = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:@0 maxYPosition:@95 xAxis:self.chart.xAxis yAxis:self.chart.yAxis color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.5f]];
    [self.chart addAnnotation:self.lineAnnotationRestingRight];
    
    // Create our text annotation subclass. We set the text to be the widest of our possible values
    // since we only size the annotation at construction time.
    self.textAnnotationMaxHeartRate = [[ChartsGalleryMaxHeartRateAnnotation alloc] initWithText:@"Max: 100\n\u25bc"
                                                                        withXAxis:self.chart.xAxis
                                                                         andYAxis:self.chart.yAxis
                                                                      atXPosition:nil
                                                                      atYPosition:@200];
    [self.chart addAnnotation:self.textAnnotationMaxHeartRate];
  }
  return self;
}

- (void)initLineAnnotationLeft:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationLeft textAnnotation:(ChartsGalleryAnchoredTextAnnotation*)textAnnotation lineAnnotationRight:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationRight withText:(NSString*)text minYPosition:(id)minYPosition maxYPosition:(id)maxYPosition color:(UIColor*)color{

  SChartAxis *xAxis = self.chart.xAxis;
  SChartAxis *yAxis = self.chart.yAxis;
  
  lineAnnotationLeft = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:minYPosition maxYPosition:maxYPosition xAxis:xAxis yAxis:yAxis color:color];
  [self.chart addAnnotation:lineAnnotationLeft];
  
  textAnnotation = [[ChartsGalleryAnchoredTextAnnotation alloc] initWithText:text
                                                                   withXAxis:xAxis
                                                                    andYAxis:yAxis
                                                                 atXPosition:nil
                                                         betweenMinYPosition:minYPosition
                                                             andMaxYPosition:maxYPosition];
  textAnnotation.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
  [self.chart addAnnotation:textAnnotation];
  
  lineAnnotationRight = [[ChartsGalleryShortVerticalLineAnnotation alloc] initWithMinYPosition:minYPosition maxYPosition:maxYPosition xAxis:xAxis yAxis:yAxis color:color];
  [self.chart addAnnotation:lineAnnotationRight];
}

#pragma mark - API Methods

- (void)updateValueAnnotationForXAxisRange:(SChartRange *)xRange yAxisRange:(SChartRange *)yRange {
  // Update the values on both annotations and redraw the chart
  
  [self updateLineAnnotationLeft:self.lineAnnotationAnaerobicLeft textAnnotation:self.textAnnotationAnaerobic
             lineAnnotationRight:self.lineAnnotationAnaerobicRight withXAxisRange:(SChartRange *)xRange];
  
  [self updateLineAnnotationLeft:self.lineAnnotationAerobicLeft textAnnotation:self.textAnnotationAerobic
             lineAnnotationRight:self.lineAnnotationAerobicRight withXAxisRange:(SChartRange *)xRange];
  
  [self updateLineAnnotationLeft:self.lineAnnotationRestingLeft textAnnotation:self.textAnnotationResting
             lineAnnotationRight:self.lineAnnotationRestingRight withXAxisRange:xRange];
  
  [self upateMaxHeartRatePositionForXAxisRange:xRange andYAxisRange:yRange];
  
  [self.chart redrawChart];
}

- (void)updateLineAnnotationLeft:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationLeft textAnnotation:(ChartsGalleryAnchoredTextAnnotation*)textAnnotation lineAnnotationRight:(ChartsGalleryShortVerticalLineAnnotation*)lineAnnotationRight withXAxisRange:(SChartRange *)xRange{
  float height = (([lineAnnotationLeft.maxYPosition floatValue] - [lineAnnotationRight.minYPosition floatValue]) * [self chartYRatio]);
  lineAnnotationLeft.frame = CGRectMake(lineAnnotationLeft.frame.origin.x, lineAnnotationRight.frame.origin.y, 6, height);
  lineAnnotationLeft.xValue = xRange.minimum;

  textAnnotation.xValue = xRange.minimum;

  lineAnnotationRight.frame = CGRectMake(lineAnnotationLeft.frame.origin.x, lineAnnotationRight.frame.origin.y, 6, height);
  lineAnnotationRight.xValue = xRange.maximum;
}

- (CGFloat)chartYRatio {
  CGRect glViewFrame = self.chart.canvas.glView.frame;
  SChartRange *yRange = self.chart.yAxis.axisRange;
  
  CGFloat glViewHeight = CGRectGetHeight(glViewFrame);
  CGFloat yRangeSpan = yRange.span.floatValue;
  
  return glViewHeight / yRangeSpan;
}

- (void)upateMaxHeartRatePositionForXAxisRange:(SChartRange *)xRange andYAxisRange:(SChartRange *)yRange {
  NSTimeInterval x = 0;
  CGFloat y = 0;
  SChartSeries *heartRateSeries = self.chart.series[0];
  SChartDataSeries *heartRateDataSeries = heartRateSeries.dataSeries;
  NSMutableArray *array = heartRateDataSeries.dataPoints;
  for(int i = 0; i < (array.count - 1); ++i){
    SChartDataPoint *dp = array[i];
    self.dateComponents.minute = i;
    NSDate *xdate = [self.calendar dateFromComponents:self.dateComponents];
    NSDate *first = [NSDate dateWithTimeIntervalSince1970:[xRange.minimum doubleValue]];
    NSDate *last = [NSDate dateWithTimeIntervalSince1970:[xRange.maximum doubleValue]];
    if(([xdate compare:first] == NSOrderedDescending) &&
       ([xdate compare:last] == NSOrderedAscending) &&
       ([dp.yValue floatValue] >= [yRange.minimum floatValue]) &&
       ([dp.yValue floatValue] <= [yRange.maximum floatValue]) &&
       ([dp.yValue floatValue] > y) &&
       (([self.chart.yAxis pixelValueForDataValue:dp.yValue] - [self.chart.yAxis pixelValueForDataValue:yRange.maximum]) >= self.textAnnotationMaxHeartRate.frame.size.height)){
      x = [xdate timeIntervalSince1970];
      y = [dp.yValue floatValue];
    }
  }
  self.textAnnotationMaxHeartRate.label.text = [NSString stringWithFormat:@"Max: %@\n\u25bc", @(y)];
  self.textAnnotationMaxHeartRate.xValue = @(x);
  self.textAnnotationMaxHeartRate.yValue = @(y);
}

@end
