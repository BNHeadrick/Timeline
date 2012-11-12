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
@synthesize statusLabel;


-(IBAction)addPageImage:(UITapGestureRecognizer *)recognizer:(UITapGestureRecognizer *)recognizer{
  [timeline addPage];
  NSLog(@"num of pages is %d", [[timeline pages] count]);
  [(TimeLineView *)_tlView setNumLines:[[timeline pages] count]];
  [_tlView setNeedsDisplay];
}

//scroll the timelineArea to specify a page to make active.
-(IBAction)timelinePan:(UIPanGestureRecognizer *)recognizer{
  
  NSLog(@"PannedTime");
  
  
}

//tap on the timeline area to specify a page to make active
-(IBAction)timelineTap:(UITapGestureRecognizer *)recognizer{
  
  NSLog(@"TouchedTimeline");
  
  
}

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

@end
