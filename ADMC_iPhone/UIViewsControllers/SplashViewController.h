//
//  SplashViewController.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/19/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SplashViewController : UIViewController{

    AppDelegate *appDelegate;
}

@property (nonatomic,strong) IBOutlet UIImageView *splashImage;

@end
