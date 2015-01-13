//
//  Game.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, assign) int initialPlayerCount;
@property (nonatomic, assign) int playersRemaining;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, assign) int smallBlind;
@property (nonatomic, assign) int bigBlind;

- (instancetype) initWithNumberOfPlayers:(int)playerCount;

@end
