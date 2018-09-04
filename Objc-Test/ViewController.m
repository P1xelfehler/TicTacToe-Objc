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
short state[9];

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
    state[tag] = player;
    if (player == 1) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
    }
    [self evaluate];
    player = player == 1 ? 2 : 1;
}

- (IBAction)playAgainButtonTapped:(UIButton *)sender {
    for (int i = 0; i < 9; i++) {
        [_fieldButtons[i] setTitle:NULL forState:UIControlStateNormal];
        state[i] = 0;
    }
    [self startGame];
}

// MARK: - Functions

-(void)startGame {
    [[self playAgainButton] setHidden:true];
}

-(void)evaluate {
    short winner = [self getWinner];
    if (winner != 0) { // someone has won
        [[self playAgainButton] setHidden:false];
        [self showWinnerAlert:winner];
        return;
    }
    if ([self isFieldFull]) { // field is full
        [[self playAgainButton] setHidden:false];
        [self showDrawAlert];
        return;
    }
}

-(BOOL)isFieldFull {
    for (int i = 0; i < 9; i++) {
        if (state[i] == 0) {
            return false;
        }
    }
    return true;
}

-(short)getWinner {
    short first, second, third;
    for(int i = 0; i < 3; i++) {
        // horizontal rows
        first = state[i + i * 2];
        second = state[i + i * 2 + 1];
        third =  state[i + i * 2 + 2];
        if (first != 0 && first == second && second == third) {
            return first;
        }
        // vertical rows
        first = state[i];
        second = state[i + 3];
        third =  state[i + 6];
        if (first != 0 && first == second && second == third) {
            return first;
        }
        // diagonal rows
        if (i == 2) {
            continue;
        }
        first = state[i * 2];
        second = state[4];
        third = state[8 - 2 * i];
        if (first != 0 && first == second && second == third) {
            return first;
        }
    }
    return 0;
}

-(void)showWinnerAlert:(short)winner {
    NSString *winnerLabel = winner == 1 ? @"X" : @"O";
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Gewonnen"
                                          message:[NSString stringWithFormat:@"%@ hat gewonnen!", winnerLabel]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:NULL];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:true completion:NULL];
}

-(void)showDrawAlert {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Unentschieden"
                                          message:@"Das Spiel endet unentschieden."
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:NULL];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:true completion:NULL];
}

@end
