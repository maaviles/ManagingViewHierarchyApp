//
//  ViewController.m
//  ManagingViewHierarchyApp
//
//  Created by Bennett Lin on 11/2/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

@interface ViewController () <BubbleViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  self.bubbles = [[NSMutableArray alloc] init];
  
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(addBubbleWhereTapped:)];
  tapRecognizer.numberOfTapsRequired = 1;
  [self.view addGestureRecognizer:tapRecognizer];
  
  
  _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
  _gravity = [[UIGravityBehavior alloc] init];
  _gravity.gravityDirection = CGVectorMake(0, 0.5);

  _collision = [[UICollisionBehavior alloc] init];
  _collision.translatesReferenceBoundsIntoBoundary = YES;
  
  CGFloat superWidth = self.view.frame.size.width - 50;
  CGFloat superHeight = self.view.frame.size.height - 50;
  
  // create bubbles
  for (int i = 1; i <= 5; i++) {
    CGFloat randX = arc4random_uniform(superWidth);
    CGFloat randY = arc4random_uniform(superHeight);
//    NSLog(@"random coordinates are %f, %f", randX, randY);
    BubbleView *bubble = [[BubbleView alloc] initWithFrame:CGRectMake(randX, randY, 50, 50)];
    bubble.delegate = self;
    [self.view addSubview:bubble];
    [self.bubbles addObject:bubble];
    [_gravity addItem:bubble];
    [_collision addItem:bubble];
    NSLog(@"%@ was created.", [bubble description]);
//    NSMutableArray *tempSubbles = [[NSMutableArray alloc] init];
//    for (int j = 1; j <= 2; j++) {
//      UIView *subble = [[UIView alloc] initWithFrame:CGRectMake(j * 15, j * 15, 10, 10)];
//      subble.backgroundColor = [UIColor redColor];
//      subble.layer.cornerRadius = 5.0;
//      subble.clipsToBounds = YES;
//      [bubble addSubview:subble];
//      
//      [_gravity addItem:subble];
//      [tempSubbles addObject:subble];
//    }
//
//    UICollisionBehavior *subbleCollision = [[UICollisionBehavior alloc] initWithItems:tempSubbles];
//    [subbleCollision addBoundaryWithIdentifier:[NSString stringWithFormat:@"Boundary %i", i] forPath:[UIBezierPath bezierPathWithRoundedRect:bubble.frame cornerRadius:25.0]];
//    subbleCollision.translatesReferenceBoundsIntoBoundary = YES;
    
    // playing around with the order, haha
    [_animator addBehavior:_gravity];
//    [_animator addBehavior:subbleCollision];
    [_animator addBehavior:_collision];
    
    // Gravity based on device orientation
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
  }
  
  for (id behaviour in _animator.behaviors) {
//    NSLog(@"There is this behaviour: %@", [behaviour description]);
  }
  [self getBehaviourItemsCount];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Device orientation methods

// this is a mess, ha
-(void)orientationChanged:(NSNotification *)notification {
//  NSLog(@"orientation is %i", [[UIDevice currentDevice] orientation]);
  switch ([[UIDevice currentDevice] orientation]) {
      
      // locking orientation
      
      // re-adding _gravity doesn't actually add a new behaviour to _animator,
      // but is there a better way to reload _gravity so that it reflects the new value?
      
      // right side up
      case 1:
        [self changeAllTheGravities:CGVectorMake(0, 1)];
        break;
      // upside down
      case 2:
        [self changeAllTheGravities:CGVectorMake(0, -1)];
        break;
      // on left side
      case 3:
        [self changeAllTheGravities:CGVectorMake(-1, 0)];
        break;
      // on right side
      case 4:
        [self changeAllTheGravities:CGVectorMake(1, 0)];
        break;
      default:
        break;
  }
  
}

- (IBAction)upButtonTapped:(id)sender {
  [self changeAllTheGravities:CGVectorMake(0, -1)];
//  NSLog(@"number of behaviours: %lu", (unsigned long)[_animator.behaviors count]);
}

- (IBAction)downButtonTapped:(id)sender {
  [self changeAllTheGravities:CGVectorMake(0, 1)];
}

- (IBAction)leftButtonTapped:(id)sender {
  [self changeAllTheGravities:CGVectorMake(-1, 0)];
}

- (IBAction)rightButtonTapped:(id)sender {
  [self changeAllTheGravities:CGVectorMake(1, 0)];
}

#pragma mark - bubble REST (sort of) methods

-(void)addBubbleWhereTapped:(UITapGestureRecognizer *)sender {
  CGPoint tapPoint = [sender locationInView:self.view];
  
  // otherwise bubble will be created outside of view
  if (tapPoint.x < self.view.frame.size.width - 35 &&
      tapPoint.y < self.view.frame.size.height - 35) {
    BubbleView *newBubble = [[BubbleView alloc]
      initWithFrame:CGRectMake(tapPoint.x, tapPoint.y, 50, 50)];
    newBubble.delegate = self; // don't forget this again, haha
    [self.view addSubview:newBubble];
    [self.bubbles addObject:newBubble];
    [_gravity addItem:newBubble];
    [_collision addItem:newBubble];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    [self getBehaviourItemsCount];
  }
}

-(void)addBubbleToBehaviours:(BubbleView *)bubble {
  [self.bubbles addObject:bubble];
  [_gravity addItem:bubble];
  [_collision addItem:bubble];
  [_animator addBehavior:_gravity];
  [_animator addBehavior:_collision];
  [self getBehaviourItemsCount];
}

-(void)removeBubbleFromBehaviours:(BubbleView *)bubble {
  [self.bubbles removeObject:bubble];
  [_gravity removeItem:bubble];
  [_collision removeItem:bubble];
  [_animator addBehavior:_gravity];
  [_animator addBehavior:_collision];
  [self getBehaviourItemsCount];
}

-(void)getBehaviourItemsCount {
  self.gravityItemsCountLabel.text =
    [NSString stringWithFormat:@"Gravity items: %lu", (unsigned long)_gravity.items.count];
  self.collisionItemsCountLabel.text =
    [NSString stringWithFormat:@"Collision items: %lu", (unsigned long)_collision.items.count];
}

-(void)changeAllTheGravities:(CGVector)gravityVector {
  // possibly a criminally inefficient way of resetting the gravity
  // for all the bubbles inside the bubbles, haha...
  
  _gravity.gravityDirection = gravityVector;
  
//  for (BubbleView *bubble in self.bubbles) {
//    [bubble changeGravity:gravityVector];
//    NSLog(@"changeGravity method being called from view controller.");
//  }
//  NSLog(@"changeAllTheGravities method being called.");
//  NSLog(@"self.bubbles count: %lu", (unsigned long) [self.bubbles count]);
  [_animator addBehavior:_gravity];
}

-(void)refreshAnimation {
  [_animator addBehavior:_gravity];
  [_animator addBehavior:_collision];
}

@end
