//
//  ChartsGalleryAnnotationsViewController.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 16/12/2014.

#import "ChartsGalleryAnnotationsViewController.h"
#import "ChartsGalleryAnnotationsDataSource.h"
#import "ChartsGalleryMaxHeartRateAnnotation.h"
#import "ChartsGalleryAnnotationManager.h"

@interface ChartsGalleryAnnotationsViewController ()

@property (nonatomic, strong) ChartsGalleryAnnotationManager *annotationManager;
@property (nonatomic, strong) ChartsGalleryMaxHeartRateAnnotation *textAnnotationMaxHeartRate;

@property BOOL initialSetup;

@end

@implementation ChartsGalleryAnnotationsViewController

- (void)createDataSource {
  self.dataSource = [ChartsGalleryAnnotationsDataSource new];
}

- (void)setupChart {
  [super setupChart];
  
  self.chart.title = @"Line chart with annotations";
  
  self.chart.delegate = self;
  self.initialSetup = NO;
  
  // Add Anaerobic Annotations
  [self addBandAnnotationWithMinY:@135
                             maxY:@200
                            color:[UIColor colorWithRed:230.0f/255 green:41.0f/255 blue:77.0f/255 alpha:0.1f]];
  
  // Add Aerobic Annotations
  [self addBandAnnotationWithMinY:@95
                             maxY:@135
                            color:[UIColor colorWithRed:230.0f/255 green:134.0f/255 blue:1.0f/255 alpha:0.1f]];
  
  // Add Resting Annotations
  [self addBandAnnotationWithMinY:@95
                             maxY:@0
                            color:[UIColor colorWithRed:61.0f/255 green:174.0f/255 blue:80.0f/255 alpha:0.1f]];
  
  // Add Max Heart Rate Annotation
  // Create our text annotation subclass. We set the text to be the widest of our possible values
  // since we only size the annotation at construction time.
  self.textAnnotationMaxHeartRate = [[ChartsGalleryMaxHeartRateAnnotation alloc] initWithText:@"Max: 100\n\u25bc"
                                                                                    withXAxis:self.chart.xAxis
                                                                                     andYAxis:self.chart.yAxis
                                                                                  atXPosition:nil
                                                                                  atYPosition:@200];
  [self.chart addAnnotation:self.textAnnotationMaxHeartRate];
  
  // Create the series marker (it's added to the view in viewDidAppear)
  self.annotationManager = [[ChartsGalleryAnnotationManager alloc] initWithChart:self.chart
                                                                      datasource:self.chart.datasource];
}

- (void)addBandAnnotationWithMinY:(id)bandMinYPosition maxY:(id)bandMaxYPosition color:(UIColor*)bandColor {
  
  SChartAnnotation *bandAnnotation = [SChartAnnotation horizontalBandAtPosition:bandMinYPosition
                                                                        andMaxY:bandMaxYPosition
                                                                      withXAxis:self.chart.xAxis
                                                                       andYAxis:self.chart.yAxis
                                                                      withColor:bandColor];
  bandAnnotation.position = SChartAnnotationBelowData;
  [self.chart addAnnotation:bandAnnotation];
  [bandAnnotation updateViewWithCanvas:self.chart.canvas];
}

- (void)sChartRenderFinished:(ShinobiChart *)chart {
  if (!self.initialSetup) {
    [self updateMaxHeartRatePosition];
    [self.annotationManager updateValueAnnotationForXAxisRange:self.chart.xAxis.range
                                                    yAxisRange:self.chart.yAxis.range];
    self.initialSetup = YES;
  }
}

- (void)updateMaxHeartRatePosition {
  ChartsGalleryAnnotationsDataSource *dataSource = self.chart.datasource;
  id<SChartData> dataPointWithHighestValue = [dataSource findDataPointWithHighestYValueForSeries:self.chart.series[0]];
  
  self.textAnnotationMaxHeartRate.xValue = [dataPointWithHighestValue sChartXValue];
  self.textAnnotationMaxHeartRate.label.text = [NSString stringWithFormat:@"Max: %@\n\u25bc",
                                                [dataPointWithHighestValue sChartYValue]];
  self.textAnnotationMaxHeartRate.yValue = [dataPointWithHighestValue sChartYValue];
}


- (void)sChart:(ShinobiChart *)chart didAlterRangeOnAxis:(SChartAxis *)axis {
  [self.annotationManager updateValueAnnotationForXAxisRange:self.chart.xAxis.range
                                                  yAxisRange:self.chart.yAxis.range];
}

@end
