//
//  ToilettoumovieViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "ToilettoumovieViewController.h"

@interface ToilettoumovieViewController ()

@end

@implementation ToilettoumovieViewController

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
    
    if(MovieCount == 2){
        start.hidden = YES;
        normal.hidden = YES;
        hard.hidden = YES;
        
        count = 0;
        movieArray = @[@"t1s.png",@"t2s.png",@"t3s.png",@"t4s.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    
    }else if(MovieCount == 3){
        normal.hidden = YES;
        hard.hidden = YES;
        
        count2 = 0;
        movieArray2 = @[@"t1g.png",@"t2g.png",@"t3g.png",@"t4g.png",@"t5g.png",@"t6g.png"];
        UIImage *img = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else if(MovieCount > 2){
        normal.hidden = YES;
        hard.hidden = YES;
        UIImage *img = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        
    }
    
    if(clearCount == 3){
        start.hidden = YES;
        normal.hidden = NO;
        hard.hidden = NO;
        UIImage *img = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"after1_8.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        
        UIImage *img3 = [UIImage imageNamed:@"hardNew.png"];
        [hard setBackgroundImage:img3 forState:UIControlStateNormal];
        
    }else if(clearCount > 3){
        start.hidden = YES;
        normal.hidden = NO;
        hard.hidden = NO;
        UIImage *img = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"トイレッ島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        
        UIImage *img3 = [UIImage imageNamed:@"hard.png"];
        [hard setBackgroundImage:img3 forState:UIControlStateNormal];
    }
}


-(IBAction)tap{
    if(MovieCount == 2){
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
    }else{
        [self performSegueWithIdentifier:@"next" sender:nil];
    }

}

-(IBAction)tap2{
    if(MovieCount == 3){
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
        MovieCount = 7;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [self performSegueWithIdentifier:@"back" sender:nil];
    }
}

-(IBAction)skip{
    if(MovieCount == 2){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else if(MovieCount == 3){
        MovieCount = MovieCount + 1;
        [data setInteger:MovieCount forKey:@"MovieCount"];
        [data synchronize];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
