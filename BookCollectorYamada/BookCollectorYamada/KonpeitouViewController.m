//
//  KonpeitouViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "KonpeitouViewController.h"

@interface KonpeitouViewController ()

@end

@implementation KonpeitouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"こんぺい島BGM" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:bundle];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio play];
    
    speed = 1;
    jumpFlag = true;
    HPFlag = true;
    itemFlag = true;
    haikeiFlag1 = true;
    haikeiFlag2 = true;
    HP = 3;
    kyoriCount = 20;
    costume = 0;
    syougai.hidden = YES;
    syougai2.hidden = YES;
    syougai3.hidden = YES;
    syougai4.hidden = YES;
    item.hidden = YES;

    
    //保存したクリア数を取り出す
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    //大きさを取得
    player_Wsize = player.frame.size.width / 2;
    player_Hsize = player.frame.size.height / 2;
    player_syoki = player.center.y;
    syougai_Wsize = syougai.frame.size.width / 2;
    syougai2_Wsize = syougai2.frame.size.width / 2;
    syougai3_Wsize = syougai3.frame.size.width / 2;
    syougai4_Wsize = syougai4.frame.size.width / 2;
    syougai_Hsize = syougai.frame.size.height / 2;
    syougai2_Hsize = syougai2.frame.size.height / 2;
    syougai3_Hsize = syougai3.frame.size.height / 2;
    syougai4_Hsize = syougai4.frame.size.height / 2;
    item_size = item.frame.size.width / 2;
    haikei1_size = haikei1.frame.size.width / 2;
    haikei2_size = haikei2.frame.size.width / 2;
    
    //初期配置
    syougai.center = CGPointMake(start.center.x + syougai_Wsize, syougai.center.y);
    syougai2.center = CGPointMake(start.center.x + syougai2_Wsize, syougai2.center.y);
    syougai3.center = CGPointMake(start.center.x + syougai3_Wsize, syougai3.center.y);
    syougai4.center = CGPointMake(start.center.x + syougai4_Wsize, syougai4.center.y);
    item.center = CGPointMake(start.center.x + item_size, item.center.y);
    haikei1.center = CGPointMake(end.center.x + haikei1_size, haikei1.center.y);
    haikei2.center = CGPointMake(haikei1.center.x + haikei1_size + haikei2_size, haikei2.center.y);
    
    
    [self waitTimer1];
    [self waitTimer2];
    [self waitTimer3];
    [self waitTimer4];
    [self waitTimer5];
    [self haikeiTimer];
    [self kyoriTimer];
    [self playerTimer];
}


//距離用のタイマー
-(void)kyoriTimer{
    kyoriTime = [NSTimer scheduledTimerWithTimeInterval:speed
                                                 target:self
                                               selector:@selector(kyori)
                                               userInfo:nil
                                                repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: kyoriTime forMode:NSDefaultRunLoopMode];
}

//距離を表示させる
-(void)kyori{
    kyoriCount = kyoriCount - 1;
    kyoriLabel.text = [NSString stringWithFormat:@"残り%dM",kyoriCount];
    if(kyoriCount == 0){
        
        //クリアしたことを記録する
        if(clearCount == 2){
            clearCount = 3;
            [data setInteger:clearCount forKey:@"clearCount"];
            [data synchronize];
        }
        //ムービーへ
        [audio stop];
        [self performSegueWithIdentifier:@"gameclear" sender:nil];
    }
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

//プレイヤーのイラスト切り替え
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

//ランダムに出すために待つタイマー(上の障害物)
-(void)waitTimer4{
    int waitTime = arc4random() % 3;
    NSTimer *WT4 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer5)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT4 forMode:NSDefaultRunLoopMode];
}

//ランダムに出すために待つタイマー(上の障害物)
-(void)waitTimer5{
    int waitTime = arc4random() % 3;
    NSTimer *WT5 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer6)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT5 forMode:NSDefaultRunLoopMode];
}

