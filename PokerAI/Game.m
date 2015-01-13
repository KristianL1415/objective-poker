//
//  Game.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Game.h"

#import "HumanPlayer.h"
#import "ComputerPlayer.h"

@implementation Game

- (instancetype) initWithNumberOfPlayers:(int)playerCount
{
    self = [super init];
    
    if (self)
    {
        self.initialPlayerCount = playerCount;
        self.playersRemaining = playerCount;
        // TODO: Eventually could remove hardcoding of blinds/starting chip amount
        self.smallBlind = 25;
        self.bigBlind = 50;
        self.players = [[NSMutableArray alloc] init];
        [self.players addObject:[[HumanPlayer alloc] initWithChipCount:500 seatIndex:0]];
        
        for (int i = 1; i < self.initialPlayerCount; i++)
        {
            [self.players addObject:[[ComputerPlayer alloc] initWithChipCount:500 seatIndex:i]];
        }
    }
    
    return self;
}

@end
