//
//  ViewController.m
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2017/10/05.
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    speed = 1;
    jumpFlag = true;
    HPFlag = true;
    HP = 3;
    
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
}

//背景のタイマー
-(void)haikeiTimer{
    haikeiTime = [NSTimer scheduledTimerWithTimeInterval:0.01
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
    time1 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                            target:self
                                          selector:@selector(syougaiRun)
                                          userInfo:nil
                                           repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time1 forMode:NSDefaultRunLoopMode];
}
//下の障害物が動くやつ
-(void)syougaiRun{
    //当たり判定
    if(syougai.center.x + 20 > player.center.x && syougai.center.x - 20 < player.center.x){
        if(syougai.center.y + 50 > player.center.y && syougai.center.y - 50 < player.center.y){
            if(HPFlag == true){
                HP = HP - 1;
                HPFlag = false;
                [self kaihuku];
            }
        }
    }
    
    //障害物動かす
    syougai.center = CGPointMake(syougai.center.x - speed, syougai.center.y);
    //左端までいったら右に戻す
    if(syougai.center.x < -10){
        [time1 invalidate];
        HPFlag = true;
        syougai.center = CGPointMake(600, syougai.center.y);
        [self waitTimer1];
    }
}

//上の障害物のタイマー
-(void)timer2{
    time2 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(syougai2Run)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time2 forMode:NSDefaultRunLoopMode];
}
//上の障害物が動くやつ
-(void)syougai2Run{
    //当たり判定
    if(syougai2.center.x + 20 > player.center.x && syougai2.center.x - 20 < player.center.x){
        if(syougai2.center.y + 50 > player.center.y && syougai2.center.y - 20 < player.center.y){
            if(HPFlag == true){
                HP = HP - 1;
                HPFlag = false;
                [self kaihuku];
            }
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
    jumpFlag = false;
    time3 = [NSTimer scheduledTimerWithTimeInterval:0.01
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
        [self timer3];
        //高さ判定をtrueに
        takasaFlag = true;
    }
}

//プレイヤーがジャンプする処理
-(void)jump{
    //一定の高さまで来ていなければ上に動かす
    if(takasaFlag == true){
        player.center = CGPointMake(player.center.x, player.center.y - 1);
    //一定の高さまで来たら下に動かす
    }else{
        player.center = CGPointMake(player.center.x, player.center.y + 1);
        //下まで来たらタップの判定をtrueに
        if(player.center.y > 280){
            player.center = CGPointMake(player.center.x, 280);
            jumpFlag = true;
            [time3 invalidate];
        }
    }
    //上まで来たら高さの判定をfalseに
    if(player.center.y < 190){
        takasaFlag = false;
    }
}


//アイテムのタイマー
-(void)timer4{
    time4 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(itemRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time4 forMode:NSDefaultRunLoopMode];
}

//アイテムが動くやつ
-(void)itemRun{
    //当たり判定
    if(item.center.x + 20 > player.center.x && item.center.x - 20 < player.center.x){
        if(item.center.y + 50 > player.center.y && item.center.y - 20 < player.center.y){
            if(HPFlag == true){
                item.image = [UIImage imageNamed:@""];
                HP = HP + 1;
                HPFlag = false;
                [self kaihuku];
            }
        }
    }
    
    //障害物動かす
    item.center = CGPointMake(item.center.x - speed, item.center.y);
    //左端までいったら右に戻す
    if(item.center.x < -10){
        [time4 invalidate];
        HPFlag = true;
        item.image = [UIImage imageNamed:@"heal.png"];
        item.center = CGPointMake(600, item.center.y);
        [self waitTimer3];
    }
}


//HPを回復させる処理
-(void)kaihuku{
    if(HP >= 3){
        HP = 3;
        heat3.image = [UIImage imageNamed:@"heat.png"];
    }else if(HP == 2){
        heat3.image = [UIImage imageNamed:@""];
        heat2.image = [UIImage imageNamed:@"heat.png"];
    }else if(HP == 1){
        heat2.image = [UIImage imageNamed:@""];
        heat1.image = [UIImage imageNamed:@"heat.png"];
    }else if(HP == 0){
        heat1.image = [UIImage imageNamed:@""];
        [self performSegueWithIdentifier:@"gameover" sender:nil];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
