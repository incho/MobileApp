//
//  HontouMovieViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HontouMovieViewController : UIViewController{
    IBOutlet UIButton *movieImage;
    IBOutlet UIButton *movieImage2;
    IBOutlet UILabel *start;
    
    NSArray *movieArray;
    NSArray *movieArray2;
    NSUserDefaults *data;
    int count;
    int count2;
    int clearCount;
    
}


-(IBAction)tap;
-(IBAction)tap2;






@end
