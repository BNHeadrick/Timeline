//
//  Timeline.m
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//
/*
 Timeline
 This class represents the Timeline object. You will need to be able to add pages. If you have one page the whole timeline is one. If you add another then it halves it. If you add a third then it divides in three, etc.
*/


/*
 curring thingie to do; make this call a draw function in timelineView so that it draws in that view.
 */
#import "Timeline.h"

@implementation Timeline

@synthesize pages;
@synthesize activePage;

-(id) init {
  self = [super init];
  pages = [[NSMutableArray alloc] init];
  return self;
  
}

//-(void) draw:(CGContextRef) context {
//  
//}


-(void) addPage{
  [pages addObject:[[Page alloc] init]];
  activePage = [pages lastObject];
  //activePage = [pages
  //[pages addObject:[[NSString alloc]init]];
  //view.frame = CGMakeRect(10,10,20,20);
}

@end
