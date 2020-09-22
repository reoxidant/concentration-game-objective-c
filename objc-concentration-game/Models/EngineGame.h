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

- (instancetype)initAndCreateByOptions: (NSUInteger) countElements initCountOfMatches:(NSUInteger) countOfMatches;
- (void) handleChosenCardAtIndex:(NSUInteger)index;
- (Card*) cardAtIndex: (NSUInteger)index;
- (BOOL) isOver
@end

NS_ASSUME_NONNULL_END
