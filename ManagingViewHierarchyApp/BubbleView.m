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
      
      // poppity pop
      UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(popTap:)];
      tapRecognizer1.numberOfTapsRequired = 1;
      [self addGestureRecognizer:tapRecognizer1];
    
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
}

//-(void)changeGravity:(CGVector)gravityVector {
//  _gravity.gravityDirection = gravityVector;
//  [_animator addBehavior:_gravity];
//    //  NSLog(@"changeGravity method in bubble is being called.");
//}

- (void)popTap:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CABasicAnimation* boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
        boundsAnim.fromValue = [NSValue valueWithCGRect:self.layer.bounds];
        boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(10, 10, 30, 30)];
        boundsAnim.duration = 0.2;
        [self.layer addAnimation:boundsAnim forKey:@"bounds"];
        
        self.layer.bounds = CGRectMake(10, 10, 0, 0);
    }
}

@end
