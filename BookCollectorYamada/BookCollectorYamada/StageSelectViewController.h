//
//  StageSelectViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2017/10/31.
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StageSelectViewController : UIViewController{
    IBOutlet UIImageView *kira;
    IBOutlet UIImageView *Cloud1;
    IBOutlet UIImageView *Cloud2;
    IBOutlet UIImageView *Cloud3;
    IBOutlet UIImageView *Cloud4;
    IBOutlet UIImageView *Cloud5;
    
    NSTimer *kiraTime;
    NSTimer *cloudTime1;
    NSTimer *cloudTime2;
    NSTimer *cloudTime3;
    NSTimer *cloudTime4;
    NSTimer *cloudTime5;
    BOOL kiraFlag;
    NSArray *cloudArray;
}


@end
