//
//  LastMovieViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2018/02/12.
//  Copyright © 2018年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastMovieViewController : UIViewController{
    
    IBOutlet UIImageView *gazou;
    IBOutlet UIButton *select1;
    IBOutlet UIButton *select2;
    IBOutlet UIButton *select3;
    IBOutlet UIButton *movieImage;
    
    NSUserDefaults *data;
    NSArray *Array;
    NSString *select;
    int clearCount;
    int tapCount;
    
}

-(IBAction)S1;
-(IBAction)S2;
-(IBAction)S3;
-(IBAction)tap;


@end
