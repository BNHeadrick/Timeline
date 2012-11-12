//
//  TimeLineViewController.m
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//
/*
 TimelineViewController
 This class is the class associated with all the interaction with the TimelineView.
 You will need to monitor drags for moving through the timeline.
 Taps will need to show or hide the view so you'll set a isHidden variable.
*/

#import "TimeLineViewController.h"
#import "TimelineView.h"

@implementation TimeLineViewController
@synthesize timeline;
@synthesize timeView;


- (void)viewDidLoad
{
  [super viewDidLoad];
  [self init];
  
  
  _tlView = (UIView *)[self.view viewWithTag:1];
  _apView = (UIView *)[self.view viewWithTag:2];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(id) init {
  self = [super init];
  timeline = [[Timeline alloc] init];
  [(TimeLineView *)_tlView setNumLines:0];
  return self;
}

-(IBAction)click:(UIButton *)sender{
  
  [timeline addPage];
  
  int counter = [[timeline pages] count];
  
  NSLog(@"num of pages is %d", counter);

  //[timeView drawRectWithNumLines: counter];
  
  //[TimeLineView drawRectWithNumLines: counter];
  
  //[(TimeLineView *)_tlView drawRectWithNumLines:counter];
  [(TimeLineView *)_tlView setNumLines:counter];
  
  
  
  //[self setNeedsDisplayInRect: testRect];
  
  //[(TimeLineView *)_tlView drawRect:[self.view frame]];
  
  [_tlView setNeedsDisplay];
  
  //[[[timeline pages] objectAtIndex:0]setWindow:[UIApplication sharedApplication].keyWindow];
  
  //first, create view for this page
  //THEN, set the setNeedsDisplay
  
  
  
  //[[[timeline pages] objectAtIndex:0] setNeedsDisplay];
  
}

@end
