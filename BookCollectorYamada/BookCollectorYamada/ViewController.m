//
//  ViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//てすと

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [NSUserDefaults standardUserDefaults];
}

-(IBAction)reset{
    [data removeObjectForKey:@"clearCount"];
    [self performSegueWithIdentifier:@"reset" sender:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
