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
short *state[9];

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startGame];
}

// MARK: - Actions

- (IBAction)fieldTapped:(UIButton *)sender {
    if ([sender titleForState:UIControlStateNormal] != nil) {
        return;
    }
    NSInteger tag = [sender tag];
    state[tag] = &player;
    if (player == 1) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        player = 2;
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        player = 1;
    }
    [self evaluate];
}

- (IBAction)playAgainButtonTapped:(UIButton *)sender {
    for (int i = 0; i < 9; i++) {
        [_fieldButtons[i] setTitle:NULL forState:UIControlStateNormal];
        state[i] = NULL;
    }
    [self startGame];
}

// MARK: - Functions

-(void)startGame {
    [[self playAgainButton] setHidden:true];
}

-(void)evaluate {
    if ([self checkIfFinished]) { // finished
        [[self playAgainButton] setHidden:false];
        return;
    }
}

-(BOOL)checkIfFinished {
    for (int i = 0; i < 9; i++) {
        if (state[i] == NULL) {
            return false;
        }
    }
    return true;
}

@end
