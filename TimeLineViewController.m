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

/*
 -(IBAction)controlPan:(UIPanGestureRecognizer *)recognizer{
   CGPoint translation = [recognizer translationInView:self.view];
   recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
   [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
 }
*/

-(IBAction)addPageImage:(UITapGestureRecognizer *)recognizer:(UITapGestureRecognizer *)recognizer{
  [timeline addPage];
  //NSLog(@"num of pages is %d", [[timeline pages] count]);
  [(TimeLineView *)_tlView setNumLines:[[timeline pages] count]];
  [_tlView setNeedsDisplay];
}

//scroll the timelineArea to specify a page to make active.
-(IBAction)timelinePan:(UIPanGestureRecognizer *)recognizer{
  
  NSLog(@"PannedTime");
  
  //NSLog(@"TouchedTimeline");
  
  //TODO; make this get the size of the view object, not hardcoded width based on the storyboard attribute.
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  //  CGFloat screenWidth = screenRect.size.width-108;
  CGFloat screenWidth = screenRect.size.height-108;
  
  //the below code is gross...I will get to making it cleaner later.  For now, I'm moving on.
  //nieve way to get the subdivision of the UIView area; draws right to left
  NSLog(@"numlines is %d",[(TimeLineView *)_tlView numLines]);
  int numLines = [(TimeLineView *)_tlView numLines];
  int displacement = screenWidth/numLines;
  int absLoc = screenWidth;
  int activeIndex = [(TimeLineView *)_tlView numLines]-1;
  int tempActive = -1;
  if(numLines>0){
    for(int i = 0; i<numLines-1; i++){
      tempActive = [(TimeLineView *)_tlView numLines]-2;
      absLoc = absLoc - displacement;
      
      CGPoint location = [recognizer locationInView:self.view];
      
      if(location.x < absLoc){
        //NSLog(@"trans %f%f",location.x,location.y);
        tempActive = tempActive - i;
        activeIndex = tempActive;
        //NSLog(@"trans %f  %f  %d",location.x,location.y,tempActive);
      }
      
    }
    //activeIndex = tempActive;
    [timeline setActivePageWithIndex:activeIndex];
    NSLog(@"activeIs %d",activeIndex);
  }
  
  
}

//tap on the timeline area to specify a page to make active
-(IBAction)timelineTap:(UITapGestureRecognizer *)recognizer{
  
  //NSLog(@"TouchedTimeline");
  
  //TODO; make this get the size of the view object, not hardcoded width based on the storyboard attribute.
  CGRect screenRect = [[UIScreen mainScreen] bounds];
//  CGFloat screenWidth = screenRect.size.width-108;
  CGFloat screenWidth = screenRect.size.height-108;
  
  //the below code is gross...I will get to making it cleaner later.  For now, I'm moving on.
  //nieve way to get the subdivision of the UIView area; draws right to left
  NSLog(@"numlines is %d",[(TimeLineView *)_tlView numLines]);
  int numLines = [(TimeLineView *)_tlView numLines];
  int displacement = screenWidth/numLines;
  int absLoc = screenWidth;
  int activeIndex = [(TimeLineView *)_tlView numLines]-1;
  int tempActive = -1;
  if(numLines>0){
    for(int i = 0; i<numLines-1; i++){
      tempActive = [(TimeLineView *)_tlView numLines]-2;
      absLoc = absLoc - displacement;
      
      CGPoint location = [recognizer locationInView:self.view];
      
      if(location.x < absLoc){
        //NSLog(@"trans %f%f",location.x,location.y);
        tempActive = tempActive - i;
        activeIndex = tempActive;
        //NSLog(@"trans %f  %f  %d",location.x,location.y,tempActive);
      }
      
    }
    //activeIndex = tempActive;
    [timeline setActivePageWithIndex:activeIndex];
    NSLog(@"activeIs %d",activeIndex);
  }
  
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
