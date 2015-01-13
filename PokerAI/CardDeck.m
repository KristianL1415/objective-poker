//
//  CardDeck.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CardDeck.h"

#import "Card.h"
#import "StringConstants.h"

#include <stdlib.h>

@implementation CardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.cards = [[NSMutableArray alloc] init];
        NSArray *suits = [NSArray arrayWithObjects:kHeartSuit, kDiamondSuit, kSpadeSuit, kClubSuit, nil];
        NSArray *values = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", nil];
        
        for (NSString *suit in suits)
        {
            for (NSString *value in values)
            {
                [self.cards addObject:[[Card alloc] initWithSuit:suit value:value]];
            }
        }
    }
    
    return self;
}

- (void)shuffle
{
    if ([self.cards count] == 52)
    {
        // TODO: implement a shuffling algorithm here
        NSMutableArray *firstSplit = [[NSMutableArray alloc] init];
        NSMutableArray *secondSplit = [[NSMutableArray alloc] init];
        
        NSIndexSet *firstSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 26)];
        NSIndexSet *secondSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(26, 26)];
        [firstSplit addObjectsFromArray:[self.cards objectsAtIndexes:firstSet]];
        [secondSplit addObjectsFromArray:[self.cards objectsAtIndexes:secondSet]];
        
        NSMutableArray *tempDeck = [[NSMutableArray alloc] init];
        int topDeck = arc4random_uniform(2);
        
        if (topDeck == 0)
        {
            // begin with first deck
        }
        else if (topDeck == 1)
        {
            // begin w/ second deck
        }
        
        
    }
}

@end
