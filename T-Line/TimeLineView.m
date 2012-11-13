//
//  TimeLineView.m
//  FlipSketch
//
//  Created by Kevin Hampton on 10/12/12.
//  Copyright (c) 2012 Kevin Hampton. All rights reserved.
//
/*
 TimelineView
 Create a view that is instantiated by the initWithFrame constructor. This means the view is built given some rectangle object, Rect I believe.
 This view will contain a timeline view and will draw it using drawRect.
 
 this 
*/

#import "TimeLineView.h"

@implementation TimeLineView
@synthesize numLines;


-(id)init{
  [super init];
  
  //CGRect myImageRect = CGRectMake(0.0f, 0.0f, 320.0f, 109.0f);
  
  //[self initWithFrame:myImageRect];
  return 0;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

- (void)drawRect:(CGRect)rect{
  
  //TODO; make this get the size of the view object, not hardcoded width based on the storyboard attribute. (get reference to the UIImageView object.  Also needs to be dynamic in case the user flips the application.
  CGRect screenRect = [[UIScreen mainScreen] bounds];
//  CGFloat screenWidth = screenRect.size.width-108;
  CGFloat screenWidth = screenRect.size.height-108;
  //CGFloat screenHeight = screenRect.size.height;
  CGContextRef context    = UIGraphicsGetCurrentContext();

  CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);

  // Draw them with a 2.0 stroke width so they are a bit more visible.
  CGContextSetLineWidth(context, 2.0);
  
  //NSLog(@"testnum is %@",testNum);
  //int lines=testNum;
  
  //NSLog(@"numLines is %d",numLines);
  int displacement = screenWidth/numLines;
  int absLoc = screenWidth;
  if(numLines>0){
    for(int i = 0; i<numLines-1; i++){
      absLoc = absLoc - displacement;
      CGContextMoveToPoint(context, (absLoc),0); //start at this point
      
      CGContextAddLineToPoint(context, (absLoc), 100); //draw to this point
    }
  }
  
  // and now draw the Path!
  CGContextStrokePath(context);
  /**below is just a drawn rect on the top of the view**/
  
  /*
  // First, create a new rect with the upper half of the view
	CGRect upperRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height / 2);
	// Very similar to creating the upperRect, however for the lower portion of the view
	CGRect lowerRect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.width / 2), rect.size.width, rect.size.height / 2);
	
	[[UIColor redColor] set]; // red team color
	UIRectFill(upperRect); // this will fill the upper rect all red,
  // if you'd like, try these lines to get a nice effect
  // [[UIColor whiteColor] set];
  // UIRectFrame(upperRect); // This will frame the rect with a one point line I believe
	[[UIColor blueColor] set]; // blue team color
	UIRectFill(lowerRect); // and of course, fill our lower rect with blue
  */
  
}

@end
