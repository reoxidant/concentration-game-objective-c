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
@property (strong, nonatomic) NSMutableArray* playingCards;
@end

@implementation EngineGame


- (NSMutableArray*) playingCards{
    if(!_playingCards) _playingCards = [[NSMutableArray alloc] init];
    return _playingCards;
}

- (Deck*)deck{
    if(!_deck){
        _deck = [[Deck alloc] init];
    }
    return _deck;
}

- (instancetype)initAndCreateDeckByCountElements: (NSUInteger) count
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            [self.playingCards addObject:[self.deck randomCard]];
        }
    }
    return self;
}

- (void) setUpCardsAsChosenAtIndex:(NSUInteger)index{
    Card *card = [self.playingCards objectAtIndex:index];
    NSLog(@"Hello you card is: %@", card.cardName);
}

@end
