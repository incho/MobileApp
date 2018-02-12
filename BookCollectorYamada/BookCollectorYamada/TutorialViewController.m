//
//  TutorialViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"tyu-toriaru" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    speed = 1;
    jumpFlag = true;
    HPFlag = true;
    haikeiFlag1 = true;
    haikeiFlag2 = true;
    HP = 3;
    costume = 0;
    count = 0;
    finish.hidden = YES;
    syougai.hidden = YES;
    syougai2.hidden = YES;
    item.hidden = YES;
    
    //大きさを取得
    player_Wsize = player.frame.size.width / 2;
    player_Hsize = player.frame.size.height / 2;
    syougai_Wsize = syougai.frame.size.width / 2;
    syougai2_Wsize = syougai2.frame.size.width / 2;
    syougai_Hsize = syougai.frame.size.height / 2;
    syougai2_Hsize = syougai2.frame.size.height / 2;
    item_size = item.frame.size.width / 2;
    haikei1_size = haikei1.frame.size.width / 2;
    haikei2_size = haikei2.frame.size.width / 2;
    finish_Wsize = finish.frame.size.width / 2;
    finish_Hsize = finish.frame.size.height / 2;
    

    
    //初期配置
    syougai.center = CGPointMake(start.center.x + syougai_Wsize, syougai.center.y);
    syougai2.center = CGPointMake(start.center.x + syougai2_Wsize, syougai2.center.y);
    item.center = CGPointMake(start.center.x + item_size, item.center.y);
    haikei1.center = CGPointMake(end.center.x + haikei1_size, haikei1.center.y);
    haikei2.center = CGPointMake(haikei1.center.x + haikei1_size + haikei2_size, haikei2.center.y);
    finish.center = CGPointMake(start.center.x + finish_Wsize, finish.center.y);
    player.center = CGPointMake(oji.center.x + player_Wsize + (player.frame.size.width * 3), player.center.y);



    
    [self waitTimer1];
    [self waitTimer2];
    [self waitTimer3];
    [self haikeiTimer];
    [self playerTimer];
    [self timer5];
}

//プレイヤーを走らせるタイマー
-(void)playerTimer{
    playerTime = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                  target:self
                                                selector:@selector(playerRun)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: playerTime forMode:NSDefaultRunLoopMode];
}

-(void)playerRun{
    if(costume == 0){
        player.image = [UIImage imageNamed:@"dash1.png"];
        costume = 1;
    }else if(costume == 1){
        player.image = [UIImage imageNamed:@"dash2.png"];
        costume = 0;
    }else if(costume == 2){
        player.image = [UIImage imageNamed:@"jump.png"];
    }else if(costume == 3){
        player.image = [UIImage imageNamed:@"butukaru.png"];
        costume = 0;
    }else if(costume == 4){
        player.image = [UIImage imageNamed:@"kaihuku.png"];
        costume = 0;
    }
}




//背景のタイマー
-(void)haikeiTimer{
    haikeiTime = [NSTimer scheduledTimerWithTimeInterval:0.005
                                                  target:self
                                                selector:@selector(haikei)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: haikeiTime forMode:NSDefaultRunLoopMode];
}
//背景動かすやつ
-(void)haikei{
    //背景動かす
    haikei1.center = CGPointMake(haikei1.center.x - speed, haikei1.center.y);
    haikei2.center = CGPointMake(haikei2.center.x - speed, haikei2.center.y);
    
    //次の背景の右端が画面の右端にきたら画像を右に戻す
    if(haikei2.center.x + haikei2_size <= start.center.x){
        if(haikeiFlag2 == true){
            haikeiFlag2 = false;
            haikei1.center = CGPointMake(start.center.x + haikei1_size, haikei1.center.y);
            haikeiFlag1 = true;
        }
        
    }
    if(haikei1.center.x + haikei1_size <= start.center.x){
        if(haikeiFlag1 == true){
            haikeiFlag1 = false;
            haikei2.center = CGPointMake(start.center.x + haikei2_size, haikei2.center.y);
            haikeiFlag2 = true;
        }
    }
}


//ランダムに出すために待つタイマー(下の障害物)
-(void)waitTimer1{
    int waitTime = arc4random() % 3;
    NSTimer *WT1 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer1)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT1 forMode:NSDefaultRunLoopMode];
}

//ランダムに出すために待つタイマー(上の障害物)
-(void)waitTimer2{
    int waitTime = arc4random() % 3;
    NSTimer *WT2 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer2)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT2 forMode:NSDefaultRunLoopMode];
}

