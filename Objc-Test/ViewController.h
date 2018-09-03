//
//  ViewController.h
//  Objc-Test
//
//  Created by Norman Laudien on 03.09.18.
//  Copyright © 2018 Norman Laudien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *fieldButtons;

@end

