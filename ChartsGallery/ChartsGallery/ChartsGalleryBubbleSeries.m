//
//  ChartsGalleryBubbleSeries.m
//  ChartsGallery
//
//  Created by Alison Clarke on 16/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryBubbleSeries.h"

static NSArray *bubbleColors;

@interface ChartsGalleryBubbleSeries()

@property (assign, nonatomic) NSInteger count;

@end

@implementation ChartsGalleryBubbleSeries

+ (void)initialize {
  bubbleColors = @[[UIColor colorWithRed:1/255.f *.8 green:122/255.f *.8 blue:255/255.f *.8 alpha:1.f],
                   [UIColor colorWithRed:76/255.f *.8 green:217/255.f *.8 blue:100/255.f *.8 alpha:1.f],
                   [UIColor colorWithRed:255/255.f *.9 green:149/255.f *.9 blue:1/255.f *.9 alpha:1.f],
                   [UIColor colorWithRed:255/255.f *.9 green:45/255.f *.9 blue:85/255.f *.9 alpha:1.f],
                   [UIColor colorWithRed:88/255.f *.8 green:86/255.f *.8 blue:214/255.f *.8 alpha:1.f],
                   [UIColor colorWithRed:142/255.f green:142/255.f blue:147/255.f alpha:1.f]];
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
