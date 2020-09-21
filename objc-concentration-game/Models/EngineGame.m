//
//  EngineGame.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "EngineGame.h"

@interface EngineGame()
@property (strong, nonatomic) Deck *deck;

@end

@implementation EngineGame

- (Deck*)deck{
    if(!_deck){
        _deck = [[Deck alloc] init];
    }
    return _deck;
}

- (NSMutableArray*) playingRandomCards{
    if(!_playingRandomCards) _playingRandomCards = [[NSMutableArray alloc] init];
    return _playingRandomCards;
}

- (void) initRandomCardsForGame: collectionCards{
    if([collectionCards count] != 0){
        for (int i = 0; i <= (int)[collectionCards count]; i++) {
            [self setCardForDeck:[self.deck randomCard]];
        }
    }else{
        NSLog(@"Error collectionCars is nil!");
    }
}

- (void) setCardForDeck: card{
    if(!card) card = [[Card alloc] init];
    [self.playingRandomCards addObject:card];
}

@end
