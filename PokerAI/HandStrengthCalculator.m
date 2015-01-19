//
//  HandStrengthCalculator.m
//  PokerAI
//
//  Created by Kristian Lien on 1/16/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "HandStrengthCalculator.h"

@implementation HandStrengthCalculator

+ (double)getHandStrengthForHand:(Hand *)hand firstCard:(Card *)firstCard secondCard:(Card *)secondCard
{
    double strength = 0.0;
    
    switch (hand.phase)
    {
        case 0:
            strength = [self getPreFlopHandStrength:firstCard secondCard:secondCard];
            break;
        case 1:
            strength = [self getPostFlopHandStrengthForHand:hand firstCard:firstCard secondCard:secondCard];
            break;
        case 2:
            strength = [self getPostTurnHandStrengthForHand:hand firstCard:firstCard secondCard:secondCard];
            break;
        case 3:
            strength = [self getPostRiverHandStrengthForHand:hand firstCard:firstCard secondCard:secondCard];
            break;
            
        default:
            break;
    }
    
    return strength;
}

+ (double)getPreFlopHandStrength:(Card *)firstCard secondCard:(Card *)secondCard
{
    double strength = 0.0;
    
    strength += [self getCardStrength:firstCard];
    strength += [self getCardStrength:secondCard];
    strength += [self checkForConnectorCard:firstCard withCard:secondCard];
    
    if ([firstCard.suit isEqualToString:secondCard.suit])
    {
        strength += 4.0;
    }
    
    if ([firstCard.value isEqualToString:secondCard.value])
    {
        strength += 10.0;
        strength += [self getStrengthOfPocketPair:firstCard.value];
    }
    
    NSLog(@"Hand: %@ %@, %@ %@", firstCard.suit, firstCard.value, secondCard.suit, secondCard.value);
    NSLog(@"Hand strength: %f", strength);
    
    return strength;
}

+ (double)getPostFlopHandStrengthForHand:(Hand *)hand firstCard:(Card *)firstCard secondCard:(Card *)secondCard
{
    double strength = 0.0;
    
    // TODO: calculate hand strength while accounting for the board
    
    return strength;
}

+ (double)getPostTurnHandStrengthForHand:(Hand *)hand firstCard:(Card *)firstCard secondCard:(Card *)secondCard
{
    double strength = 0.0;
    
    // TODO: calculate hand strength while accounting for the board
    
    return strength;
}

+ (double)getPostRiverHandStrengthForHand:(Hand *)hand firstCard:(Card *)firstCard secondCard:(Card *)secondCard
{
    double strength = 0.0;
    
    // TODO: calculate hand strength while accounting for the board
    
    return strength;
}

#pragma mark - Utility Methods

+ (int)getCardValueIndex:(Card *)card
{
    NSArray *values = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", nil];
    
    for (int i = 0; i < [values count]; i++)
    {
        if ([values[i] isEqualToString:card.value])
        {
            return i;
        }
    }
    
    return 0;
}

+ (double)getCardStrength:(Card *)card
{
    double strength = (double)[self getCardValueIndex:card];
    return strength;
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

+ (double)checkForConnectorCard:(Card *)firstCard withCard:(Card *)secondCard
{
    NSArray *values = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", nil];
    int firstCardIndex = [self getCardValueIndex:firstCard];
    int secondCardIndex = [self getCardValueIndex:secondCard];
    
    for (int i = 0; i < [values count]; i++)
    {
        if (firstCardIndex == 0)
        {
            if (secondCardIndex == 1)
            {
                return 2.0;
            }
        }
        else if (firstCardIndex == [values count] - 1)
        {
            if (secondCardIndex == [values count] - 2)
            {
                return 2.0;
            }
        }
        else if (firstCardIndex == i)
        {
            if ([values[i-1] isEqualToString:secondCard.value] || [values[i+1] isEqualToString:secondCard.value])
            {
                return 2.0;
            }
        }
    }
    
    return 0.0;
}

@end
