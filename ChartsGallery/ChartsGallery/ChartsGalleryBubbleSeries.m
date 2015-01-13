//
//  ChartsGalleryBubbleSeries.m
//  ChartsGallery
//
//  Created by Alison Clarke on 09/09/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
