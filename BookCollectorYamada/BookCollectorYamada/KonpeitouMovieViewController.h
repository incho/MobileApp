//
//  KonpeitouMovieViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KonpeitouMovieViewController : UIViewController{
    IBOutlet UIButton *movieImage;
    IBOutlet UIButton *movieImage2;
    IBOutlet UIButton *normal;
    IBOutlet UIButton *hard;
    IBOutlet UILabel *start;
    
    NSUserDefaults *data;
    NSArray *movieArray;
    NSArray *movieArray2;
    int count;
    int count2;
    int clearCount;
    int MovieCount;
    
}


-(IBAction)tap;
-(IBAction)tap2;






@end


