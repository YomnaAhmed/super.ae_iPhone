//
//  NewsDetailsViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/21/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "NewsDetailsViewController.h"
#import "AddCommentViewController.h"
#import "SHK.h"

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
    [appDelegate.aDMCTabBarController.view setBackgroundColor:[UIColor blackColor]];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    self.newsDetailsToolBar.frame=CGRectMake(0, screenHeight-46 , 320, 44);
    [appDelegate.aDMCTabBarController.view addSubview:self.newsDetailsToolBar];
    [self.articleSlider setHidden:YES];

}
- (void)viewDidDisappear:(BOOL)animated{

    [self.newsDetailsToolBar removeFromSuperview];
    NSLog(@"disappeared..");

}

- (void)viewDidAppear:(BOOL)animated{
    
   [appDelegate.aDMCTabBarController.view addSubview:self.newsDetailsToolBar];
    NSLog(@"disappeared..");
    
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

- (IBAction) addComment:(id)sender{
    NSLog(@"addComment");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ADMCStoryBoard" bundle:[NSBundle mainBundle]];
    AddCommentViewController *addCommentViewController=[storyboard instantiateViewControllerWithIdentifier:@"AddCommentViewController"];
    [self.navigationController pushViewController:addCommentViewController animated:YES];

}
- (IBAction) addToFavourites:(id)sender{

    NSLog(@"addToFavourites");
}
- (IBAction) zoomIn:(id)sender{
    [self.articleSlider setHidden:NO];
    NSLog(@"zoomIn");
}
- (IBAction) share:(id)sender{

    // Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
	SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awesome!"];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showFromToolbar:self.newsDetailsToolBar];

}
@end
