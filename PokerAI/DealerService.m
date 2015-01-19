//
//  DealerService.m
//  PokerAI
//
//  Created by Kristian Lien on 1/19/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "DealerService.h"

@implementation DealerService

+ (void)decideAction:(Player *)player forHand:(Hand *)hand
{
    if ([player isKindOfClass:[HumanPlayer class]])
    {
        // Wait for human input
    }
    else
    {
        [player decideActionForHand:hand];
    }
}

+ (int)getNextPlayerIndex:(int)currentPosition withPlayerCount:(int)playerCount
{
    int nextPosition = currentPosition + 1;
    
    if (nextPosition > playerCount - 1)
    {
        return 0;
    }
    else
    {
        return nextPosition;
    }
}

+ (int)getPreviousPlayerIndex:(int)currentPosition withPlayerCount:(int)playerCount
{
    int previousPosition = currentPosition - 1;
    
    if (previousPosition < 0)
    {
        return playerCount - 1;
    }
    else
    {
        return previousPosition;
    }
}

@end
