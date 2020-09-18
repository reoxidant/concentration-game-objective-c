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
    }
}

@end
