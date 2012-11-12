//
//  Timeline.h
//  T-Line
//
//  Created by Brandon Headrick on 11/10/12.
//  Copyright (c) 2012 Brandon Headrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Page.h"

@interface Timeline : NSObject{

  
  
}
//TODO; ACTUALLY MAKE THIS AN ARRAY OF TYPE SHAPE NOT A GENERIC ARRAY OF WHATEVER
@property (strong, nonatomic, retain) NSMutableArray* shapes;
@property (strong, nonatomic, retain) NSMutableArray* pages;

- (id)init;
- (void)addPage;

@end
