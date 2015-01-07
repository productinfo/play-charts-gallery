//
//  ChartsGalleryBubbleSeries.m
//  ChartsGallery
//
//  Created by Alison Clarke on 16/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryBubbleSeries.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

static NSArray *bubbleColors;

@interface ChartsGalleryBubbleSeries()

@property (assign, nonatomic) NSInteger count;

@end

@implementation ChartsGalleryBubbleSeries

+ (void)initialize {
  bubbleColors = [UIColor shinobiPlayColorArray];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.count = 0;
    self.style.dataPointLabelStyle.showLabels = YES;
    self.scale = @0.008f;
  }
  return self;
}

- (SChartBubblePointStyle *)styleForPoint:(id<SChartData>)point {
  SChartBubblePointStyle *pointStyle = [super styleForPoint:point];
  pointStyle.color = bubbleColors[self.count % bubbleColors.count];
  self.count++;
  return pointStyle;
}
@end
