//
//  StringConstants.m
//  PokerAI
//
//  Created by Kristian Lien on 1/6/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "StringConstants.h"

@implementation StringConstants

NSString *const kHeartSuit = @"Heart";
NSString *const kDiamondSuit = @"Diamond";
NSString *const kSpadeSuit = @"Spade";
NSString *const kClubSuit = @"Club";

NSString *const kNumberOfPlayersPrompt = @"How many players will be in this game?";
NSString *const kWelcomePrompt = @"Welcome to the Poker Room!";
NSString *const kInvalidInput = @"Please enter a number.";
NSString *const kTooManyPlayers = @"Sorry, the maximum number of players is 6.";
NSString *const kNotEnoughPlayers = @"Please enter a minimum of 2 players.";
NSString *const kDealingHand = @"Dealing hand...";
NSString *const kSmallBlind = @"Sm. blind";
NSString *const kBigBlind = @"Big blind";

NSString *const kFoldAction = @"Fold";
NSString *const kCheckAction = @"Check";
NSString *const kCallAction = @"Call";
NSString *const kBetAction = @"Bet";

@end
