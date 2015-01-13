//
//  Dealer.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Dealer.h"

#import "CardDeck.h"
#import "Player.h"

@interface Dealer ()

@property (nonatomic, strong) ViewController *uiController;
@property (nonatomic, strong) CardDeck *deck;
@property (nonatomic, assign) int button;

@end

@implementation Dealer

#pragma mark - Initialization

- (instancetype) initWithPlayerCount:(int)playerCount controller:(ViewController *)controller
{
    self = [super init];
    
    if (self)
    {
        self.uiController = controller;
        self.game = [self createNewGame:playerCount];
        self.deck = [[CardDeck alloc] init];
        self.button = 0; // TODO: Once card flip is implemented, change this to be dynamic
    }
    
    return self;
}

- (Game *)createNewGame:(int)playerCount
{
    Game *newGame = [[Game alloc] initWithNumberOfPlayers:playerCount];
    
    return newGame;
}

#pragma mark - Game Logic

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
        Player *currentPlayer = [self.game.players objectAtIndex:playerIndex];
        Card *currentCard = [self.deck.cards objectAtIndex:i];
        
        // deal first card
        if (i < [self.game.players count])
        {
            [currentPlayer setFirstCard:currentCard];
            [self.uiController displayCard:currentCard forPlayer:currentPlayer atPosition:0];
        }
        // deal second card
        else
        {
            [currentPlayer setSecondCard:currentCard];
            [self.uiController displayCard:currentCard forPlayer:currentPlayer atPosition:1];
        }
        
        playerIndex = [self getNextPlayerIndex:playerIndex];
        // TODO: Pass index of next card to be dealt for the board
    }
}

- (void)setBlinds
{
    Player *smallBlind = [self.game.players objectAtIndex:[self getNextPlayerIndex:self.button]];
    Player *bigBlind = [self.game.players objectAtIndex:[self getNextPlayerIndex:self.button + 1]];
    
    [smallBlind bet:[self.game smallBlind]];
    [bigBlind bet:[self.game bigBlind]];
    
    [self.uiController updateChipCounts];
}

- (void)beginAction
{
    // Pre-flop action
    //Player *firstActor = [self.game.players objectAtIndex:[self getNextPlayerIndex:self.button + 2]];
    
    // Flop
    
    // Turn
    
    // River
    
}

#pragma mark - Helpers

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
