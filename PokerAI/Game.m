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
        self.players = [[NSMutableArray alloc] init];
        [self.players addObject:[[HumanPlayer alloc] initWithChipCount:500]];
        
        for (int i = 0; i < self.initialPlayerCount - 1; i++)
        {
            [self.players addObject:[[ComputerPlayer alloc] initWithChipCount:500]];
        }
    }
    
    return self;
}

@end
