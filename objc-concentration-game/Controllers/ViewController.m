//
//  ViewController.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "ViewController.h"
#import "EngineGame.h"
#import "Card.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsCollection;
@property (strong, nonatomic) EngineGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switcherMatchesOfCards;

@end

@implementation ViewController

- (EngineGame*)game{
    if(!_game) _game = [[EngineGame alloc] initAndCreateByOptions: [self.cardsCollection count] initCountOfMatches:2];
    return _game;
}
- (IBAction)dealPressed:(UIButton *)sender {
    self.game = nil;
}

- (IBAction)actionButton:(UIButton *)sender {
    self.switcherMatchesOfCards.enabled = NO;
    NSUInteger indexOfCard = [self.cardsCollection indexOfObject:sender];
    [self.game handleChosenCardAtIndex:indexOfCard];
}

- (void) flipBackCard: sender{
    [sender setBackgroundColor:UIColor.systemOrangeColor];
    [sender setTitle:@"" forState:UIControlStateNormal];
}

- (void) flipFrontCard: sender inCard: (Card*) card{
    [sender setBackgroundColor:UIColor.whiteColor];
    [sender setTitle:card.cardName forState:UIControlStateNormal];
}

@end
