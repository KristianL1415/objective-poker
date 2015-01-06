//
//  ViewController.m
//  PokerAI
//
//  Created by Kristian Lien on 1/5/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "ViewController.h"

#import "Game.h"
#import "Dealer.h"
#import "StringConstants.h"

@interface ViewController ()

@property (nonatomic, strong) Dealer *dealer;

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
@property (nonatomic, strong) IBOutlet UILabel *playerFirstCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *playerFirstCardValue;
@property (nonatomic, strong) IBOutlet UILabel *playerSecondCardSuit;
@property (nonatomic, strong) IBOutlet UILabel *playerSecondCardValue;
@property (nonatomic, strong) IBOutlet UIButton *foldButton;
@property (nonatomic, strong) IBOutlet UIButton *checkButton;
@property (nonatomic, strong) IBOutlet UIButton *betButton;

@end

#pragma mark - Override Methods

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startNewGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods

- (void)startNewGame
{
    self.dealer = [[Dealer alloc] init];
    [self.dealerActions setText:kWelcomePrompt];
    
    [self performSelector:@selector(numberOfPlayersPrompt) withObject:nil afterDelay:3.0];
}

- (void)numberOfPlayersPrompt
{
    [self.dealerActions setText:kNumberOfPlayersPrompt];
}

@end
