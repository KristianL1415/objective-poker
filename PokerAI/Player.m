//
//  Player.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Player.h"

#import "HandStrengthCalculator.h"
#import "StringConstants.h"

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
        self.lastAction = @"";
    }
    
    return self;
}

- (void)decideActionForHand:(Hand *)hand { }

- (void)check
{
    [self setLastAction:kCheckAction];
    NSLog(@"Player checks.");
}

- (void)call:(int)amount
{
    [self setLastAction:kCallAction];
    NSLog(@"Player calls bet of %d chips", amount);
    self.chipCount -= amount - self.betAmount;
    self.betAmount = amount;
}

- (void)bet:(int)amount
{
    [self setLastAction:[NSString stringWithFormat:@"%@ %d", kBetAction, amount]];
    NSLog(@"Player bet %d chips", amount);
    self.betAmount += amount;
    self.chipCount -= amount;
}

- (void)fold
{
    [self setLastAction:kFoldAction];
    NSLog(@"Player folds.");
}

@end
