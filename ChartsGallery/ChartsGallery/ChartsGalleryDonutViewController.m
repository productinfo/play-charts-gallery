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

- (id<SChartDatasource>)createDataSource {
  return [ChartsGalleryDonutDataSource new];
}

- (void)setupChart {
  self.chart.title = @"Favourite types of movie";
  [super setupChart];
  self.chart.legend.position = SChartLegendPositionMiddleRight;  
}

@end
