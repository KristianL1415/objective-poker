//
//  Dealer.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "CardDeck.h"

@interface Dealer : NSObject

@property(nonatomic, strong) Game *game;
@property(nonatomic, strong) CardDeck *deck;
@property(nonatomic, assign) int button;

@end
