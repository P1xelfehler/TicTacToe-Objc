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
    state[tag] = [NSNumber numberWithInteger:player];
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
    for (UIButton *button in _fieldButtons) {
        [button setTitle:nil forState:UIControlStateNormal];
    }
    [self startGame];
}

// MARK: - Functions

-(void)startGame {
    state = [[NSMutableArray alloc] initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    [[self playAgainButton] setHidden:true];
}

-(void)evaluate {
    if ([self checkIfFinished]) { // finished
        [[self playAgainButton] setHidden:false];
        return;
    }
}

-(BOOL)checkIfFinished {
    NSLog(@"%@\n", state);
    for (NSNumber *item in state) {
        if ([item isEqualToNumber:[NSNumber numberWithInteger:0]]) {
            return false;
        }
    }
    return true;
}

@end
