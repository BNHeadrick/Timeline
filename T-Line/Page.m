//
//  Page.m
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//

/*
 It makes sense to "objectify" this particular thing instead of throwing everything in the timeline.
 I assume pages will need to hold some kind of sketch information, I just don't know what that is yet.
 */

#import "Page.h"

@implementation Page
@synthesize pageNum;

-(id) initWithPageNum:(int) pageNum{
  self.pageNum = pageNum;
  return 0;
}

@end
