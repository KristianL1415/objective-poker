//
//  CardDeck.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDeck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;

- (void)shuffle;

@end
