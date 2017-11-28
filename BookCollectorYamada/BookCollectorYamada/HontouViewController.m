//
//  HontouViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "HontouViewController.h"

@interface HontouViewController ()

@end

@implementation HontouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    speed = 1;
    jumpFlag = true;
    HPFlag = true;
    itemFlag = true;
    HP = 3;
    kyoriCount = 5;
    costume = 0;
    clearCount = 0;
    
    //保存したクリア数を取り出す 
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    
    //初期配置
    player.center = CGPointMake(player.center.x, 280);
    syougai.center = CGPointMake(600, 290);
    syougai2.center = CGPointMake(600, 190);
    item.center = CGPointMake(600, 190);
    haikei2.center = CGPointMake(852, haikei2.center.y);
    
    [self waitTimer1];
    [self waitTimer2];
    [self waitTimer3];
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
    
    //距離が0になったら
    if(kyoriCount == 0){
        
        //クリアしたことを記録する
        if(clearCount == 0){
            clearCount = 1;
            [data setInteger:clearCount forKey:@"clearCount"];
            [data synchronize];
        }
        //ムービーへ
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
    
    //左端までいったらまた右から出す
    if(haikei1.center.x < -285){
        haikei1.center = CGPointMake(850, haikei1.center.y);
    }
    if(haikei2.center.x < -285){
        haikei2.center = CGPointMake(850, haikei2.center.y);
    }
}


//ランダムに出すために待つタイマー(下の障害物)
-(void)waitTimer1{
    int waitTime = arc4random() % 2;
    NSTimer *WT1 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer1)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT1 forMode:NSDefaultRunLoopMode];
}

//ランダムに出すために待つタイマー(上の障害物)
-(void)waitTimer2{
    int waitTime = arc4random() % 2;
    NSTimer *WT2 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 1
                                                    target:self
                                                  selector:@selector(timer2)
                                                  userInfo:nil
                                                   repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer: WT2 forMode:NSDefaultRunLoopMode];
}

//アイテムをランダムに出すためのタイマー
-(void)waitTimer3{
    int waitTime = arc4random() % 15;
    NSTimer *WT3 = [NSTimer scheduledTimerWithTimeInterval:waitTime + 5
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
    
    //当たり判定
    float hit_left = syougai.center.x - 22 - 43;
    float hit_right = syougai.center.x + 22 + 43;
    float hit_up = syougai.center.y - 22 - 46;
    float hit_down = syougai.center.y + 22 + 46;
    player_right = player.center.x + 21.5;
    player_left = player.center.x - 21.5;
    player_up = player.center.y - 23;
    player_down = player.center.y + 23;
    
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
    if(hit_right < -10){
        [time1 invalidate];
        HPFlag = true;
        syougai.center = CGPointMake(600, syougai.center.y);
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
    
    //当たり判定
    float hit_left = syougai2.center.x - 22 - 43;
    float hit_right = syougai2.center.x + 22 + 43;
    float hit_up = syougai2.center.y - 22 - 46;
    float hit_down = syougai2.center.y + 22 + 46;
    player_right = player.center.x + 21.5;
    player_left = player.center.x - 21.5;
    player_up = player.center.y - 23;
    player_down = player.center.y + 23;
    
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
    if(syougai2.center.x < -10){
        [time2 invalidate];
        HPFlag = true;
        syougai2.center = CGPointMake(600, syougai2.center.y);
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
        if(player.center.y > 280){
            player.center = CGPointMake(player.center.x, 280);
            jumpFlag = true;
            costume = 0;
            [time3 invalidate];
        }
    }
    //上まで来たら高さの判定をfalseに
    if(jumpCount == 1){
        if(player.center.y < 190){
            takasaFlag = false;
            jumpFlag = false;
            jumpCount = 0;
        }
    }else{
        if(player.center.y < 90){
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
    
    //当たり判定
    float hit_left = item.center.x - 18.5 - 43;
    float hit_right = item.center.x + 18.5 + 43;
    float hit_up = item.center.y - 18.5 - 46;
    float hit_down = item.center.y + 18.5 + 46;
    player_right = player.center.x + 21.5;
    player_left = player.center.x - 21.5;
    player_up = player.center.y - 23;
    player_down = player.center.y + 23;
    
    if((hit_left < player_left) && (player_right < hit_right) && (hit_up < player_up) && (player_down < hit_down)){
        
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
        //足が早くなるやつを取った時
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
    if(hit_right < -5){
        [time4 invalidate];
        HPFlag = true;
        itemFlag = true;
        item.center = CGPointMake(600, item.center.y);
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
        [self performSegueWithIdentifier:@"gameover" sender:nil];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
