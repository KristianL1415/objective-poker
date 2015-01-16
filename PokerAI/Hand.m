//
//  Hand.m
//  PokerAI
//
//  Created by Kristian Lien on 1/16/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (instancetype) initWithNumberOfPlayers:(int)playerCount
{
    self = [super init];
    
    if (self)
    {
        self.phase = 0;
        self.potSize = 0;
        self.currentBet = 0;
        self.playersInHand = playerCount;
        self.board = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
