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
    
    cloudArray = @[@"雲１.png",@"雲２.png",@"雲３.png",@"雲４.png",@"雲５.png"];
    
    kiraFlag = true;
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


-(IBAction)Stutorial{
    select = @"チュートリアル開始";
    [data setObject:select forKey:@"ムービー選択"];
    [data synchronize];
    [self performSegueWithIdentifier:@"select" sender:nil];
}

-(IBAction)Ftutorial{
    select = @"チュートリアル終了";
    [data setObject:select forKey:@"ムービー選択"];
    [data synchronize];
    [self performSegueWithIdentifier:@"select" sender:nil];
}

-(IBAction)Shontou{
    if(MovieCount >= 1){
        select = @"本島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Fhontou{
    if(MovieCount >= 2){
        select = @"本島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Stoile{
    if(MovieCount >= 3){
        select = @"トイレッ島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Ftoile{
    if(MovieCount >= 4){
        select = @"トイレッ島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Skonpei{
    if(MovieCount >= 5){
        select = @"こんぺい島開始";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}

-(IBAction)Fkonpei{
    if(MovieCount >= 6){
        select = @"こんぺい島終了";
        [data setObject:select forKey:@"ムービー選択"];
        [data synchronize];
        [self performSegueWithIdentifier:@"select" sender:nil];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
