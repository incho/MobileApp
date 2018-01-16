//
//  SMCMovieViewController.m
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import "SMCMovieViewController.h"

@interface SMCMovieViewController ()

@end

@implementation SMCMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tapCount = 0;
    clearCount = 0;
    data = [NSUserDefaults standardUserDefaults];
    if([data objectForKey:@"clearCount"]){
        clearCount = [[data objectForKey:@"clearCount"] intValue];
    }
    if([data objectForKey:@"ムービー選択"]){
        select = [data objectForKey:@"ムービー選択"];
    }
    
    [self kakunou];

}

-(void)kakunou{
    if([select isEqualToString:@"チュートリアル開始"]){
        Array = @[@"No1_1.png",@"No1_2.png",@"No1_3.png",@"No1_4.png",@"No1_5.png",@"No2_1.png",@"No2_2.png",@"No2_3.png",@"No2_4.png",@"No3_1.png",@"No3_2.png",@"No3_3.png",@"No3_4.png",@"No3_5.png",@"No5_1.png",@"No5_2.png",@"No5_3.png",@"No5_4.png"];
    }else if([select isEqualToString:@"チュートリアル終了"]){
        Array = @[@"No1_1.png",@"No1_2.png",@"No1_3.png",@"No1_4.png",@"No1_5.png",@"No2_1.png",@"No2_2.png",@"No2_3.png",@"No2_4.png",@"No3_1.png",@"No3_2.png",@"No3_3.png",@"No3_4.png",@"No3_5.png",@"No5_1.png",@"No5_2.png",@"No5_3.png",@"No5_4.png"];
    }else if([select isEqualToString:@"本島開始"]){
        Array = @[@"t1s.png",@"t2s.png",@"t3s.png",@"t4s.png"];
    }else if([select isEqualToString:@"本島終了"]){
        Array = @[@"t1g.png",@"t2g.png",@"t3g.png",@"t4g.png",@"t5g.png",@"t6g.png"];
    }else if([select isEqualToString:@"トイレッ島開始"]){
        Array = @[@"t1s.png",@"t2s.png",@"t3s.png",@"t4s.png"];
    }else if([select isEqualToString:@"トイレッ島終了"]){
        Array = @[@"t1g.png",@"t2g.png",@"t3g.png",@"t4g.png",@"t5g.png",@"t6g.png"];
    }else if([select isEqualToString:@"こんぺい島開始"]){
        Array = @[@"kon_op1.png",@"kon_op2.png",@"kon_op3.png",@"kon_op4.png",@"kon_op5.png"];
    }else if([select isEqualToString:@"こんぺい島終了"]){
        Array = @[@"kon_ed1.png",@"kon_ed2.png",@"kon_ed3.png",@"kon_ed4.png",@"kon_ed5.png",@"kon_ed6.png",@"kon_ed7.png",@"kon_ed8.png",@"kon_ed9.png",@"kon_ed10.png",@"kon_ed11.png"];
    }
    
    UIImage *img = [UIImage imageNamed:Array[tapCount]];
    [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    
}

-(IBAction)tap{
    
    tapCount = tapCount + 1;
    
    if(tapCount == Array.count){
        [self performSegueWithIdentifier:@"back" sender:nil];
    }else{
        UIImage *img = [UIImage imageNamed:Array[tapCount]];
        [movieImage setBackgroundImage:img forState:UIControlStateNormal];
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
