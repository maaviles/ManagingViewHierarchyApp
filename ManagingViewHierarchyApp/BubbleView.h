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
@property (weak, nonatomic) id<BubbleViewDelegate> delegate;
@end

@protocol BubbleViewDelegate <NSObject>

@required
-(void)removeBubbleFromBehaviours:(BubbleView *)bubble;

@end