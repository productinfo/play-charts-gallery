//
//  OHLCChartDataSource.h
//  ShinobiLibrary
//
//  Created by Sam Davies on 27/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//


#import "ChartsGalleryMultiYDataSource.h"

@interface ChartsGalleryOHLCDataSource : ChartsGalleryMultiYDataSource

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex;

@end
