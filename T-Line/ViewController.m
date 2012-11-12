//
//  ViewController.m
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//

#import "ViewController.h"
#import "Timeline.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)controlPan:(UIPanGestureRecognizer *)recognizer{
  CGPoint translation = [recognizer translationInView:self.view];
  recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
  [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  NSLog(@"This is an output message");
  
  //Timeline *timeline;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
