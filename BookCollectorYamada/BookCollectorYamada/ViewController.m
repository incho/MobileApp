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
    speed = 5;
    jumpFlag = true;
    
    player.center = CGPointMake(player.center.x, 280);
   
    [self timer1];
}

-(void)timer1{
    time1 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                            target:self
                                          selector:@selector(syougaiRun)
                                          userInfo:nil
                                           repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time1 forMode:NSDefaultRunLoopMode];
}


-(void)syougaiRun{
    if(CGRectContainsRect(player.frame, syougai.frame)){
        NSLog(@"a");
        [time1 invalidate];
        [self performSegueWithIdentifier:@"gameover" sender:nil];
    }
    syougai.center = CGPointMake(syougai.center.x - speed, syougai.center.y);
    if(syougai.center.x < -10){
        syougai.center = CGPointMake(600, syougai.center.y);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(jumpFlag == true){
        [self timer2];
        takasaFlag = true;
    }
}

-(void)timer2{
    jumpFlag = false;
    time2 = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(jump)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: time2 forMode:NSDefaultRunLoopMode];
}

-(void)jump{
    if(takasaFlag == true){
        player.center = CGPointMake(player.center.x, player.center.y - 5);
    }else{
        player.center = CGPointMake(player.center.x, player.center.y + 5);
        if(player.center.y > 280){
            player.center = CGPointMake(player.center.x, 280);
            jumpFlag = true;
            [time2 invalidate];
        }
    }
    if(player.center.y < 230){
        takasaFlag = false;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
