//
//  ViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2017/10/05.
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *syougai;
    IBOutlet UIImageView *player;
    IBOutlet UIImageView *syougai2;
    IBOutlet UIImageView *haikei1;
    IBOutlet UIImageView *haikei2;
    IBOutlet UIImageView *heat1;
    IBOutlet UIImageView *heat2;
    IBOutlet UIImageView *heat3;
    IBOutlet UIImageView *item;
    IBOutlet UILabel *kyoriLabel;
    
    NSTimer *time1;
    NSTimer *time2;
    NSTimer *time3;
    NSTimer *time4;
    NSTimer *haikeiTime;
    NSTimer *kyoriTime;
    NSTimer *playerTime;
    int speed;
    int HP;
    int jumpCount;
    int kyoriCount;
    int costume;
    BOOL jumpFlag;
    BOOL takasaFlag;
    BOOL HPFlag;
}


@end
