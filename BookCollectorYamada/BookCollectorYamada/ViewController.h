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
    
    NSTimer *time1;
    NSTimer *time2;
    int speed;
    BOOL jumpFlag;
    BOOL takasaFlag;
}


@end

