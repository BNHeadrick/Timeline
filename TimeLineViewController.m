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
  
  int theActivePage = [self calcActivePage:recognizer];
  
  [timeline setActivePageWithIndex:theActivePage];
  [(TimeLineView *)_tlView setActivePage: theActivePage];
  
  [_tlView setNeedsDisplay];
  
  
}

//tap on the timeline area to specify a page to make active
-(IBAction)timelineTap:(UITapGestureRecognizer *)recognizer{
  
  //int theActivePage = 0;
  
  int theActivePage = [self calcActivePage:(UIPanGestureRecognizer *)recognizer];
  
  [timeline setActivePageWithIndex:theActivePage];
  [(TimeLineView *)_tlView setActivePage: theActivePage];
  
  [_tlView setNeedsDisplay];
  
}

-(int) calcActivePage:(UIGestureRecognizer *)recognizer{
  //TODO; make this get the size of the view object, not hardcoded width based on the storyboard attribute.
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  //  CGFloat screenWidth = screenRect.size.width-108;
  CGFloat screenWidth = screenRect.size.height-108;
  
  NSLog(@"numlines is %d",[(TimeLineView *)_tlView numLines]);
  int numLines = [(TimeLineView *)_tlView numLines];
  int displacement = screenWidth/numLines;
  int absLoc = screenWidth;
  int activeIndex = 0;
  int tempActive = -1;
  if(numLines>0){
    for(int i = 0; i<numLines-1; i++){
      tempActive = numLines-2;
      absLoc = absLoc - displacement;
      
      CGPoint location = [recognizer locationInView:self.view];
      
      if(location.x < absLoc){
        //NSLog(@"trans %f%f",location.x,location.y);
        tempActive = tempActive - i;
        activeIndex = (numLines-1) - tempActive;
        
        //NSLog(@"trans %f  %f  %d",location.x,location.y,tempActive);
      }
      
    }
    
  }
  NSLog(@" activeIndex is %d", activeIndex);
  return activeIndex;
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
