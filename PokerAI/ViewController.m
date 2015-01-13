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

@property (nonatomic, strong) NSArray *chipLabels;
@property (nonatomic ,strong) NSArray *a;

@end

#pragma mark - Override Methods

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.chipLabels = [[NSArray alloc] initWithObjects:self.computer1ChipCount,
                           self.computer2ChipCount,
                           self.computer3ChipCount,
                           self.computer4ChipCount,
                           self.computer5ChipCount, nil];
    
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
    [self setupInterface];
    [self beginGameLoop];
}

- (void)setupInterface
{
    [self updateChipCounts];
}

- (void)beginGameLoop
{
//    while ([self.dealer.game playersRemaining] > 1)
//    {
    
//    }
    
    [self.dealerActions setText:kDealingHand];
    [self.dealer dealHand];
    [self.dealer setBlinds];
    [self.dealer beginAction];
}

- (void)updateChipCounts
{
    HumanPlayer *human;
    Game *game = [self.dealer game];
    
    if ([[game.players objectAtIndex:0] isKindOfClass:[HumanPlayer class]])
    {
        human = [game.players objectAtIndex:0];
    }
    
    [self.playerChipCount setText:[NSString stringWithFormat:@"%d", human.chipCount]];
    [self.playerChipCount setHidden:NO];
    
    for (int i = 1; i < [game.players count]; i++)
    {
        UILabel *chipLabel = [self.chipLabels objectAtIndex:i - 1];
        [chipLabel setText:[NSString stringWithFormat:@"%d", [[game.players objectAtIndex:i] chipCount]]];
        [chipLabel setHidden:NO];
    }
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
