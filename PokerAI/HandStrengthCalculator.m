//
//  HandStrengthCalculator.m
//  PokerAI
//
//  Created by Kristian Lien on 1/16/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "HandStrengthCalculator.h"

@implementation HandStrengthCalculator

+ (double)getHandStrength:(Card *)firstCard secondCard:(Card *)secondCard
{
    double handStrength = 0.0;
    
    if ([firstCard.suit isEqualToString:secondCard.suit])
    {
        handStrength += 5.0;
    }
    
    if ([firstCard.value isEqualToString:secondCard.suit])
    {
        handStrength += 10.0;
        handStrength += [self getStrengthOfPocketPair:firstCard.value];
    }
    
    return handStrength;
}

+ (double)getStrengthOfPocketPair:(NSString *)value
{
    //NSArray *suits = [NSArray arrayWithObjects:kHeartSuit, kDiamondSuit, kSpadeSuit, kClubSuit, nil];
    NSArray *values = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", nil];
    
    for (int i = 0; i < [values count]; i++)
    {
        if ([values[i] isEqualToString:value])
        {
            return (double)i;
        }
    }
    
    return 0.0;
}

@end
