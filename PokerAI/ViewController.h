//
//  ViewController.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Card.h"
#import "Player.h"

@interface ViewController : UIViewController

- (void)displayCard:(Card *)card forPlayer:(Player *)player atPosition:(int)cardIndex;
- (void)displayBoardCard:(Card *)card atPosition:(int)cardIndex;

@end

