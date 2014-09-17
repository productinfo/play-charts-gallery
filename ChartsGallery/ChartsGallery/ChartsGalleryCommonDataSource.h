//
//  ShinobiLibraryCommonChartDataSource.h
//  ShinobiLibrary
//
//  Created by Sam Davies on 26/11/2012.
//  Copyright (c) 2012 ScottLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>

@interface ChartsGalleryCommonDataSource : NSObject <SChartDatasource>

/* NSArray of NSArray's of NSNumbers */
@property (nonatomic, strong) NSArray *dataCollection;
@property (nonatomic,strong) NSArray *seriesNames;

- (instancetype)initWithDataFromFile:(NSString *)filename;
- (id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex;
- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex;

@end
