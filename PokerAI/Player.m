//
//  Player.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Player.h"

#import "HandStrengthCalculator.h"
@implementation Player

- (instancetype) initWithChipCount:(int)startingChipCount seatIndex:(int)seat
{
    self = [super init];
    
    if (self)
    {
        self.chipCount = startingChipCount;
        self.betAmount = 0;
        self.firstCard = [[Card alloc] init];
        self.secondCard = [[Card alloc] init];
        self.seatIndex = seat;
    }
    
    return self;
}

- (void)decideAction:(int)handPhase toCall:(int)bet withPlayersLeft:(int)playersLeft { }

- (void)check
{
    NSLog(@"Player checks.");
}

- (void)call:(int)amount
{
    NSLog(@"Player calls bet of %d chips", amount);
    self.chipCount -= amount - self.betAmount;
    self.betAmount = amount;
}

- (void)bet:(int)amount
{
    NSLog(@"Player bet %d chips", amount);
    self.betAmount += amount;
    self.chipCount -= amount;
}

- (void)fold
{
    NSLog(@"Player folds.");
}

@end
