//
//  GameOverViewController.m
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2018/02/12.
//  Copyright © 2018年 MobileApp. All rights reserved.
//

#import "GameOverViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(IBAction)tap{
    [self performSegueWithIdentifier:@"back" sender:nil];
}


@end
