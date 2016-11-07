//
//  ChartsGalleryCustomLegendSymbol.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 02/12/2014.
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

#import "ChartsGalleryCustomLegendSymbol.h"

@interface ChartsGalleryCustomLegendSymbol ()

@property ShinobiChart *chart;
@property SChartSeries *series;
@property UISwitch *seriesToggleSwitch;

@end

@implementation ChartsGalleryCustomLegendSymbol

- (instancetype)initWithChart:(ShinobiChart *)chart andSeries:(SChartSeries*)series {
  self = [super init];
  if (self) {
    self.chart = chart;
    self.series = series;
    
    self.seriesToggleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 33)];
    self.seriesToggleSwitch.on = YES;
    [self.seriesToggleSwitch addTarget:self
                action:@selector(switchToggled:)
      forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.seriesToggleSwitch];
    self.seriesToggleSwitch.clipsToBounds = NO;
    self.clipsToBounds = NO;
  }
  return self;
}

- (void)layoutSubviews {
  // Fix our height to make sure the toggle switch fits inside
  if (CGRectGetHeight(self.frame) < CGRectGetHeight(self.seriesToggleSwitch.frame)) {
    CGFloat heightDiff = CGRectGetHeight(self.seriesToggleSwitch.frame) - CGRectGetHeight(self.frame);
    self.frame = CGRectInset(self.frame, 0, -(heightDiff/2));
  }
  UIColor *tintColor = self.seriesToggleSwitch.onTintColor;
  if ([self.series isKindOfClass:[SChartColumnSeries class]]) {
    tintColor = ((SChartColumnSeries *)self.series).style.areaColor;
  } else if ([self.series isKindOfClass:[SChartBandSeries class]]) {
    tintColor = ((SChartBandSeries *)self.series).style.areaColorNormal;
  }
  self.seriesToggleSwitch.onTintColor = tintColor;
}

- (void)switchToggled:(UISwitch *)sender {
    
    SChartAnimation *animation = [self animationForSeries];
    
    if(!self.series.hidden){
        [self.chart.animationTracker hideSeries:self.series animation:animation duration:1 completion:nil];
    } else {
        [self.chart.animationTracker showSeries:self.series animation:animation duration:1 completion:nil];
    }
    
    [self.chart redrawChart];
}

-(SChartAnimation*)animationForSeries {
    if([self.series isKindOfClass:[SChartColumnSeries class]]) {
        return [SChartAnimation growVerticalAnimation];
    }
    
    return [SChartAnimation televisionAnimation];
}

@end
