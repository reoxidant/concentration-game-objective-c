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
@end

@implementation EngineGame

- (Deck*)deck{
    if(!_deck){
        _deck = [[Deck alloc] init];
    }
    return _deck;
}

//designed initialization
- (instancetype)initEngineOfGame
{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (Card*) randomCard{
    return [self.deck randomCard];
}

@end
