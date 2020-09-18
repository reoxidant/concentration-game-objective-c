//
//  ViewController.m
//  objc-concentration-game
//
//  Created by Виталий Шаповалов on 18.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)actionButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundColor:UIColor.orangeColor];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundColor:UIColor.whiteColor];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
}

@end
