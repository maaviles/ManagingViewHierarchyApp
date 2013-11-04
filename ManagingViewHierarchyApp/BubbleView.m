//
//  BubbleView.m
//  ManagingViewHierarchyApp
//
//  Created by Bennett Lin on 11/3/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      
      self.backgroundColor = [UIColor greenColor];
      self.layer.cornerRadius = 25.0;
      self.clipsToBounds = YES;
      
      UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(respondToTapGesture)];
      tapRecognizer.numberOfTapsRequired = 1;
      [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)respondToTapGesture {
  NSLog(@"%@ was tapped.", [self description]);
  self.backgroundColor = [UIColor blueColor];
  [self removeFromSuperview];
  [self.delegate removeBubbleFromBehaviours:self];
}

@end
