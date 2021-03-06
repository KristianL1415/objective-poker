//
//  HandStrengthCalculator.h
//  PokerAI
//
//  Created by Kristian Lien on 1/16/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"
#import "Hand.h"
#import "StringConstants.h"

@interface HandStrengthCalculator : NSObject

+ (double)getHandStrengthForHand:(Hand *)hand firstCard:(Card *)firstCard secondCard:(Card *)secondCard;

@end
