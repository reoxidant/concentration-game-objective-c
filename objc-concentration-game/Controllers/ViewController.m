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

@end

@implementation ViewController

- (EngineGame*)game{
    if(!_game) _game = [[EngineGame alloc] init];
    return _game;
}

- (IBAction)actionButton:(UIButton *)sender {
    NSUInteger index = [_cardsCollection indexOfObject:sender];
    
    [self.game initRandomCardsForGame:self.cardsCollection];
    
    if([sender.currentTitle length]){
        [self flipBackCard:sender];
    }else{
        [self flipFrontCard:sender byIndex:(int)index];
    }
}

- (void) flipBackCard: sender{
    [sender setBackgroundColor:UIColor.systemOrangeColor];
    [sender setTitle:@"" forState:UIControlStateNormal];
}

- (void) flipFrontCard: sender byIndex: (int) index{
    [sender setBackgroundColor:UIColor.whiteColor];

    Card* card = [[self.game playingRandomCards] objectAtIndex:index];
    
    [sender setTitle:card.cardName forState:UIControlStateNormal];
}

@end
