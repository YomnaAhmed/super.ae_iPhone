//
//  FirstViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/6/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
     [self.navigationItem setTitleView:[appDelegate viewTitleAdjustment:@"اخبار"]];
     CGRect screenRect = [[UIScreen mainScreen] bounds];
     CGFloat screenHeight = screenRect.size.height;
     self.newsScrollView.contentSize=CGSizeMake(500.0, screenHeight-120);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