//アイテムのタイマー
-(void)waitTimer3{
    NSTimer *WT3 = [NSTimer scheduledTimerWithTimeInterval:20
                                                    target:self
                                                  selector:@selector(timer4)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT3 forMode:NSDefaultRunLoopMode];
}




//下の障害物のタイマー
-(void)timer1{
    time1 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(syougaiRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:time1 forMode:NSDefaultRunLoopMode];
}
//下の障害物が動くやつ
-(void)syougaiRun{
    
    syougai.hidden = NO;
    //当たり判定
    float hit_left = syougai.center.x - syougai_Wsize - player.frame.size.width;
    float hit_right = syougai.center.x + syougai_Wsize + player.frame.size.width;
    float hit_up = syougai.center.y - syougai_Hsize - player.frame.size.height;
    float hit_down = syougai.center.y + syougai_Hsize + player.frame.size.height;
    player_right = player.center.x + player_Wsize;
    player_left = player.center.x - player_Wsize;
    player_up = player.center.y - player_Hsize;
    player_down = player.center.y + player_Hsize;
    
    //障害物の周りにプレイヤー分の幅を取り、その範囲内に入っていれば当たってるよねっていう判定
    if((hit_left < player_left) && (player_right < hit_right) && (hit_up < player_up) && (player_down < hit_down)){
        if(HPFlag == true){
            costume = 3;
            HP = HP - 1;
            HPFlag = false;
            [self kaihuku];
        }
    }
    
    
    //障害物動かす
    syougai.center = CGPointMake(syougai.center.x - speed, syougai.center.y);
    //左端までいったら右に戻す
    if(syougai.center.x + syougai_Wsize < end.center.x){
        [time1 invalidate];
        syougai.hidden = YES;
        HPFlag = true;
        syougai.center = CGPointMake(start.center.x + syougai_Wsize, syougai.center.y);
        [self waitTimer1];
    }
}

//上の障害物のタイマー
-(void)timer2{
    time2 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(syougai2Run)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time2 forMode:NSDefaultRunLoopMode];
}
//上の障害物が動くやつ
-(void)syougai2Run{
    
    syougai2.hidden = NO;
    //当たり判定
    float hit_left = syougai2.center.x - syougai2_Wsize - player.frame.size.width;
    float hit_right = syougai2.center.x + syougai2_Wsize + player.frame.size.width;
    float hit_up = syougai2.center.y - syougai2_Hsize - player.frame.size.height;
    float hit_down = syougai2.center.y + syougai2_Hsize + player.frame.size.height;
    player_right = player.center.x + player_Wsize;
    player_left = player.center.x - player_Wsize;
    player_up = player.center.y - player_Hsize;
    player_down = player.center.y + player_Hsize;
    
    if((hit_left < player_left) && (player_right < hit_right) && (hit_up < player_up) && (player_down < hit_down)){
        if(HPFlag == true){
            costume = 3;
            HP = HP - 1;
            HPFlag = false;
            [self kaihuku];
        }
    }
    
    
    //障害物動かす
    syougai2.center = CGPointMake(syougai2.center.x - speed, syougai2.center.y);
    //左端までいったら右に戻す
    if(syougai2.center.x + syougai2_Wsize < end.center.x){
        [time2 invalidate];
        syougai2.hidden = YES;
        HPFlag = true;
        syougai2.center = CGPointMake(start.center.x + syougai2_Wsize, syougai2.center.y);
        [self waitTimer2];
    }
}


//プレイヤーのタイマー
-(void)timer3{
    time3 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(jump)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time3 forMode:NSDefaultRunLoopMode];
}

//画面タップ
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //まだタップされていなければ
    if(jumpFlag == true){
        jumpCount = jumpCount + 1;
        [time3 invalidate];
        [self timer3];
        //高さ判定をtrueに
        takasaFlag = true;
    }
}

//プレイヤーがジャンプする処理
-(void)jump{
    costume = 2;
    //一定の高さまで来ていなければ上に動かす
    if(takasaFlag == true){
        player.center = CGPointMake(player.center.x, player.center.y - speed);
        //一定の高さまで来たら下に動かす
    }else{
        player.center = CGPointMake(player.center.x, player.center.y + speed);
        //下まで来たらタップの判定をtrueに
        if(player.center.y > oji.center.y){
            player.center = CGPointMake(player.center.x, oji.center.y);
            jumpFlag = true;
            costume = 0;
            [time3 invalidate];
        }
    }
    //上まで来たら高さの判定をfalseに
    //1回タップ
    if(jumpCount == 1){
        if(player.center.y + player_Hsize + player.frame.size.height + syougai_Hsize < syougai.center.y - syougai_Hsize){
            takasaFlag = false;
            jumpFlag = false;
            jumpCount = 0;
        }
    //2回タップ
    }else{
        if(player.center.y + player_Hsize + player.frame.size.height < syougai2.center.y - syougai2_Hsize){
            takasaFlag = false;
            jumpFlag = false;
            jumpCount = 0;
        }
    }
    
}


