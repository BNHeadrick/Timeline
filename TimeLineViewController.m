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


//-(IBAction)controlPan:(UIPanGestureRecognizer *)recognizer{
//  CGPoint translation = [recognizer translationInView:self.view];
//  recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
//  [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
//}

-(IBAction)addPageImage:(UITapGestureRecognizer *)recognizer:(UITapGestureRecognizer *)recognizer{
  [timeline addPage];
  NSLog(@"num of pages is %d", [[timeline pages] count]);
  [(TimeLineView *)_tlView setNumLines:[[timeline pages] count]];
  [_tlView setNeedsDisplay];
}

/*
-(IBAction)tap:(UIPanGestureRecognizer *)recognizer{
  CGPoint translation = [recognizer translationInView:self.view];
  recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
  [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
  
  UITapGestureRecognizer *doubleTap =
  [[UITapGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(tapDetected:)];
  doubleTap.numberOfTapsRequired = 2;
  [self.view addGestureRecognizer:doubleTap];
}
 */

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self init];
  
  
  _tlView = (UIView *)[self.view viewWithTag:1];
  _apView = (UIView *)[self.view viewWithTag:2];
  //_addPageImage = (UIImage *)[self.view viewWithTag:3];
  
  /***
  //diff gesture stuff
  addPageImage.userInteractionEnabled = YES;
  
  
//  UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
//  [self.imageView addGestureRecognizer:panRecognizer];
  

  
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
  tapRecognizer.numberOfTapsRequired = 1;
  [addPageImage addGestureRecognizer:tapRecognizer];
  ***/
  
  //gesture code stuffs below
  /*
  UITapGestureRecognizer *doubleTap =
  [[UITapGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(tapDetected:)];
  doubleTap.numberOfTapsRequired = 2;
  [self.view addGestureRecognizer:doubleTap];
  
  UIPinchGestureRecognizer *pinchRecognizer =
  [[UIPinchGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(pinchDetected:)];
  [self.view addGestureRecognizer:pinchRecognizer];
  
  UIRotationGestureRecognizer *rotationRecognizer =
  [[UIRotationGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(rotationDetected:)];
  [self.view addGestureRecognizer:rotationRecognizer];
  
  UISwipeGestureRecognizer *swipeRecognizer =
  [[UISwipeGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(swipeDetected:)];
  swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
  [self.view addGestureRecognizer:swipeRecognizer];
  
  UILongPressGestureRecognizer *longPressRecognizer =
  [[UILongPressGestureRecognizer alloc]
   initWithTarget:self
   action:@selector(longPressDetected:)];
  longPressRecognizer.minimumPressDuration = 3;
  longPressRecognizer.numberOfTouchesRequired = 1;
  [self.view addGestureRecognizer:longPressRecognizer];
  */
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

/*-(IBAction)click:(UIButton *)sender{
  
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
 */
/*
- (IBAction)longPressDetected:(UIGestureRecognizer *)sender {
  statusLabel.text = @"Long Press";
}

- (IBAction)swipeDetected:(UIGestureRecognizer *)sender {
  statusLabel.text = @"Right Swipe";
}

- (IBAction)tapDetected:(UIGestureRecognizer *)sender {
  statusLabel.text = @"Double Tap";
}

- (IBAction)pinchDetected:(UIGestureRecognizer *)sender {
  
  CGFloat scale =
  [(UIPinchGestureRecognizer *)sender scale];
  CGFloat velocity =
  [(UIPinchGestureRecognizer *)sender velocity];
  
  NSString *resultString = [[NSString alloc] initWithFormat:
                            @"Pinch - scale = %f, velocity = %f",
                            scale, velocity];
  statusLabel.text = resultString;
}


- (IBAction)rotationDetected:(UIGestureRecognizer *)sender {
  CGFloat radians =
  [(UIRotationGestureRecognizer *)sender rotation];
  CGFloat velocity =
  [(UIRotationGestureRecognizer *)sender velocity];
  
  NSString *resultString = [[NSString alloc] initWithFormat:
                            @"Rotation - Radians = %f, velocity = %f",
                            radians, velocity];
  statusLabel.text = resultString;
}
*/



@end
