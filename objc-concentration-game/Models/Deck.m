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

@end
