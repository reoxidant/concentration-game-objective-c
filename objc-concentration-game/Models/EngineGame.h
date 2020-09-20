//
//  EngineGame.h
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface EngineGame : NSObject

- (void) initRandomCardsForGame: countOfCards;
@property (strong, nonatomic) NSMutableArray *playingRandomCards;

@end

NS_ASSUME_NONNULL_END
