//
//  KonpeitouMovieViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//


#import "KonpeitouMovieViewController.h"

@interface KonpeitouMovieViewController ()

@end

@implementation KonpeitouMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    data = [NSUserDefaults standardUserDefaults];
    
    MovieCount = 0;
    if([data objectForKey:@"MovieCount"]){
        MovieCount = [[data objectForKey:@"MovieCount"] intValue];
    }
    
    if(MovieCount <= 7){
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:bundle];
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        [audio play];
    }
    
    
    clearCount = 0;
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    if(MovieCount == 4){
        start.hidden = YES;
        normal.hidden = YES;
        hard.hidden = YES;
        
        count = 0;
        movieArray = @[@"kon_op1.png",@"kon_op2.png",@"kon_op3.png",@"kon_op4.png",@"kon_op5.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }else if(MovieCount == 5){
        normal.hidden = YES;
        hard.hidden = YES;
        
        count2 = 0;
        movieArray2 = @[@"kon_ed1.png",@"kon_ed2.png",@"kon_ed3.png",@"kon_ed4.png",@"kon_ed5.png",@"kon_ed6.png",@"kon_ed7.png",@"kon_ed8.png",@"kon_ed9.png",@"kon_ed10.png",@"kon_ed11.png",@"after1_1.png",@"after1_2.png",@"after1_3.png",@"after1_4.png",@"after1_5.png",@"after1_6.png",@"after1_7.png"];
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else if(MovieCount > 5){
        hard.hidden = YES;
        normal.hidden = YES;
        
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }
    
    if(clearCount  == 4){
        start.hidden = YES;
        hard.hidden = NO;
        normal.hidden = NO;
        movieImage.enabled = NO;
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        
        UIImage *img3 = [UIImage imageNamed:@"hardNew.png"];
        [hard setBackgroundImage:img3 forState:UIControlStateNormal];
        
    }else if(clearCount > 4){
        start.hidden = YES;
        hard.hidden = NO;
        normal.hidden = NO;
        movieImage.enabled = NO;
        
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        
        UIImage *img3 = [UIImage imageNamed:@"hard.png"];
        [hard setBackgroundImage:img3 forState:UIControlStateNormal];
    }
}


-(IBAction)tap{
    if(MovieCount == 4){
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
    }else if(MovieCount == 8){
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
    }else{
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
    

}

-(IBAction)tap2{
    if(MovieCount == 5){
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
    }else if(MovieCount == 9){
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
    if(MovieCount == 4){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 5){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 8){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 9){
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

-(IBAction)Htap{
    MovieCount = MovieCount + 1;
    [data setInteger:MovieCount forKey:@"MovieCount"];
    [data synchronize];
    [audio stop];
    [self performSegueWithIdentifier:@"hard" sender:nil];
}


@end

