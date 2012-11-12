//
//  TimeLineViewController.h
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timeline.h"
#import "TimeLineView.h"

@interface TimeLineViewController : UIViewController

@property (strong, nonatomic) Timeline* timeline;
@property (strong, nonatomic) TimeLineView* timeView;
@property (strong, nonatomic) UIView *tlView;
@property (strong, nonatomic) UIView *apView;

-(id)init;

-(IBAction)click:(UIButton *)sender;

@end
