//
//  ViewController.m
//  Objc-Test
//
//  Created by Norman Laudien on 03.09.18.
//  Copyright © 2018 Norman Laudien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

short player = 1;
NSMutableArray *state;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startGame];
}

- (IBAction)fieldTapped:(UIButton *)sender {
    if ([sender titleForState:UIControlStateNormal] != nil) {
        return;
    }
    NSInteger tag = [sender tag];
    state[tag] = [NSNumber numberWithInteger:player];
    if (player == 1) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        player = 2;
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        player = 1;
    }
    NSLog(@"%@", state);
}

-(void)startGame {
    state = [[NSMutableArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
}

@end
