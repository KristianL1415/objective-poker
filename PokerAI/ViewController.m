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
#import "HumanPlayer.h"
#import "ComputerPlayer.h"
#import "StringConstants.h"

typedef NS_ENUM(NSInteger, PlayerState)
{
    getPlayerCount,
    onPlayer,
    onOpponent
};

@interface ViewController ()

@property (nonatomic, strong) Dealer *dealer;
@property (nonatomic, assign) PlayerState state;

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
@property (nonatomic, strong) IBOutlet UIView *playerFirstCard;
@property (nonatomic, strong) IBOutlet UIView *playerSecondCard;
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
    [self.dealerActions setText:kWelcomePrompt];
    
    [self performSelector:@selector(numberOfPlayersPrompt) withObject:nil afterDelay:3.0];
}

- (void)numberOfPlayersPrompt
{
    [self.dealerActions setText:kNumberOfPlayersPrompt];
    [self.playerInput becomeFirstResponder];
}

- (void)processInput:(int)input
{
    switch (self.state)
    {
        case getPlayerCount:
            if (input > 6)
            {
                [self.dealerActions setText:kTooManyPlayers];
            }
            else if (input < 2)
            {
                [self.dealerActions setText:kNotEnoughPlayers];
            }
            else
            {
                self.dealer = [[Dealer alloc] initWithPlayerCount:input controller:self];
                [self beginGame];
            }
            break;
            
        case onPlayer:
            // TODO: allow player to make an action
            break;
            
        case onOpponent:
            
            break;
            
        default:
            break;
    }
}

- (void)beginGame
{
//    while ([self.dealer.game playersRemaining] > 1)
//    {
        [self.dealer dealHand];
//    }
}

- (void)displayCard:(Card *)card forPlayer:(Player *)player atPosition:(int)cardIndex
{
    if ([player isKindOfClass:[HumanPlayer class]])
    {
        // display card
        if (cardIndex == 0)
        {
            [self.playerFirstCardSuit setText:card.suit];
            [self.playerFirstCardValue setText:card.value];
            [self.playerFirstCard setHidden:NO];
        }
        else if (cardIndex == 1)
        {
            [self.playerSecondCardSuit setText:card.suit];
            [self.playerSecondCardValue setText:card.value];
            [self.playerSecondCard setHidden:NO];
        }
    }
}

- (void)displayBoardCard:(Card *)card atPosition:(int)cardIndex
{
    
}

#pragma mark - Interface Methods

- (IBAction)enterPressed:(id)sender
{
    if ([self.playerInput.text isEqualToString:@""])
    {
        [self.dealerActions setText:kInvalidInput];
        return;
    }
    else
    {
        int userInput = [self.playerInput.text intValue];
        [self processInput:userInput];
        
        [self.playerInput resignFirstResponder];
    }
}

- (IBAction)foldPressed:(id)sender
{
    
}

- (IBAction)checkCallPressed:(id)sender
{
    
}

- (IBAction)betRaisePressed:(id)sender
{
    
}

@end
