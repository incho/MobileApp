//
//  ToilettouViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToilettouViewController : UIViewController{
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
    IBOutlet UIView *start;
    IBOutlet UIView *end;
    IBOutlet UIView *top;
    IBOutlet UIView *bottom;
    
    NSTimer *time1;
    NSTimer *time2;
    NSTimer *time3;
    NSTimer *time4;
    NSTimer *haikeiTime;
    NSTimer *kyoriTime;
    NSTimer *playerTime;
    NSUserDefaults *data;
    float speed;
    float player_right;
    float player_left;
    float player_up;
    float player_down;
    float haikei1_size;
    float haikei2_size;
    float syougai_Wsize;
    float syougai2_Wsize;
    float syougai_Hsize;
    float syougai2_Hsize;
    float player_Wsize;
    float player_Hsize;
    float player_syoki;
    float item_size;
    int HP;
    int jumpCount;
    int kyoriCount;
    int costume;
    int itemType;
    int clearCount;
    BOOL jumpFlag;
    BOOL takasaFlag;
    BOOL HPFlag;
    BOOL itemFlag;
    BOOL haikeiFlag1;
    BOOL haikeiFlag2;
    
}


@end
