//
//  ViewController.h
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Card.h"
#import "Player.h"


@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *computer1ChipCount;
@property (nonatomic, strong) IBOutlet UILabel *computer2ChipCount;
@property (nonatomic, strong) IBOutlet UILabel *computer3ChipCount;
@property (nonatomic, strong) IBOutlet UILabel *computer4ChipCount;
@property (nonatomic, strong) IBOutlet UILabel *computer5ChipCount;
@property (nonatomic, strong) IBOutlet UILabel *computer1Action;
@property (nonatomic, strong) IBOutlet UILabel *computer2Action;
@property (nonatomic, strong) IBOutlet UILabel *computer3Action;
@property (nonatomic, strong) IBOutlet UILabel *computer4Action;
@property (nonatomic, strong) IBOutlet UILabel *computer5Action;

@property (nonatomic, strong) IBOutlet UILabel *dealerActions;
@property (nonatomic, strong) IBOutlet UILabel *potAmount;
@property (nonatomic, strong) IBOutlet UILabel *betAmount;
@property (nonatomic, strong) IBOutlet UILabel *toCallAmount;

@property (nonatomic, strong) IBOutlet UILabel *firstCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *firstCardValue;
@property (nonatomic, strong) IBOutlet UILabel *secondCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *secondCardValue;
@property (nonatomic, strong) IBOutlet UILabel *thirdCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *thirdCardValue;
@property (nonatomic, strong) IBOutlet UILabel *turnCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *turnCardValue;
@property (nonatomic, strong) IBOutlet UILabel *riverCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *riverCardValue;

@property (nonatomic, strong) IBOutlet UITextField *playerInput;
@property (nonatomic ,strong) IBOutlet UILabel *playerChipCount;
@property (nonatomic, strong) IBOutlet UIView *playerFirstCard;
@property (nonatomic, strong) IBOutlet UIView *playerSecondCard;
@property (nonatomic, strong) IBOutlet UILabel *playerFirstCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *playerFirstCardValue;
@property (nonatomic, strong) IBOutlet UILabel *playerSecondCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *playerSecondCardValue;
@property (nonatomic, strong) IBOutlet UIButton *foldButton;
@property (nonatomic, strong) IBOutlet UIButton *checkButton;
@property (nonatomic, strong) IBOutlet UIButton *betButton;

- (void)displayCard:(Card *)card forPlayer:(Player *)player atPosition:(int)cardIndex;
- (void)displayBoardCard:(Card *)card atPosition:(int)cardIndex;
- (void)updateChipCounts;

@end

