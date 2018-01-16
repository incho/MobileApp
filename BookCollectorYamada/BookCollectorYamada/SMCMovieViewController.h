//
//  SMCMovieViewController.h
//  BookCollectorYamada
//
//  Created by 上原優里奈 on 2017/12/22.
//  Copyright © 2017年 MobileApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCMovieViewController : UIViewController{

    IBOutlet UIButton *movieImage;
    
    NSUserDefaults *data;
    NSArray *Array;
    NSString *select;
    int clearCount;
    int tapCount;
}

-(IBAction) tap;


@end
