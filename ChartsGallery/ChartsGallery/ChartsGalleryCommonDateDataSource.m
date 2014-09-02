//
//  ChartsGalleryCommonDateDataSource.m
//  ChartsGallery
//
//  Created by Alison Clarke on 08/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ChartsGalleryCommonDateDataSource.h"

@implementation ChartsGalleryCommonDateDataSource

- (instancetype)initWithDataFromFile:(NSString *)filename {
  self = [super initWithDataFromFile:filename];
  if (self) {
    self.dateComponents = [NSDateComponents new];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  }
  return self;
}

@end
