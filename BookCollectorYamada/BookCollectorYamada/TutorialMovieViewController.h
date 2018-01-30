//
//  TutorialMovieViewController.h
//  BookCollectorYamada
//
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialMovieViewController : UIViewController{
    IBOutlet UIButton *movieImage;
    IBOutlet UIButton *movieImage2;
    
    NSArray *movieArray;
    NSArray *movieArray2;
    int count;
    int count2;
    
}


-(IBAction)tap;
-(IBAction)tap2;
-(IBAction)skip;






@end