//アイテムのタイマー
-(void)timer4{
    time4 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(itemRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time4 forMode:NSDefaultRunLoopMode];
}

//アイテムが動くやつ
-(void)itemRun{
    
    item.hidden = NO;
    //当たり判定
    float hit_left = item.center.x - item_size - player.frame.size.width;
    float hit_right = item.center.x + item_size + player.frame.size.width;
    float hit_up = item.center.y - item_size - player.frame.size.height;
    float hit_down = item.center.y + item_size + player.frame.size.height;
    player_right = player.center.x + player_Wsize;
    player_left = player.center.x - player_Wsize;
    player_up = player.center.y - player_Hsize;
    player_down = player.center.y + player_Hsize;
    
    if((hit_left < player_left) && (player_right < hit_right) && (hit_up < player_up) && (player_down < hit_down)){
        
        costume = 4;
        
        if(HPFlag == true){
            item.image = [UIImage imageNamed:@""];
            HP = HP + 1;
            HPFlag = false;
            [self kaihuku];
        }
    }
    
    //アイテム動かす
    item.center = CGPointMake(item.center.x - speed, item.center.y);
    //左端までいったら右に戻す
    if(item.center.x + item_size < end.center.x){
        [time4 invalidate];
        item.hidden = YES;
        HPFlag = true;
        item.image = [UIImage imageNamed:@"heal.png"];
        item.center = CGPointMake(start.center.x + item_size, item.center.y);
        [self waitTimer3];
    }
}


//HPを回復させる処理
-(void)kaihuku{
    
    float oji_kyori1 = oji.center.x + player_Wsize + player.frame.size.width;
    float oji_kyori2 = oji.center.x + player_Wsize + (player.frame.size.width * 2);
    float oji_kyori3 = oji.center.x + player_Wsize + (player.frame.size.width * 3);
    
    if(HP >= 3){
        HP = 3;
        heat3.image = [UIImage imageNamed:@"heart.png"];
        [UIView animateWithDuration:1 animations:^{
            player.center=CGPointMake(oji_kyori3,player.center.y); }];
    }else if(HP == 2){
        heat3.image = [UIImage imageNamed:@""];
        heat2.image = [UIImage imageNamed:@"heart.png"];
        [UIView animateWithDuration:1 animations:^{
            player.center=CGPointMake(oji_kyori2,player.center.y); }];
    }else if(HP == 1){
        heat2.image = [UIImage imageNamed:@""];
        heat1.image = [UIImage imageNamed:@"heart.png"];
        [UIView animateWithDuration:1 animations:^{
            player.center=CGPointMake(oji_kyori1 ,player.center.y); }];
    }else if(HP == 0){
        heat1.image = [UIImage imageNamed:@""];
        [time1 invalidate];
        [time2 invalidate];
        [time3 invalidate];
        [time4 invalidate];
        [time5 invalidate];
        [haikeiTime invalidate];
        [playerTime invalidate];
        [audio stop];
        [self performSegueWithIdentifier:@"gameover" sender:nil];
    }
}


//強制終了アイテムのタイマー
-(void)timer5{
    time5 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(syougai3Run)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time5 forMode:NSDefaultRunLoopMode];
}

//強制終了アイテムが動くやつ
-(void)syougai3Run{
    count = count + 0.005;
    if(count >= 30){
        finish.hidden = NO;
        
        //当たり判定
        float hit_left = finish.center.x - finish_Wsize - player.frame.size.width;
        float hit_right = finish.center.x + finish_Wsize + player.frame.size.width;
        float hit_up = finish.center.y - finish_Hsize - player.frame.size.height;
        float hit_down = finish.center.y + finish_Hsize + player.frame.size.height;
        player_right = player.center.x + player_Wsize;
        player_left = player.center.x - player_Wsize;
        player_up = player.center.y - player_Hsize;
        player_down = player.center.y + player_Hsize;
        
        if((hit_left < player_left) && (player_right < hit_right) && (hit_up < player_up) && (player_down < hit_down)){
            [time1 invalidate];
            [time2 invalidate];
            [time3 invalidate];
            [time4 invalidate];
            [time5 invalidate];
            [haikeiTime invalidate];
            [playerTime invalidate];
            [audio stop];
            [self performSegueWithIdentifier:@"gameover" sender:nil];
        }
        
        
        //障害物動かす
        finish.center = CGPointMake(finish.center.x - speed, finish.center.y);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
