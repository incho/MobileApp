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
    
    clearCount = 0;
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    if(clearCount == 2){
        start.hidden = YES;
        normal.hidden = YES;
        hard.hidden = YES;
        
        count = 0;
        movieArray = @[@"kon_op1.png",@"kon_op2.png",@"kon_op3.png",@"kon_op4.png",@"kon_op5.png"];
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        count2 = 0;
        movieArray2 = @[@"kon_ed1.png",@"kon_ed2.png",@"kon_ed3.png",@"kon_ed4.png",@"kon_ed5.png",@"kon_ed6.png",@"kon_ed7.png",@"kon_ed8.png",@"kon_ed9.png",@"kon_ed10.png",@"kon_ed11.png"];
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else if(clearCount < 4){
        hard.hidden = YES;
        normal.hidden = YES;
        
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }else{
        start.hidden = YES;
        
        UIImage *img = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"こんぺい島.png"];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }
}


-(IBAction)tap{
    if(clearCount == 2){
        count = count + 1;
        
        if(count == movieArray.count){
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
    if(clearCount == 2){
        count2 = count2 + 1;
        
        if(count2 == movieArray2.count){
            [self performSegueWithIdentifier:@"back" sender:nil];
        }else{
            UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
            [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
        }
    }else{
        [self performSegueWithIdentifier:@"back" sender:nil];
    }

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