//アイテムをランダムに出すためのタイマー
-(void)waitTimer3{
    int waitTime = arc4random() % 1;
    NSTimer *WT3 = [NSTimer scheduledTimerWithTimeInterval:waitTime
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
    [[NSRunLoop currentRunLoop] addTimer: time1 forMode:NSDefaultRunLoopMode];
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


//上2の障害物のタイマー
-(void)timer5{
    time5 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(syougai3Run)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time5 forMode:NSDefaultRunLoopMode];
}

//上2の障害物が動くやつ
-(void)syougai3Run{
    syougai3.hidden = NO;
    //当たり判定
    float hit_left = syougai3.center.x - syougai3_Wsize - player.frame.size.width;
    float hit_right = syougai3.center.x + syougai3_Wsize + player.frame.size.width;
    float hit_up = syougai3.center.y - syougai3_Hsize - player.frame.size.height;
    float hit_down = syougai3.center.y + syougai3_Hsize + player.frame.size.height;
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
    syougai3.center = CGPointMake(syougai3.center.x - speed, syougai3.center.y);
    //左端までいったら右に戻す
    if(syougai3.center.x + syougai3_Wsize < end.center.x){
        [time5 invalidate];
        syougai3.hidden = YES;
        HPFlag = true;
        syougai3.center = CGPointMake(start.center.x + syougai3_Wsize, syougai3.center.y);
        [self waitTimer4];
    }
}


//下2の障害物のタイマー
-(void)timer6{
    time6 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(syougai4Run)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time6 forMode:NSDefaultRunLoopMode];
}
//下2の障害物が動くやつ
-(void)syougai4Run{
    
    syougai4.hidden = NO;
    //当たり判定
    float hit_left = syougai4.center.x - syougai4_Wsize - player.frame.size.width;
    float hit_right = syougai4.center.x + syougai4_Wsize + player.frame.size.width;
    float hit_up = syougai4.center.y - syougai4_Hsize - player.frame.size.height;
    float hit_down = syougai4.center.y + syougai4_Hsize + player.frame.size.height;
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
    syougai4.center = CGPointMake(syougai4.center.x - speed, syougai4.center.y);
    //左端までいったら右に戻す
    if(syougai4.center.x + syougai4_Wsize < end.center.x){
        [time6 invalidate];
        syougai4.hidden = YES;
        HPFlag = true;
        syougai4.center = CGPointMake(start.center.x + syougai4_Wsize, syougai4.center.y);
        [self waitTimer5];
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
        if(player.center.y > player_syoki){
            player.center = CGPointMake(player.center.x, player_syoki);
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
    itemType = arc4random() % 3;
    time4 = [NSTimer scheduledTimerWithTimeInterval:0.005
                                             target:self
                                           selector:@selector(itemRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time4 forMode:NSDefaultRunLoopMode];
}

//アイテムが動くやつ
-(void)itemRun{
    if(itemFlag == true){
        if(itemType == 0){
            item.image = [UIImage imageNamed:@"heal.png"];
        }else if(itemType == 1){
            item.image = [UIImage imageNamed:@"minus.png"];
        }else if(itemType == 2){
            item.image = [UIImage imageNamed:@"plus.png"];
        }
    }
    
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
        
        //♡を取った時
        if(itemType == 0){
            if(HPFlag == true){
                item.image = [UIImage imageNamed:@""];
                HP = HP + 1;
                HPFlag = false;
                itemFlag = false;
                [self kaihuku];
            }
        //足が遅くなるやつ取った時
        }else if(itemType == 1){
            if(itemFlag == true){
            item.image = [UIImage imageNamed:@""];
            speed = speed - 0.2;
                if(speed <= 0.1){
                    speed = 0.1;
                }
            itemFlag = false;
            }
        //足が早くなるやつ取った時
        }else if(itemType == 2){
            if(itemFlag == true){
                item.image = [UIImage imageNamed:@""];
                speed = speed + 0.2;
                itemFlag = false;
            }
        }
        
    }
    
    //アイテム動かす
    item.center = CGPointMake(item.center.x - speed, item.center.y);
    //左端までいったら右に戻す
    if(item.center.x + item_size < end.center.x){
        [time4 invalidate];
        HPFlag = true;
        itemFlag = true;
        item.center = CGPointMake(start.center.x + item_size, item.center.y);
        [self waitTimer3];
    }
}


//HPを回復させる処理
-(void)kaihuku{
    if(HP >= 3){
        HP = 3;
        heat3.image = [UIImage imageNamed:@"heart.png"];
    }else if(HP == 2){
        heat3.image = [UIImage imageNamed:@""];
        heat2.image = [UIImage imageNamed:@"heart.png"];
    }else if(HP == 1){
        heat2.image = [UIImage imageNamed:@""];
        heat1.image = [UIImage imageNamed:@"heart.png"];
    }else if(HP == 0){
        heat1.image = [UIImage imageNamed:@""];
        [time1 invalidate];
        [time2 invalidate];
        [time3 invalidate];
        [time4 invalidate];
        [time5 invalidate];
        [time6 invalidate];
        [kyoriTime invalidate];
        [haikeiTime invalidate];
        [playerTime invalidate];
        [audio stop];
        [self performSegueWithIdentifier:@"gameover" sender:nil];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
