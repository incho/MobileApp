//
//  SMCollectionViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SMCollectionViewController : UIViewController{
    
    IBOutlet UIButton *tuS;
    IBOutlet UIButton *tuG;
    IBOutlet UIButton *honS;
    IBOutlet UIButton *honG;
    IBOutlet UIButton *toiS;
    IBOutlet UIButton *toiG;
    IBOutlet UIButton *konS;
    IBOutlet UIButton *konG;
    IBOutlet UIButton *end;
    IBOutlet UIButton *end1;
    IBOutlet UIButton *end2;
    IBOutlet UIButton *end3;
    
    NSUserDefaults *data;
    NSArray *cloudArray;
    NSString *select;
    AVAudioPlayer *audio;
    int clearCount;
    int MovieCount;
    
}

-(IBAction)Stutorial;
-(IBAction)Ftutorial;
-(IBAction)Shontou;
-(IBAction)Fhontou;
-(IBAction)Stoile;
-(IBAction)Ftoile;
-(IBAction)Skonpei;
-(IBAction)Fkonpei;
-(IBAction)Ending;
-(IBAction)Ending1;
-(IBAction)Ending2;
-(IBAction)Ending3;
-(IBAction)tap;




@end
