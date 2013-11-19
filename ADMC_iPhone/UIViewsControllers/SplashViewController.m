//
//  SplashViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/19/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "SplashViewController.h"
#import "NewsViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    // Then fades it away after 2 seconds (the cross-fade animation will take 0.5s)

    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [UIView animateWithDuration:1.0 delay:4.0 options:0 animations:^{
        self.splashImage.alpha=1.0;
    } completion:^(BOOL finished) {
        // Once the animation is completed and the alpha has gone to 0.0, hide the view for good
        [self.navigationController pushViewController:appDelegate.aDMCTabBarController animated:YES];
        
    }];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
