//
//  ViewController.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelFlips;
@property (assign, nonatomic) int flipsCount;
@end

@implementation ViewController

- (void)setFlipsCount:(int)flipsCount{
    if(!flipsCount){
        _flipsCount = 1;
    }
    _flipsCount = flipsCount;
}

- (IBAction)actionButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundColor:UIColor.orangeColor];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundColor:UIColor.whiteColor];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
    self.flipsCount++;
    [self.labelFlips setText:[NSString stringWithFormat:@"Flips: %d", self.flipsCount]];
}

@end
