//
//  Card.h
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, readonly) NSString *cardName;
@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *rank;
@property (nonatomic) BOOL isChosen;
@property (nonatomic) BOOL isMathed;

@end

NS_ASSUME_NONNULL_END
