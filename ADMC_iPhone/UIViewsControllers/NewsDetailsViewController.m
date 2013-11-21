//
//  NewsDetailsViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/21/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "NewsDetailsViewController.h"

@interface NewsDetailsViewController ()

@end

@implementation NewsDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.articleTextView setText:@"hiiiiiiii alll offff uuuuu"];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.aDMCTabBarController.tabBar setHidden:YES];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction) sliderValueChanged:(id)sender{
    [self.articleTextView setFont:[UIFont systemFontOfSize:self.articleSlider.value]];
    NSLog(@"slider value is %f",self.articleSlider.value);
}
@end
