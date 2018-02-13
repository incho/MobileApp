//
//  StageSelectViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "StageSelectViewController.h"

@interface StageSelectViewController ()

@end

@implementation StageSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"ステージ選択画面" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    cloudArray = @[@"雲１.png",@"雲２.png",@"雲３.png",@"雲４.png",@"雲５.png"];
    
    kiraFlag = true;
    clearCount = 0;
    
    //保存したクリア数を取り出す
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    int MovieCount = 0;
    if([data objectForKey:@"MovieCount"]){
        MovieCount = [[data objectForKey:@"MovieCount"] intValue];
    }
    
    NSLog(@"%d",MovieCount);
    
    
    if(clearCount == 0){
        UIImage *img = [UIImage imageNamed:@"NEW本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"トイレッ島灰.png"];
        UIImage *img3 = [UIImage imageNamed:@"こんぺい島灰.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        toilettou.enabled = NO;
        konpeitou.enabled = NO;
        
        Stage1.image = [UIImage imageNamed:@"hon_r.png"];
        Stage2.image = [UIImage imageNamed:@"hon_r.png"];
        Stage3.image = [UIImage imageNamed:@"hon_r.png"];
        Stage4.image = [UIImage imageNamed:@"hon_r.png"];
        Stage5.image = [UIImage imageNamed:@"hon_r.png"];
        
    }else if(clearCount == 1){
        UIImage *img = [UIImage imageNamed:@"S_本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"NEWトイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"こんぺい島灰.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        konpeitou.enabled = NO;
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_r.png"];
        Stage3.image = [UIImage imageNamed:@"hon_r.png"];
        Stage4.image = [UIImage imageNamed:@"hon_r.png"];
        Stage5.image = [UIImage imageNamed:@"hon_r.png"];
        
    }else if(clearCount == 2){
        UIImage *img = [UIImage imageNamed:@"S_本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"S_トイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"NEWこんぺい島.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_b.png"];
        Stage3.image = [UIImage imageNamed:@"hon_r.png"];
        Stage4.image = [UIImage imageNamed:@"hon_r.png"];
        Stage5.image = [UIImage imageNamed:@"hon_r.png"];
        
    }else if(clearCount == 3){
        UIImage *img = [UIImage imageNamed:@"S_本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"NEWトイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"S_こんぺい島.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_b.png"];
        Stage3.image = [UIImage imageNamed:@"hon_b.png"];
        Stage4.image = [UIImage imageNamed:@"hon_r.png"];
        Stage5.image = [UIImage imageNamed:@"hon_r.png"];
        
    }else if(clearCount == 4){
        UIImage *img = [UIImage imageNamed:@"S_本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"S_トイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"NEWこんぺい島.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_b.png"];
        Stage3.image = [UIImage imageNamed:@"hon_b.png"];
        Stage4.image = [UIImage imageNamed:@"hon_b.png"];
        Stage5.image = [UIImage imageNamed:@"hon_r.png"];
        
    }else if(clearCount == 5){
        UIImage *img = [UIImage imageNamed:@"NEW本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"S_トイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"S_こんぺい島.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_b.png"];
        Stage3.image = [UIImage imageNamed:@"hon_b.png"];
        Stage4.image = [UIImage imageNamed:@"hon_b.png"];
        Stage5.image = [UIImage imageNamed:@"hon_b.png"];
        
    }else if(clearCount >= 6){
        UIImage *img = [UIImage imageNamed:@"S_本島.png"];
        UIImage *img2 = [UIImage imageNamed:@"S_トイレッ島.png"];
        UIImage *img3 = [UIImage imageNamed:@"S_こんぺい島.png"];
        [hontou setBackgroundImage:img forState:UIControlStateNormal];
        [toilettou setBackgroundImage:img2 forState:UIControlStateNormal];
        [konpeitou setBackgroundImage:img3 forState:UIControlStateNormal];
        
        Stage1.image = [UIImage imageNamed:@"hon_b.png"];
        Stage2.image = [UIImage imageNamed:@"hon_b.png"];
        Stage3.image = [UIImage imageNamed:@"hon_b.png"];
        Stage4.image = [UIImage imageNamed:@"hon_b.png"];
        Stage5.image = [UIImage imageNamed:@"hon_b.png"];
        
    }
    

    [self kiraTimer];
    [self cloudTimer1];
    [self cloudTimer2];
    [self cloudTimer3];
    [self cloudTimer4];
    [self cloudTimer5];
}

-(void)kiraTimer{
    kiraTime = [NSTimer scheduledTimerWithTimeInterval:0.8
                                                target:self
                                              selector:@selector(kirakira)
                                              userInfo:nil
                                               repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: kiraTime forMode:NSDefaultRunLoopMode];
}

-(void)kirakira{
    if(kiraFlag == true){
        kira.image = [UIImage imageNamed:@"キラキラ２.png"];
        kiraFlag = false;
    }else if(kiraFlag == false){
        kira.image = [UIImage imageNamed:@"キラキラ１.png"];
        kiraFlag = true;
    }
    
}


-(void)cloudTimer1{
    cloudTime1 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                target:self
                                              selector:@selector(cloudMove1)
                                              userInfo:nil
                                               repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: cloudTime1 forMode:NSDefaultRunLoopMode];
}

-(void)cloudMove1{
    //雲動かす
    Cloud1.center = CGPointMake(Cloud1.center.x - 0.05, Cloud1.center.y);
    //左端までいったら右に戻す
    if(Cloud1.center.x + 50 < -10){
        Cloud1.center = CGPointMake(650, Cloud1.center.y);
        int random = arc4random() % 5;
        Cloud1.image = [UIImage imageNamed:cloudArray[random]];
    }
}

-(void)cloudTimer2{
    cloudTime2 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                  target:self
                                                selector:@selector(cloudMove2)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: cloudTime2 forMode:NSDefaultRunLoopMode];
}

