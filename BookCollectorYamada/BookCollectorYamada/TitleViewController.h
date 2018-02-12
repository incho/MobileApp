//
//  TitleViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2018/02/12.
//  Copyright © 2018年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TitleViewController : UIViewController{

    NSUserDefaults *data;
    AVAudioPlayer *audio;
    
}

-(IBAction)reset;
-(IBAction)tuduki;

@end
