  //
  //  BubbleView.m
  //  ManagingViewHierarchyApp
  //
  //  Created by Bennett Lin on 11/3/13.
  //  Copyright (c) 2013 Bennett Lin. All rights reserved.
  //

#import "BubbleView.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
      // Initialization code
    
//    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
//    _gravity = [[UIGravityBehavior alloc] init];
      //      _gravity.gravityDirection = CGVectorMake(0, 1);
    
//    [_animator addBehavior:_gravity];
    
    self.backgroundColor = [UIColor greenColor];
    self.layer.cornerRadius = 25.0;
    self.clipsToBounds = YES;
    
//    NSMutableArray *tempSubbles = [[NSMutableArray alloc] init];
    
//    for (int i = 1; i <= 4; i++) {
//      CGFloat randX = arc4random_uniform(40);
//      CGFloat randY = arc4random_uniform(40);
//      UIView *subble = [[UIView alloc] initWithFrame:CGRectMake(randX, randY, 10, 10)];
//      subble.backgroundColor = [UIColor blueColor];
//      subble.layer.cornerRadius = 5.0;
//      subble.clipsToBounds = YES;
//      [self addSubview:subble];
//      [_gravity addItem:subble];
//      [tempSubbles addObject:subble];
//    }
    
//    _collision = [[UICollisionBehavior alloc] initWithItems:tempSubbles];
//    _collision.translatesReferenceBoundsIntoBoundary = YES;
//    [_collision addBoundaryWithIdentifier:@"boundary" forPath:[UIBezierPath bezierPathWithRoundedRect:self.frame cornerRadius:25.0]];
//    [_animator addBehavior:_collision];
    
//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
//                                             initWithTarget:self action:@selector(respondToTapGesture)];
//    tapRecognizer.numberOfTapsRequired = 1;
//    [self addGestureRecognizer:tapRecognizer];
  }
  return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//	NSLog(@"touchesBegan method called");
  UITouch *touch = [touches anyObject];
  if ([touch view] == self) {
    CGPoint touchPoint = [touch locationInView:self.superview];
    CGFloat originalX = self.center.x;
    CGFloat originalY = self.center.y;
    NSLog(@"touchesBegan: original: %f, %f", originalX, originalY);
    CGFloat changedX = touchPoint.x;
    CGFloat changedY = touchPoint.y;
    NSLog(@"touchesBegan: changed: %f, %f", changedX, changedY);
    self.center = CGPointMake(changedX, changedY);
    [self.delegate removeBubbleFromBehaviours:self];
    return;
  }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//  NSLog(@"touchesMoved method called");
	UITouch *touch = [touches anyObject];
	if ([touch view] == self) {
    CGPoint touchPoint = [touch locationInView:self.superview];
    CGFloat originalX = self.center.x;
    CGFloat originalY = self.center.y;
    NSLog(@"touchesMoved: original: %f, %f", originalX, originalY);
    CGFloat changedX = touchPoint.x;
    CGFloat changedY = touchPoint.y;
    NSLog(@"touchesMoved: changed: %f, %f", changedX, changedY);
    self.center = CGPointMake(changedX, changedY);
    return;
	}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touchesEnded method called");
	
	UITouch *touch = [touches anyObject];
	if ([touch view] == self) {
    [self.delegate addBubbleToBehaviours:self];
    [self.delegate refreshAnimation];
		return;
	}		
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

//-(void)respondToTapGesture {
    //  NSLog(@"%@ was tapped.", [self description]);
//  [UIView animateWithDuration:0.5
//                        delay:0.0
//                      options:0
//                   animations:^{
//                     self.backgroundColor = [UIColor colorWithRed:0 green:256 blue:0 alpha:0];
//                     
//                   }
//                   completion:^(BOOL finished){
//                     [self removeFromSuperview];
//                   }];
//  [self.delegate removeBubbleFromBehaviours:self];
//}

//-(void)changeGravity:(CGVector)gravityVector {
//  _gravity.gravityDirection = gravityVector;
//  [_animator addBehavior:_gravity];
//    //  NSLog(@"changeGravity method in bubble is being called.");
//}

@end
