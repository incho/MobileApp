//
//  SMCollectionViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCollectionViewController : UIViewController{
    
    IBOutlet UIButton *tuS;
    IBOutlet UIButton *tuG;
    IBOutlet UIButton *honS;
    IBOutlet UIButton *honG;
    IBOutlet UIButton *toiS;
    IBOutlet UIButton *toiG;
    IBOutlet UIButton *konS;
    IBOutlet UIButton *konG;
    
    
    NSTimer *kiraTime;
    NSTimer *cloudTime1;
    NSTimer *cloudTime2;
    NSTimer *cloudTime3;
    NSTimer *cloudTime4;
    NSTimer *cloudTime5;
    NSUserDefaults *data;
    NSArray *cloudArray;
    NSString *select;
    int clearCount;
    int MovieCount;
    BOOL kiraFlag;
    
}

-(IBAction)Stutorial;
-(IBAction)Ftutorial;
-(IBAction)Shontou;
-(IBAction)Fhontou;
-(IBAction)Stoile;
-(IBAction)Ftoile;
-(IBAction)Skonpei;
-(IBAction)Fkonpei;




@end
