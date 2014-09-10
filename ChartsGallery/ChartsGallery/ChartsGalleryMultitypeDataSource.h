//
//  MultiChartDataSource.h
//  ShinobiLibrary
//
//  Created by Thomas Kelly on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import "ChartsGalleryCommonDataSource.h"

@interface ChartsGalleryMultitypeDataSource : ChartsGalleryCommonDataSource

- (SChartDateRange *)getInitialDateRange;

@end
