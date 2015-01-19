//
//  Dealer.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewController.h"
#import "Game.h"
#import "DealerService.h"

@interface Dealer : NSObject

@property (nonatomic, strong) Game *game;

- (instancetype) initWithPlayerCount:(int)playerCount controller:(ViewController *)controller;
- (void)dealHand;
- (void)setBlinds;
- (void)beginAction;

@end
