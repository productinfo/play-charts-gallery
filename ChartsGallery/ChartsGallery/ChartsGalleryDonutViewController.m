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
  self.chart.datasource = self.dataSource;
  self.chart.title = @"Favourite types of movie";
  self.chart.legend.hidden = NO;
  self.chart.legend.position = SChartLegendPositionMiddleRight;
  self.chart.legend.placement = SChartLegendPlacementInsidePlotArea;
  self.chart.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
