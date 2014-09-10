//
//  ChartsGalleryDonutViewController.m
//  ChartsGallery
//
//  Created by Alison Clarke on 02/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryDonutViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ChartsGalleryDonutDataSource.h"

@interface ChartsGalleryDonutViewController ()

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) ChartsGalleryDonutDataSource *dataSource;

@end

@implementation ChartsGalleryDonutViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataSource = [ChartsGalleryDonutDataSource new];
  self.chart.title = @"Favourite types of movie";
  [self setupChart];
  self.chart.legend.position = SChartLegendPositionMiddleRight;  
}

@end
