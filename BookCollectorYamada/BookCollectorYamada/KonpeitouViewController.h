//
//  KonpeitouViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KonpeitouViewController : UIViewController{
    IBOutlet UIImageView *syougai;
    IBOutlet UIImageView *syougai2;
    IBOutlet UIImageView *syougai3;
    IBOutlet UIImageView *syougai4;
    IBOutlet UIImageView *player;
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
    NSTimer *time5;
    NSTimer *time6;
    NSTimer *haikeiTime;
    NSTimer *kyoriTime;
    NSTimer *playerTime;
    NSUserDefaults *data;
    float speed;
    int HP;
    int jumpCount;
    int kyoriCount;
    int costume;
    int itemType;
    int clearCount;
    float player_right;
    float player_left;
    float player_up;
    float player_down;
    BOOL jumpFlag;
    BOOL takasaFlag;
    BOOL HPFlag;
    BOOL itemFlag;
}


@end


