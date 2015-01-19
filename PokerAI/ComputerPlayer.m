//
//  ComputerPlayer.m
//  PokerAI
//
//  Created by Kristian Lien on 1/6/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "ComputerPlayer.h"

#import "HandStrengthCalculator.h"

@implementation ComputerPlayer

/*
 * Decision making algorithm for AI
 * Accounts for action of others and phase of the hand
 * Could also account for button position, playing style, etc.
 */
- (void)decideActionForHand:(Hand *)hand
{
    [super decideActionForHand:hand];
    
    double handStrength = [HandStrengthCalculator getHandStrengthForHand:hand firstCard:self.firstCard secondCard:self.secondCard];
    
    if (hand.phase == 0 && handStrength > 20.0)
    {
        [self bet:100];
        [hand setCurrentBet:100];
    }
    else if (hand.currentBet == self.betAmount)
    {
        [self check];
    }
    else
    {
        // Decide to call or fold here
        if (handStrength < 12.0)
        {
            [self fold];
            [hand setPlayersInHand:hand.playersInHand - 1];
        }
        else
        {
            [self call:hand.currentBet];
        }
    }
}

@end
