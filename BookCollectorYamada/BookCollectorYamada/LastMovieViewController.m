//
//  LastMovieViewController.m
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2018/02/12.
//  Copyright © 2018年 MobileApp. All rights reserved.
//

#import "LastMovieViewController.h"

@interface LastMovieViewController ()

@end

@implementation LastMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    movieImage.hidden = YES;
    
    tapCount = 0;
    clearCount = 0;
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    if([data objectForKey:@"ムービー選択"]){
        select = [data objectForKey:@"ムービー選択"];
    }
}

-(IBAction)tap{
    
    tapCount = tapCount + 1;
    
    if(tapCount == Array.count){
        [self performSegueWithIdentifier:@"back" sender:nil];
    }else{
        UIImage *img = [UIImage imageNamed:Array[tapCount]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }
}

-(IBAction)S1{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_1.png",@"last_9.png",@"last_10.png",@"last_3_1.png",@"last_3_2.png",@"last_3_3.png",@"last_3_4.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)S2{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_2.png",@"last_9.png",@"last_10.png",@"last_4_1.png",@"last_4_2.png",@"last_4_3.png",@"last_4_4.png",@"last_5_1.png",@"last_5_2.png",@"last_5_3.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)S3{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_3.png",@"last_9.png",@"last_10.png",@"last_6_1.png",@"last_6_2.png",@"last_6_3.png",@"last_6_4.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}





@end

