//
//  Player.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"
#import "Hand.h"

@interface Player : NSObject

@property (nonatomic, assign) int chipCount;
@property (nonatomic, assign) int betAmount;
@property (nonatomic, strong) Card *firstCard;
@property (nonatomic, strong) Card *secondCard;
@property (nonatomic, assign) int seatIndex;
@property (nonatomic, assign) NSString *lastAction;

- (instancetype) initWithChipCount:(int)startingChipCount seatIndex:(int)seat;

- (void)decideActionForHand:(Hand *)hand;
- (void)check;
- (void)call:(int)amount;
- (void)bet:(int)amount;
- (void)fold;

@end
