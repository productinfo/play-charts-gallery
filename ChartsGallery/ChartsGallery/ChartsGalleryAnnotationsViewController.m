//
//  ChartsGalleryAnnotationsViewController.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 16/12/2014.

#import "ChartsGalleryAnnotationsViewController.h"
#import "ChartsGalleryAnnotationsDataSource.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"

@interface ChartsGalleryAnnotationsViewController ()

@end

@implementation ChartsGalleryAnnotationsViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAnnotationsDataSource new];
}

- (void)setupChart {
  [super setupChart];
  
  self.chart.title = @"Line chart with annotations";

  // Add Anaerobic Annotations
  [self addBandAnnotationWithMinYPosition:@135
                                 withMaxY:@200
                                 andColor:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.05f]
             andTextAnnotationAtXPosition:[self.calendar dateFromComponents:self.dateComponents]
                            withYPosition:@167
                                  andText:@"Anaerobic"];
  
  // Add Aerobic Annotations
  [self addBandAnnotationWithMinYPosition:@95
                                 withMaxY:@135
                                 andColor:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.05f]
             andTextAnnotationAtXPosition:[self.calendar dateFromComponents:self.dateComponents]
                            withYPosition:@115
                                  andText:@"Aerobic"];
  
  // Add Resting Annotations
  [self addBandAnnotationWithMinYPosition:@95
                                 withMaxY:@0
                                 andColor:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.05f]
             andTextAnnotationAtXPosition:[self.calendar dateFromComponents:self.dateComponents]
                            withYPosition:@47
                                  andText:@"Resting"];
}

- (void)addBandAnnotationWithMinYPosition:(id)bandMinYPosition withMaxY:(id)bandMaxYPosition
                                 andColor:(UIColor*)bandColor andTextAnnotationAtXPosition:(id)textXPosition
                            withYPosition:(id)textYPosition andText:(NSString*)annotationText {
  
  SChartAxis *xAxis = self.chart.xAxis;
  SChartAxis *yAxis = self.chart.yAxis;
  
  SChartAnnotation *bandAnnotation = [SChartAnnotation horizontalBandAtPosition:bandMinYPosition
                                                                        andMaxY:bandMaxYPosition
                                                                      withXAxis:xAxis
                                                                       andYAxis:yAxis
                                                                      withColor:bandColor];
  bandAnnotation.layer.borderWidth = 0.0015f;
  bandAnnotation.layer.borderColor = [bandColor colorWithAlphaComponent:0.5].CGColor;
  bandAnnotation.position = SChartAnnotationBelowData;
  [self.chart addAnnotation:bandAnnotation];
  [bandAnnotation updateViewWithCanvas:self.chart.canvas];
  
  SChartAnnotation *textAnnotation = [SChartAnnotation annotationWithText:annotationText
                                                                  andFont:[UIFont shinobiFontOfSize:20]
                                                                withXAxis:xAxis
                                                                 andYAxis:yAxis
                                                              atXPosition:textXPosition
                                                             andYPosition:textYPosition
                                                            withTextColor:[UIColor blackColor]
                                                      withBackgroundColor:[UIColor clearColor]];
  textAnnotation.label.transform = CGAffineTransformMakeRotation(-(M_PI)/2);
  textAnnotation.position = SChartAnnotationBelowData;
  [self.chart addAnnotation:textAnnotation];
  [textAnnotation updateViewWithCanvas:self.chart.canvas];
}

@end
