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
        movieArray = @[@"t1s.png",@"t2s.png",@"t3s.png",@"t4s.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }else if(MovieCount == 1){
        count2 = 0;
        movieArray2 = @[@"t1g.png",@"t2g.png",@"t3g.png",@"t4g.png",@"t5g.png",@"t6g.png"];
        
        UIImage *img = [UIImage imageNamed:@"本島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else if(MovieCount == 7){
        start.hidden = YES;
        count = 0;
        movieArray = @[@"last6_1.png",@"last6_2.png",@"last6_3.png",@"last6_4.png"];
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
            
            [self performSegueWithIdentifier:@"back" sender:nil];
        }else{
            UIImage *img = [UIImage imageNamed:movieArray[count]];
            [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        }
    }else{
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
            [self performSegueWithIdentifier:@"back" sender:nil];
        }else{
            UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
            [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        }
    }else{
        [self performSegueWithIdentifier:@"back" sender:nil];
    }
}

-(IBAction)skip{
    [self performSegueWithIdentifier:@"next" sender:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
