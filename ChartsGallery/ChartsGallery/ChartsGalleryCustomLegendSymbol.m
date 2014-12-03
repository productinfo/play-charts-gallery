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
@property SChartColumnSeries *series;
@property UISwitch *swtch;

@end

@implementation ChartsGalleryCustomLegendSymbol

- (id)initWithChart:(ShinobiChart *)chart andSeries:(SChartColumnSeries*)series{
  self = [super init];
  if (self) {
    self.chart = chart;
    self.series = series;
    
    self.swtch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 31)];
    self.swtch.on = YES;
    [self.swtch addTarget:self
                action:@selector(switchToggled:)
      forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.swtch];
  }
  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  self.swtch.onTintColor = self.series.style.areaColor;
}

- (void)switchToggled:(UISwitch *)sender{
  [self.series setHidden:!self.series.hidden];
  [self.chart redrawChart];
}

@end
