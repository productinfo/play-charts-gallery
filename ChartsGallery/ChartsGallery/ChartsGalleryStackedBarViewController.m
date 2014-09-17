//
//  StackedBarChartView.m
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryStackedBarViewController.h"
#import "ChartsGalleryStackedBarDataSource.h"

@implementation ChartsGalleryStackedBarViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryStackedBarDataSource new];
  
  self.chart.xAxis = [SChartNumberAxis new];
  self.chart.xAxis.title = @"SAT Score";
  self.chart.xAxis.animationEdgeBouncing = NO;
  
  self.chart.yAxis = [SChartCategoryAxis new];
  self.chart.yAxis.title = @"School";
  self.chart.yAxis.animationEdgeBouncing = NO;
  
  self.chart.title = @"SAT scores for schools";
  
  [self setupChart];
}

/*- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        dataSource = [ChartsGalleryStackedBarDataSource new];
        chart.datasource = dataSource;
        chart.yAxis = [SChartCategoryAxis new];
        //Need to reload settings on changes to the axes
        [self reload];
        chart.yAxis.rangePaddingLow = @0;
        chart.yAxis.rangePaddingHigh = @0;
        chart.xAxis.title = @"SAT Score";
        chart.yAxis.title = @"School";
        chart.title = @"SAT scores for schools";
    }
    return self;
}*/

@end
