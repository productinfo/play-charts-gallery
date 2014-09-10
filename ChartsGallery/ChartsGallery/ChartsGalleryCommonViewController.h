//
//  ChartsGalleryCommonViewController.h
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ShinobiPlayUtils/SPUGalleryManagedViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>

@interface ChartsGalleryCommonViewController : SPUGalleryManagedViewController

@property (strong, nonatomic) NSObject<SChartDatasource> *dataSource;
@property (strong, nonatomic) IBOutlet ShinobiChart *chart;

- (void)setupChart;

@end
