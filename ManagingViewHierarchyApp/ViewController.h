//
//  ViewController.h
//  ManagingViewHierarchyApp
//
//  Created by Bennett Lin on 11/2/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BubbleView;

@interface ViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *bubbles;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collision;
//@property (strong, nonatomic) UICollisionBehavior *subbleCollision;

@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UILabel *gravityItemsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *collisionItemsCountLabel;

-(void)removeBubbleFromBehaviours:(BubbleView *)bubble;

- (IBAction)upButtonTapped:(id)sender;
- (IBAction)downButtonTapped:(id)sender;
- (IBAction)leftButtonTapped:(id)sender;
- (IBAction)rightButtonTapped:(id)sender;

@end
