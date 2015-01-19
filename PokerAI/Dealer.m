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
#import "HumanPlayer.h"
#import "ComputerPlayer.h"

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
    int playerIndex = [DealerService getNextPlayerIndex:self.button withPlayerCount:self.game.currentHand.playersInHand];
    
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
        
        playerIndex = [DealerService getNextPlayerIndex:playerIndex withPlayerCount:self.game.currentHand.playersInHand];
        // TODO: Pass index of next card to be dealt for the board
    }
}

- (void)setBlinds
{
    Player *smallBlind = [self.game.players objectAtIndex:[DealerService getNextPlayerIndex:self.button withPlayerCount:self.game.currentHand.playersInHand]];
    Player *bigBlind = [self.game.players objectAtIndex:[DealerService getNextPlayerIndex:(self.button + 1) withPlayerCount:self.game.currentHand.playersInHand]];
    
    [smallBlind bet:[self.game smallBlind]];
    [bigBlind bet:[self.game bigBlind]];
    
    [self.uiController updateChipCounts];
}

- (void)beginAction
{
    // Pre-flop action
    [self runPreFlop];
    
    // Flop
    
    // Turn
    
    // River
    
}

- (void)runPreFlop
{
    Hand *newHand = [[Hand alloc] initWithNumberOfPlayers:self.game.playersRemaining];
    [self.game setCurrentHand:newHand];
    [self.game.currentHand setCurrentBet:self.game.bigBlind];
    
    int actorIndex = [DealerService getNextPlayerIndex:(self.button + 2) withPlayerCount:self.game.currentHand.playersInHand];
    Player *firstActor = [self.game.players objectAtIndex:actorIndex];
    [DealerService decideAction:firstActor forHand:self.game.currentHand];
    
    for (int i = 0; i < self.game.currentHand.playersInHand; i++)
    {
        actorIndex = [DealerService getNextPlayerIndex:actorIndex withPlayerCount:self.game.currentHand.playersInHand];
        Player *nextActor = [self.game.players objectAtIndex:actorIndex];
        [DealerService decideAction:nextActor forHand:self.game.currentHand];
        [self.uiController updateChipCounts];
        [self.uiController updateComputerActions];
    }
    
    if (self.game.currentHand.playersInHand > 1)
    {
        [self runFlop];
    }
    else
    {
        // TODO: Clean-up hand (award winner, etc.)
    }
}

- (void)runFlop
{
    
}

- (void)runTurn
{
    
}

- (void)runRiver
{
    
}

@end
