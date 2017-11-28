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
    
    count = 0;
    movieArray = @[@"kon_op1.png",@"kon_op2.png",@"kon_op3.png",@"kon_op4.png",@"kon_op5.png"];
    UIImage *img = [UIImage imageNamed:movieArray[count]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    
    count2 = 0;
    movieArray2 = @[@"t1g.png",@"t2g.png",@"t3g.png",@"t4g.png",@"t5g.png",@"t6g.png",@"t7g.png"];
    UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
    [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    
}


-(IBAction)tap{
    count = count + 1;
    
    if(count == movieArray.count){
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else{
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }
}

-(IBAction)tap2{
    count2 = count2 + 1;
    
    if(count2 == movieArray2.count){
        [self performSegueWithIdentifier:@"back" sender:nil];
    }else{
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

