//
//  ChartsGalleryAnnotationsViewController.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 16/12/2014.

#import "ChartsGalleryAnnotationsViewController.h"
#import "ChartsGalleryAnnotationsDataSource.h"
#import "ChartsGalleryAnnotationManager.h"

@interface ChartsGalleryAnnotationsViewController ()

@property (strong, nonatomic) ChartsGalleryAnnotationManager *annotationManager;

@property BOOL initialSetup;

@end

@implementation ChartsGalleryAnnotationsViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAnnotationsDataSource new];
}

- (void)setupChart {
  [super setupChart];
  
  self.chart.delegate = self;
  self.initialSetup = NO;
  
  // Add Anaerobic Annotations
  [self addBandAnnotationWithMinYPosition:@135
                                     MaxY:@200
                                    Color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.05f]];
  
  // Add Aerobic Annotations
  [self addBandAnnotationWithMinYPosition:@95
                                     MaxY:@135
                                    Color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.05f]];
  
  // Add Resting Annotations
  [self addBandAnnotationWithMinYPosition:@95
                                     MaxY:@0
                                    Color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.05f]];
  
  // Create the series marker (it's added to the view in viewDidAppear)
  self.annotationManager = [[ChartsGalleryAnnotationManager alloc] initWithChart:self.chart
                                                                      datasource:self.chart.datasource];
}

- (void)addBandAnnotationWithMinYPosition:(id)bandMinYPosition MaxY:(id)bandMaxYPosition
                                    Color:(UIColor*)bandColor {
  
  SChartAnnotation *bandAnnotation = [SChartAnnotation horizontalBandAtPosition:bandMinYPosition
                                                                        andMaxY:bandMaxYPosition
                                                                      withXAxis:self.chart.xAxis
                                                                       andYAxis:self.chart.yAxis
                                                                      withColor:bandColor];
  bandAnnotation.position = SChartAnnotationBelowData;
  [self.chart addAnnotation:bandAnnotation];
  [bandAnnotation updateViewWithCanvas:self.chart.canvas];
}

- (void)sChartRenderFinished:(ShinobiChart *)chart{
  if(!self.initialSetup){
    [self.annotationManager updateValueAnnotationForXAxisRange:self.chart.xAxis.axisRange
                                                    yAxisRange:self.chart.yAxis.axisRange];
    self.initialSetup = YES;
  }
  
}

- (void)sChartIsPanning:(ShinobiChart *)chart withChartMovementInformation:(const SChartMovementInformation *)information {
  [self.annotationManager updateValueAnnotationForXAxisRange:self.chart.xAxis.axisRange
                                                  yAxisRange:self.chart.yAxis.axisRange];
}

- (void)sChartIsZooming:(ShinobiChart *)chart withChartMovementInformation:(const SChartMovementInformation *)information {
  [self.annotationManager updateValueAnnotationForXAxisRange:self.chart.xAxis.axisRange
                                                  yAxisRange:self.chart.yAxis.axisRange];
}

@end
