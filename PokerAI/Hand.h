//
//  Hand.h
//  PokerAI
//
//  Created by Kristian Lien on 1/16/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hand : NSObject

@property (nonatomic, assign) int phase;
@property (nonatomic, assign) int potSize;
@property (nonatomic, assign) int currentBet;
@property (nonatomic, assign) int playersInHand;
@property (nonatomic, strong) NSMutableArray *board;

- (instancetype) initWithNumberOfPlayers:(int)playerCount;

@end
