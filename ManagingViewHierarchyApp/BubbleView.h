//
//  BubbleView.h
//  ManagingViewHierarchyApp
//
//  Created by Bennett Lin on 11/3/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BubbleViewDelegate;

@interface BubbleView : UIView

//@property (strong, nonatomic) UIDynamicAnimator *animator;
//@property (strong, nonatomic) UIGravityBehavior *gravity;
//@property (strong, nonatomic) UICollisionBehavior *collision;
//@property CGVector gravityVector;
@property (weak, nonatomic) id<BubbleViewDelegate> delegate;

//-(void)changeGravity:(CGVector)gravityVector;

@end

@protocol BubbleViewDelegate <NSObject>

@required
-(void)addBubbleToBehaviours:(BubbleView *)bubble;
-(void)removeBubbleFromBehaviours:(BubbleView *)bubble;
  // does animation need to be refreshed?
-(void)refreshAnimation;

@end