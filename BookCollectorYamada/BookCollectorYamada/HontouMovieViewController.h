//
//  HontouMovieViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HontouMovieViewController : UIViewController{
    IBOutlet UIButton *movieImage;
    IBOutlet UIButton *movieImage2;
    IBOutlet UILabel *start;
    
    NSArray *movieArray;
    NSArray *movieArray2;
    NSUserDefaults *data;
    AVAudioPlayer *audio;
    int count;
    int count2;
    int clearCount;
    int MovieCount;
    
}


-(IBAction)tap;
-(IBAction)tap2;
-(IBAction)modoru;






@end
