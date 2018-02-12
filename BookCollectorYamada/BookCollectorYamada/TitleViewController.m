//
//  TitleViewController.m
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2018/02/12.
//  Copyright © 2018年 MobileApp. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data = [NSUserDefaults standardUserDefaults];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"title" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
}

-(IBAction)reset{
    [data removeObjectForKey:@"clearCount"];
    [data removeObjectForKey:@"MovieCount"];
    [audio stop];
    [self performSegueWithIdentifier:@"reset" sender:nil];
}

-(IBAction)tuduki{
    [audio stop];
    [self performSegueWithIdentifier:@"tuduki" sender:nil];
}


@end

