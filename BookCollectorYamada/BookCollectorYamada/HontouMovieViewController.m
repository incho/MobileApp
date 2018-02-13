//
//  HontouMovieViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "HontouMovieViewController.h"

@interface HontouMovieViewController ()

@end

@implementation HontouMovieViewController

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
    
    
    clearCount = 0;
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    
    
    if(MovieCount == 0){
        start.hidden = YES;
        count = 0;
        movieArray = @[@"hon1_1.png",@"hon1_2.png",@"hon1_3.png",@"hon1_4.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }else if(MovieCount == 1){
        count2 = 0;
        movieArray2 = @[@"hon2_1.png",@"hon2_2.png",@"hon2_3.png",@"hon2_4.png",@"hon2_5.png",@"hon3_1.png"];
        
        UIImage *img = [UIImage imageNamed:@"本島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else if(MovieCount == 7){
        start.hidden = YES;
        count = 0;
        movieArray = @[@"last_1.png",@"last_2.png",@"last_3.png",@"last_4.png",@"last_5.png",@"last_6.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }else{
        UIImage *img = [UIImage imageNamed:@"本島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"本島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }
    
}


-(IBAction)tap{
    
    if(MovieCount == 0){
        count = count + 1;
    
        if(count == movieArray.count){
            MovieCount = MovieCount + 1;
            [data setInteger:MovieCount forKey:@"MovieCount"];
            [data synchronize];
            [audio stop];
            [self performSegueWithIdentifier:@"next" sender:nil];
        }else{
            UIImage *img = [UIImage imageNamed:movieArray[count]];
            [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        }
    }else if(MovieCount == 7){
        count = count + 1;
        if(count == movieArray.count){
            
            clearCount = 6;
            [data setInteger:clearCount forKey:@"clearCount"];
            [data synchronize];
            
            MovieCount = MovieCount + 1;
            [data setInteger:MovieCount forKey:@"MovieCount"];
            [data synchronize];
            [audio stop];
            [self performSegueWithIdentifier:@"endSelect" sender:nil];
        }else{
            UIImage *img = [UIImage imageNamed:movieArray[count]];
            [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        }
    }else{
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
    
}

-(IBAction)tap2{
    if(MovieCount == 1){
        count2 = count2 + 1;
    
        if(count2 == movieArray2.count){
            MovieCount = MovieCount + 1;
            [data setInteger:MovieCount forKey:@"MovieCount"];
            [data synchronize];
            [audio stop];
            [self performSegueWithIdentifier:@"back" sender:nil];
        }else{
            UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
            [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        }
    }else{
        [audio stop];
        [self performSegueWithIdentifier:@"back" sender:nil];
    }
}

-(IBAction)skip{
    if(MovieCount == 0){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 1){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 7){
        clearCount = 6;
        [data setInteger:clearCount forKey:@"clearCount"];
        [data synchronize];
        
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else{
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
