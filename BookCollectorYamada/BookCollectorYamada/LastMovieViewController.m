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
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    data = [NSUserDefaults standardUserDefaults];
    
    MovieCount = 0;
    if([data objectForKey:@"MovieCount"]){
        MovieCount = [[data objectForKey:@"MovieCount"] intValue];
    }
    
    movieImage.hidden = YES;
    
    tapCount = 0;
    clearCount = 0;
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
}

-(IBAction)S1{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_1.png",@"last_9.png",@"last_10.png",@"last3_1.png",@"last3_2.png",@"last3_3.png",@"last3_4.png",@"complete.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)S2{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_2.png",@"last_9.png",@"last_10.png",@"last4_1.png",@"last4_2.png",@"last4_3.png",@"last4_4.png",@"last5_1.png",@"last5_2.png",@"last5_3.png",@"complete.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)S3{
    movieImage.hidden = NO;
    gazou.hidden = YES;
    select1.hidden = YES;
    select2.hidden = YES;
    select3.hidden = YES;
    Array = @[@"last_8_3.png",@"last_9.png",@"last_10.png",@"last6_1.png",@"last6_2.png",@"last6_3.png",@"last6_4.png",@"complete.png"];
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)tap{
    
    tapCount = tapCount + 1;
    
    if(tapCount == Array.count){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        clearCount = 10;
        [data setInteger:MovieCount forKey:@"clearCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"back" sender:nil];
    }else{
        UIImage *img = [UIImage imageNamed:Array[tapCount]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }
}





@end

