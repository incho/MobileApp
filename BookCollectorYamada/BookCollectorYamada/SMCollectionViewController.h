//
//  SMCollectionViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCollectionViewController : UIViewController{
    
    IBOutlet UIImageView *kira;
    IBOutlet UIImageView *Cloud1;
    IBOutlet UIImageView *Cloud2;
    IBOutlet UIImageView *Cloud3;
    IBOutlet UIImageView *Cloud4;
    IBOutlet UIImageView *Cloud5;
    IBOutlet UIButton *hontou;
    IBOutlet UIButton *toilettou;
    IBOutlet UIButton *konpeitou;
    
    NSTimer *kiraTime;
    NSTimer *cloudTime1;
    NSTimer *cloudTime2;
    NSTimer *cloudTime3;
    NSTimer *cloudTime4;
    NSTimer *cloudTime5;
    NSUserDefaults *data;
    int clearCount;
    BOOL kiraFlag;
    NSArray *cloudArray;
    
}








@end
