//
//  ChartsGalleryPieChartViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 02/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryPieViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ChartsGalleryPieDataSource.h"

@interface ChartsGalleryPieViewController ()

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) ChartsGalleryPieDataSource *dataSource;

@end

@implementation ChartsGalleryPieViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryPieDataSource new];
  self.chart.title = @"Favourite types of movie";
  [self setupChart];
  self.chart.legend.position = SChartLegendPositionMiddleRight;
}

@end
