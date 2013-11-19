//
//  SecondViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/6/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "MatchesViewController.h"

@interface MatchesViewController ()

@end

@implementation MatchesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.navigationItem setTitleView:[appDelegate viewTitleAdjustment:@"مباريات"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
