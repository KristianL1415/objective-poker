//
//  Player.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Player : NSObject

@property (nonatomic, assign) int chipCount;
@property (nonatomic, assign) int betAmount;
@property (nonatomic, strong) Card *firstCard;
@property (nonatomic, strong) Card *secondCard;
@property (nonatomic, assign) int seatIndex;

- (instancetype) initWithChipCount:(int)startingChipCount seatIndex:(int)seat;

- (void)check;
- (void)call;
- (void)bet:(int)amount;
- (void)fold;

@end