-(void)cloudMove2{
    //雲動かす
    Cloud2.center = CGPointMake(Cloud2.center.x - 0.05, Cloud2.center.y);
    //左端までいったら右に戻す
    if(Cloud2.center.x + 50 < -10){
        Cloud2.center = CGPointMake(670, Cloud2.center.y);
        int random = arc4random() % 5;
        Cloud2.image = [UIImage imageNamed:cloudArray[random]];
    }
}

-(void)cloudTimer3{
    cloudTime3 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                  target:self
                                                selector:@selector(cloudMove3)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: cloudTime3 forMode:NSDefaultRunLoopMode];
}

-(void)cloudMove3{
    //雲動かす
    Cloud3.center = CGPointMake(Cloud3.center.x - 0.05, Cloud3.center.y);
    //左端までいったら右に戻す
    if(Cloud3.center.x + 80 < -10){
        Cloud3.center = CGPointMake(700, Cloud3.center.y);
        int random = arc4random() % 5;
        Cloud3.image = [UIImage imageNamed:cloudArray[random]];
    }
}

-(void)cloudTimer4{
    cloudTime4 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                  target:self
                                                selector:@selector(cloudMove4)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: cloudTime4 forMode:NSDefaultRunLoopMode];
}

-(void)cloudMove4{
    //雲動かす
    Cloud4.center = CGPointMake(Cloud4.center.x - 0.05, Cloud4.center.y);
    //左端までいったら右に戻す
    if(Cloud4.center.x + 10 < -10){
        Cloud4.center = CGPointMake(650, Cloud4.center.y);
        int random = arc4random() % 5;
        Cloud4.image = [UIImage imageNamed:cloudArray[random]];
    }
}

-(void)cloudTimer5{
    cloudTime5 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                  target:self
                                                selector:@selector(cloudMove5)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: cloudTime5 forMode:NSDefaultRunLoopMode];
}

-(void)cloudMove5{
    //雲動かす
    Cloud5.center = CGPointMake(Cloud5.center.x - 0.05, Cloud5.center.y);
    //左端までいったら右に戻す
    if(Cloud5.center.x + 70 < -10){
        Cloud5.center = CGPointMake(650, Cloud5.center.y);
        int random = arc4random() % 5;
        Cloud5.image = [UIImage imageNamed:cloudArray[random]];
    }
}

-(IBAction)hon{
    [audio stop];
    [self performSegueWithIdentifier:@"hon" sender:nil];
}

-(IBAction)toile{
    [audio stop];
    [self performSegueWithIdentifier:@"toile" sender:nil];
}

-(IBAction)kon{
    [audio stop];
    [self performSegueWithIdentifier:@"kon" sender:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

