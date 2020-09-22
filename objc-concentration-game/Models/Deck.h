//
//  Deck.h
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : Card

- (Card*) randomCard;
- (int) matchToEachOther: faceUpCards;
@end

NS_ASSUME_NONNULL_END
