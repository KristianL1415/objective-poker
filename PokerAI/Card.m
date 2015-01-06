//
//  Card.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        self.suit = @"Joker";
        self.value = @"Joker";
    }
    
    return self;
}

- (instancetype) initWithSuit:(NSString *)suit value:(NSString *)value
{
    self = [super init];
    
    if (self)
    {
        self.suit = suit;
        self.value = value;
    }
    
    return self;
}

@end
