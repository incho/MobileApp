//
//  TutorialMovieViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "TutorialMovieViewController.h"

@interface TutorialMovieViewController ()

@end

@implementation TutorialMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    count = 0;
    movieArray = @[@"No1_1.png",@"No1_2.png",@"No1_3.png",@"No1_4.png",@"No1_5.png",@"No2_1.png",@"No2_2.png",@"No2_3.png",@"No2_4.png",@"No2_5.png",@"No3_1.png",@"No3_2.png",@"No3_3.png",@"No3_4.png",@"No3_5.png",@"No4_1.png",@"No4_2.png",@"No4_3.png",@"No4_4.png",@"No4_5.png"];
    UIImage *img = [UIImage imageNamed:movieArray[count]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    
    count2 = 0;
    movieArray2 = @[@"No5_1.png",@"No5_2.png",@"No5_3.png",@"No5_4.png",@"No6_1.png",@"No6_2.png",@"No6_3.png"];
    UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
    [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    
}


-(IBAction)tap{
    count = count + 1;
    
    if(count == movieArray.count){
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else{
        UIImage *img = [UIImage imageNamed:movieArray[count]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }
}

-(IBAction)tap2{
    count2 = count2 + 1;
    
    if(count2 == movieArray2.count){
        [audio stop];
        [self performSegueWithIdentifier:@"next" sender:nil];
    }else{
        UIImage *img2 = [UIImage imageNamed:movieArray2[count2]];
        [movieImage2 setBackgroundImage:img2 forState:UIControlStateNormal];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

