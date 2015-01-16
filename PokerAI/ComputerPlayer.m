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
- (void)decideAction:(int)handPhase toCall:(int)bet withPlayersLeft:(int)playersLeft
{
    [super decideAction:handPhase toCall:bet withPlayersLeft:playersLeft];
    
    double handStrength = [HandStrengthCalculator getHandStrength:self.firstCard secondCard:self.secondCard];
    
    if (handPhase == 0 && handStrength > 20.0)
    {
        [self bet:100];
    }
    else if (bet == 0)
    {
        [self check];
    }
    else
    {
        // Decide to call or fold here
        [self call:bet];
    }
}

@end
