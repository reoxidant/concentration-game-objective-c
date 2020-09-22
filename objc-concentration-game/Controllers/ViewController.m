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
    [self updateUI];
}

- (void) updateUI{
    for (UIButton *buttonOfCard in self.cardsCollection) {
        NSUInteger indexOfButton = [self.cardsCollection indexOfObject:buttonOfCard];
        Card* card = [self.game cardAtIndex:indexOfButton];
        if(![self.game isOver]){
            [buttonOfCard setTitle:(card.isChosen)? card.cardName:@"" forState:UIControlStateNormal];
            [buttonOfCard setBackgroundColor: (card.isChosen)? UIColor.whiteColor : UIColor.systemOrangeColor];
            buttonOfCard.enabled = !card.isMatched;
        }else{
            [buttonOfCard setTitle:card.cardName forState:UIControlStateNormal];
            [buttonOfCard setBackgroundColor: UIColor.whiteColor];
            buttonOfCard.enabled = YES;
        }
    }
}

@end
