//
//  Deck.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSArray *dataRank;
@property (strong, nonatomic) NSArray *dataSuit;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray*) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in self.dataSuit) {
            for(NSString *rank in self.dataRank){
                Card *card = [[Card alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self.cards addObject:card];
            }
        }
    }
    return self;
}


- (NSArray*) dataRank{
    return @[@"1️⃣", @"2️⃣", @"3️⃣", @"4️⃣", @"5️⃣", @"6️⃣", @"7️⃣", @"8️⃣", @"9️⃣", @"🔟", @"🤴", @"👸",  @"👑"];
}

- (NSArray*) dataSuit{
    return @[@"♦️", @"♥️", @"♣️", @"♠️"];
}


- (Card*) randomCard{
    Card *randomCard = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

- (void) setIsChosen:(BOOL)isChosen :(NSUInteger) index{
    Card *card = self.cards[index];
    card.isChosen = isChosen;
}

- (void) setStateForCardByIndex: (NSUInteger) index{
    Card *card = [self.cards objectAtIndex:index];
    card.isChosen = YES;
}

- (int) matchToEachOther:(NSMutableArray*) faceUpCards{
    
    int score = 0;
    
    for(int i = 0; i < [faceUpCards count]; i++){
        
        Card* card1 = [faceUpCards objectAtIndex:(NSUInteger)i];
        
        for(int k = i+1; k < [faceUpCards count]; k++){
            Card* card2 = [faceUpCards objectAtIndex:(NSUInteger)k];
            
            if(card1.suit == card2.suit){
                score = 1;
            }
            
            if(card1.rank == card2.rank){
                score = 4;
            }
        }
    }
    
    return score;
}


@end
