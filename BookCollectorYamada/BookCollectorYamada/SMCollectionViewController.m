//
//  SMCollectionViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "SMCollectionViewController.h"

@interface SMCollectionViewController ()

@end

@implementation SMCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"movieSelect" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    
    clearCount = 0;
    
    //保存したクリア数を取り出す
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    MovieCount = 0;
    if([data objectForKey:@"MovieCount"]){
        MovieCount = [[data objectForKey:@"MovieCount"] intValue];
    }
    
    
    if(MovieCount == 0){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [honS setBackgroundImage:img forState:UIControlStateNormal];
        [honG setBackgroundImage:img forState:UIControlStateNormal];
        [toiS setBackgroundImage:img forState:UIControlStateNormal];
        [toiG setBackgroundImage:img forState:UIControlStateNormal];
        [konS setBackgroundImage:img forState:UIControlStateNormal];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        
    }else if(MovieCount == 1){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [honG setBackgroundImage:img forState:UIControlStateNormal];
        [toiS setBackgroundImage:img forState:UIControlStateNormal];
        [toiG setBackgroundImage:img forState:UIControlStateNormal];
        [konS setBackgroundImage:img forState:UIControlStateNormal];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        
    }else if(MovieCount == 2){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [toiS setBackgroundImage:img forState:UIControlStateNormal];
        [toiG setBackgroundImage:img forState:UIControlStateNormal];
        [konS setBackgroundImage:img forState:UIControlStateNormal];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
    }else if(MovieCount == 3){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [toiG setBackgroundImage:img forState:UIControlStateNormal];
        [konS setBackgroundImage:img forState:UIControlStateNormal];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
    }else if(MovieCount == 4){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [konS setBackgroundImage:img forState:UIControlStateNormal];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
        UIImage *img7 = [UIImage imageNamed:@"トイレッ島ゴール.png"];
        [toiG setBackgroundImage:img7 forState:UIControlStateNormal];
    }else if(MovieCount == 5){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
        UIImage *img7 = [UIImage imageNamed:@"トイレッ島ゴール.png"];
        [toiG setBackgroundImage:img7 forState:UIControlStateNormal];
        UIImage *img8 = [UIImage imageNamed:@"こんぺい島開始.png"];
        [konS setBackgroundImage:img8 forState:UIControlStateNormal];
    }else if(MovieCount == 6){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [konG setBackgroundImage:img forState:UIControlStateNormal];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
        UIImage *img7 = [UIImage imageNamed:@"トイレッ島ゴール.png"];
        [toiG setBackgroundImage:img7 forState:UIControlStateNormal];
        UIImage *img8 = [UIImage imageNamed:@"こんぺい島開始.png"];
        [konS setBackgroundImage:img8 forState:UIControlStateNormal];
        UIImage *img9 = [UIImage imageNamed:@"こんぺい島ゴール.png"];
        [konG setBackgroundImage:img9 forState:UIControlStateNormal];
    }else if(MovieCount >= 7){
        UIImage *img = [UIImage imageNamed:@"noimage.png"];
        [end setBackgroundImage:img forState:UIControlStateNormal];
        [end1 setBackgroundImage:img forState:UIControlStateNormal];
        [end2 setBackgroundImage:img forState:UIControlStateNormal];
        [end3 setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
        UIImage *img7 = [UIImage imageNamed:@"トイレッ島ゴール.png"];
        [toiG setBackgroundImage:img7 forState:UIControlStateNormal];
        UIImage *img8 = [UIImage imageNamed:@"こんぺい島開始.png"];
        [konS setBackgroundImage:img8 forState:UIControlStateNormal];
        UIImage *img9 = [UIImage imageNamed:@"こんぺい島ゴール.png"];
        [konG setBackgroundImage:img9 forState:UIControlStateNormal];
    }else if(MovieCount == 10){
        UIImage *img2 = [UIImage imageNamed:@"tyu-toriaru.png"];
        [tuS setBackgroundImage:img2 forState:UIControlStateNormal];
        UIImage *img3 = [UIImage imageNamed:@"No1_2.png"];
        [tuG setBackgroundImage:img3 forState:UIControlStateNormal];
        UIImage *img4 = [UIImage imageNamed:@"本島開始.png"];
        [honS setBackgroundImage:img4 forState:UIControlStateNormal];
        UIImage *img5 = [UIImage imageNamed:@"本島ゴール.png"];
        [honG setBackgroundImage:img5 forState:UIControlStateNormal];
        UIImage *img6 = [UIImage imageNamed:@"トイレッ島開始.png"];
        [toiS setBackgroundImage:img6 forState:UIControlStateNormal];
        UIImage *img7 = [UIImage imageNamed:@"トイレッ島ゴール.png"];
        [toiG setBackgroundImage:img7 forState:UIControlStateNormal];
        UIImage *img8 = [UIImage imageNamed:@"こんぺい島開始.png"];
        [konS setBackgroundImage:img8 forState:UIControlStateNormal];
        UIImage *img9 = [UIImage imageNamed:@"こんぺい島ゴール.png"];
        [konG setBackgroundImage:img9 forState:UIControlStateNormal];
        UIImage *img10 = [UIImage imageNamed:@"３ステージクリア後.png"];
        [end setBackgroundImage:img10 forState:UIControlStateNormal];
        UIImage *img11 = [UIImage imageNamed:@"エンディング1 .png"];
        [end1 setBackgroundImage:img11 forState:UIControlStateNormal];
        UIImage *img12 = [UIImage imageNamed:@"エンディング2.png"];
        [end2 setBackgroundImage:img12 forState:UIControlStateNormal];
        UIImage *img13 = [UIImage imageNamed:@"エンディング3.png"];
        [end3 setBackgroundImage:img13 forState:UIControlStateNormal];
    }
    
}


-(IBAction)Stutorial{
    select = @"チュートリアル開始";
    [data setObject:select forKey:@"ムービー選択"];
    [data synchronize];
    [audio stop];
    [self performSegueWithIdentifier:@"select" sender:nil];
}

-(IBAction)Ftutorial{
    select = @"チュートリアル終了";
    [data setObject:select forKey:@"ムービー選択"];
    [data synchronize];
    [audio stop];
    [self performSegueWithIdentifier:@"select" sender:nil];
}

-(IBAction)Shontou{
    if(MovieCount >= 1){
        select = @"本島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Fhontou{
    if(MovieCount >= 2){
        select = @"本島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Stoile{
    if(MovieCount >= 3){
        select = @"トイレッ島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ftoile{
    if(MovieCount >= 4){
        select = @"トイレッ島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Skonpei{
    if(MovieCount >= 5){
        select = @"こんぺい島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Fkonpei{
    if(MovieCount >= 6){
        select = @"こんぺい島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ending{
    if(MovieCount >= 7){
        select = @"エンディング";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ending1{
    if(MovieCount >= 7){
        select = @"エンディング1";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ending2{
    if(MovieCount >= 7){
        select = @"エンディング2";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ending3{
    if(MovieCount >= 7){
        select = @"エンディング3";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [audio stop];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)tap{
    [audio stop];
    [self performSegueWithIdentifier:@"back" sender:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
