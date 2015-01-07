//
//  Player.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype) initWithChipCount:(int)startingChipCount seatIndex:(int)seat
{
    self = [super init];
    
    if (self)
    {
        self.chipCount = startingChipCount;
        self.firstCard = [[Card alloc] init];
        self.secondCard = [[Card alloc] init];
        self.seatIndex = seat;
    }
    
    return self;
}

- (void)check
{
    
}

- (void)bet:(int)amount
{
    
}

- (void)fold
{
    
}

@end
