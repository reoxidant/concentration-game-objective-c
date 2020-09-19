//
//  Card.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize suit = _suit;

- (NSString*) cardName{
    return [NSString stringWithFormat:@"%@%@", self.rank, self.suit];
}

- (void) setSuit:(NSString *)suit{
    if([@[@"♣️", @"♦️", @"♥️", @"♠️"] containsObject:suit]){
        _suit = suit;
    }else{
        _suit = @"⁉️";
    }
}

- (void) setRank:(NSString *)rank{
    if([@[@"1️⃣", @"2️⃣", @"3️⃣", @"4️⃣", @"5️⃣", @"6️⃣", @"7️⃣", @"8️⃣", @"9️⃣", @"🔟", @"🤴", @"👸",  @"👑"] containsObject:rank]){
        _rank = rank;
    }else{
        _rank = @"⁉️";
    }
}

@end
