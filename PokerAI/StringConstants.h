//
//  StringConstants.h
//  PokerAI
//
//  Created by Kristian Lien on 1/6/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringConstants : NSObject

extern NSString *const kHeartSuit;
extern NSString *const kDiamondSuit;
extern NSString *const kSpadeSuit;
extern NSString *const kClubSuit;

extern NSString *const kNumberOfPlayersPrompt;
extern NSString *const kWelcomePrompt;
extern NSString *const kInvalidInput;
extern NSString *const kTooManyPlayers;
extern NSString *const kNotEnoughPlayers;
extern NSString *const kDealingHand;
extern NSString *const kSmallBlind;
extern NSString *const kBigBlind;

extern NSString *const kFoldAction;
extern NSString *const kCheckAction;
extern NSString *const kCallAction;
extern NSString *const kBetAction;

@end
