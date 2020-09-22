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
@property (strong, nonatomic) NSMutableArray* faceUpCards;
@property (nonatomic) NSUInteger countOfMatches;
@end

@implementation EngineGame

- (NSMutableArray*) faceUpCards{
    if(!_faceUpCards) _faceUpCards = [[NSMutableArray alloc] init];
    return _faceUpCards;
}

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

- (instancetype)initAndCreateByOptions: (NSUInteger) countElements initCountOfMatches:(NSUInteger) countOfMatches
{
    self = [super init];
    if (self) {
        for (int i = 0; i < countElements; i++) {
            [self.playingCards addObject:[self.deck randomCard]];
        }
        self.countOfMatches = countOfMatches;
    }
    return self;
}

- (void) handleChosenCardAtIndex:(NSUInteger)index{
    Card *card = [self.playingCards objectAtIndex:index];
    if(!card.isMatched && !card.isChosen){
        self.faceUpCards = [[NSMutableArray alloc] initWithArray:@[card]];
        [self findAndAddOtherChosenCardsInArray];
        [self checkScoreIfFaceUpCardsEqualMathes];
        card.isChosen = YES;
    }else{
        card.isChosen = NO;
    }
}

- (void) findAndAddOtherChosenCardsInArray{
    for (Card *otherCard in self.playingCards) {
        if(otherCard.isChosen && !otherCard.isMatched){
            [self.faceUpCards insertObject:otherCard atIndex:0];
        }
    }
}

- (void) checkScoreIfFaceUpCardsEqualMathes{
    if([self.faceUpCards count] == self.countOfMatches){
        if([self.deck matchToEachOther: self.faceUpCards]){
            for (Card* faceUpCard in self.faceUpCards) {
                faceUpCard.isMatched = YES;
            }
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.playingCards count]) ? self.playingCards[index] : nil;
}

- (BOOL) isOver{
    return ([self.deck matchToEachOther:self.faceUpCards] && [self.faceUpCards count] <= 3)? YES : NO;
}

@end
