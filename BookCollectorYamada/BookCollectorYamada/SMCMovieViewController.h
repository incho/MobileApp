//
//  SMCMovieViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2017/12/22.
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SMCMovieViewController : UIViewController{

    IBOutlet UIButton *movieImage;
    
    NSUserDefaults *data;
    NSArray *Array;
    NSString *select;
    AVAudioPlayer *audio;
    int clearCount;
    int tapCount;
}

-(IBAction) tap;


@end
