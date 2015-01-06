//
//  Card.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSString *value;

- (instancetype) initWithSuit:(NSString *)suit value:(NSString *)value;

@end
