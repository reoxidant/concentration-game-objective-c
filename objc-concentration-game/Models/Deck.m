//
//  Deck.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSArray *dataRank;
@property (strong, nonatomic) NSArray *dataSuit;
@end

@implementation Deck

- (NSArray*) dataRank{
    return @[@"⁉️", @"1️⃣", @"2️⃣", @"3️⃣", @"4️⃣", @"5️⃣", @"6️⃣", @"7️⃣", @"8️⃣", @"9️⃣", @"🔟", @"🤴", @"👸",  @"👑"];
}

- (NSArray*) dataSuit{
    return @[@"⁉️", @"♦️", @"♥️", @"♣️", @"♠️"];
}

- (void) initDeck{
    for (NSString *suit in self.dataSuit) {
        for(NSString *rank in self.dataRank){
            Card *card = [[Card alloc] init];
            card.suit = suit;
            card.rank = rank;
            [self.cards addObject:card];
        }
    }
}

- (Card*) randomCard: cards{
    Card *randomCard = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
