//
//  ChartsGalleryMultiYDataSource.h
//  ChartsGallery
//
//  Created by Alison Clarke on 16/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryCommonDateDataSource.h"

@interface ChartsGalleryMultiYDataSource : ChartsGalleryCommonDateDataSource

- (id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex;

@end
