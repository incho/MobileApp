//
//  KonpeitouMovieViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface KonpeitouMovieViewController : UIViewController{
    IBOutlet UIButton *movieImage;
    IBOutlet UIButton *movieImage2;
    IBOutlet UIButton *normal;
    IBOutlet UIButton *hard;
    IBOutlet UILabel *start;
    
    NSUserDefaults *data;
    NSArray *movieArray;
    NSArray *movieArray2;
    AVAudioPlayer *audio;
    int count;
    int count2;
    int clearCount;
    int MovieCount;
    
}


-(IBAction)tap;
-(IBAction)tap2;
-(IBAction)Htap;
-(IBAction)modoru;






@end


