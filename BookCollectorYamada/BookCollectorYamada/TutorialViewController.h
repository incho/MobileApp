//
//  TutorialViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController{
    IBOutlet UIImageView *syougai;
    IBOutlet UIImageView *player;
    IBOutlet UIImageView *syougai2;
    IBOutlet UIImageView *haikei1;
    IBOutlet UIImageView *haikei2;
    IBOutlet UIImageView *heat1;
    IBOutlet UIImageView *heat2;
    IBOutlet UIImageView *heat3;
    IBOutlet UIImageView *item;
    IBOutlet UIImageView *finish;
    
    NSTimer *time1;
    NSTimer *time2;
    NSTimer *time3;
    NSTimer *time4;
    NSTimer *time5;
    NSTimer *haikeiTime;
    NSTimer *playerTime;
    int speed;
    int HP;
    int jumpCount;
    int costume;
    float count;
    BOOL jumpFlag;
    BOOL takasaFlag;
    BOOL HPFlag;
}


@end

