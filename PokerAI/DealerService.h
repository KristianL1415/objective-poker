//
//  DealerService.h
//  PokerAI
//
//  Created by Kristian Lien on 1/19/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Hand.h"
#import "Player.h"
#import "HumanPlayer.h"
#import "ComputerPlayer.h"

@interface DealerService : NSObject

+ (void)decideAction:(Player *)player forHand:(Hand *)hand;
+ (int)getNextPlayerIndex:(int)currentPosition withPlayerCount:(int)playerCount;
+ (int)getPreviousPlayerIndex:(int)currentPosition withPlayerCount:(int)playerCount;

@end
