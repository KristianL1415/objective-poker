//
//  Dealer.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Dealer.h"

#import "Game.h"
#import "CardDeck.h"
#import "Player.h"

@interface Dealer ()

@property(nonatomic, strong) Game *game;
@property(nonatomic, strong) CardDeck *deck;
@property(nonatomic, assign) int button;

@end

@implementation Dealer

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.game = [self setupNewGame];
        self.deck = [[CardDeck alloc] init];
        self.button = 0; // TODO: Once card flip is implemented, change this to be dynamic
    }
    
    return self;
}

- (Game *)setupNewGame
{
    Game *newGame = [[Game alloc] init];
    
    
    
    return newGame;
}

- (void)dealHand
{
    NSLog(@"Dealing new hand.");
    [self.deck shuffle];
    [self dealCards];
}

- (void)dealCards
{
    int playerIndex = [self getNextPlayerIndex:self.button];
    
    for (int i = 0; i < [self.game.players count] * 2; i++)
    {
        // deal first card
        if ( i < [self.game.players count] - 1)
        {
            [[self.game.players objectAtIndex:playerIndex] setFirstCard:[self.deck.cards objectAtIndex:i]];
        }
        // deal second card
        else
        {
            [[self.game.players objectAtIndex:playerIndex] setSecondCard:[self.deck.cards objectAtIndex:i]];
        }
        
        playerIndex = [self getNextPlayerIndex:playerIndex];
        // TODO: Update interface
    }
}

- (int)getNextPlayerIndex:(int)currentPosition
{
    int arrayLength = (int)[self.game.players count];
    int nextPosition = currentPosition + 1;
    
    if (nextPosition > arrayLength - 1)
    {
        return 0;
    }
    else
    {
        return nextPosition;
    }
}

- (int)getPreviousPlayerIndex:(int)currentPosition
{
    int arrayLength = (int)[self.game.players count];
    int previousPosition = currentPosition - 1;
    
    if (previousPosition < 0)
    {
        return arrayLength - 1;
    }
    else
    {
        return previousPosition;
    }
}

@end
