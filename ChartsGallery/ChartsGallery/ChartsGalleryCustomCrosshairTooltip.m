//
//  ChartsGalleryCustomCrosshairTooltip.m
//  ChartsGallery
//
//  Created by Daniel Allsop on 17/12/2014.
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

#import "ChartsGalleryCustomCrosshairTooltip.h"
#import <ShinobiCharts/SChartCanvas.h>
#import <ShinobiCharts/SChartGLView.h>
#import "ChartsGalleryCrosshairDataSource.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

static const CGFloat CustomCrosshairChartTooltipLabelPadding = 5.f;

@interface ChartsGalleryCustomCrosshairTooltip ()

@property (strong, nonatomic) ChartsGalleryCrosshairDataSource *dataSource;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *heartRate;
@property (strong, nonatomic) UILabel *pace;

@property (strong, nonatomic) NSArray *allLabels;

@end

@implementation ChartsGalleryCustomCrosshairTooltip

- (instancetype)initWithDataSource:(ChartsGalleryCrosshairDataSource *)dataSource {
  self = [super init];
  if (self) {
    self.dataSource = dataSource;
    
    self.dateFormatter = [NSDateFormatter new];
    [self.dateFormatter setDateFormat:@"HH:mm"];
    
    self.dateLabel = [self createTooltipLabel];
    self.dateLabel.font = [UIFont shinobiFontOfSize:13];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.dateLabel];
    
    self.heartRate = [self createTooltipLabel];
    [self addSubview:self.heartRate];
    
    self.pace = [self createTooltipLabel];
    [self addSubview:self.pace];
    
    self.allLabels = @[self.dateLabel, self.heartRate, self.pace];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor shinobiDarkGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 3;
  }
  return self;
}

// Method to create a label to add to the tooltip
- (UILabel*)createTooltipLabel {
  UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  newLabel.backgroundColor = [UIColor clearColor];
  newLabel.font = [UIFont shinobiFontOfSize:12];
  newLabel.textColor = [UIColor shinobiDarkGrayColor];
  return newLabel;
}

- (void)updateWithDataPoint:(SChartDataPoint *)dataPoint {
  // Get a date and heart rate from the data point and display as label text
  self.dateLabel.text = [self.dateFormatter stringFromDate:dataPoint.xValue];
  self.heartRate.text = [NSString stringWithFormat:@"Heart Rate: %@ bpm", dataPoint.yValue];
  
  // We want to also show the pace data, that's not shown on the chart, so we'll have to get
  // it from the data source
  NSDictionary *dataCollection = self.dataSource.dataCollection[dataPoint.index];
  self.pace.text = [NSString stringWithFormat:@"Pace: %@ kph", dataCollection[@"Pace"]];
  
  // Lay out the labels, keeping track of the maximum width
  CGFloat maxLabelWidth = 0;
  CGFloat currentMaxHeight = CustomCrosshairChartTooltipLabelPadding;
  
  for (UILabel *label in self.allLabels) {
    // Position the label
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin = CGPointMake(CustomCrosshairChartTooltipLabelPadding, currentMaxHeight);
    label.frame = frame;
    
    maxLabelWidth = MAX(maxLabelWidth, label.frame.size.width);
    currentMaxHeight += label.frame.size.height;
  }
  
  // Further customize top most label in crosshair tooltip
  // To center the top most label after we have deduced the maximum label width of all the labels.
  CGRect labelFrame = self.dateLabel.frame;
  labelFrame.size.width = maxLabelWidth;
  self.dateLabel.frame = labelFrame;
  
  // Resize tooltip frame
  CGRect frame = self.frame;
  frame.size.width = maxLabelWidth + (2 * CustomCrosshairChartTooltipLabelPadding);
  frame.size.height = currentMaxHeight + CustomCrosshairChartTooltipLabelPadding;
  self.frame = frame;
}

@end
