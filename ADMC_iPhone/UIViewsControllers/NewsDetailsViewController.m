//
//  NewsDetailsViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/21/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "NewsDetailsViewController.h"
#import "AddCommentViewController.h"
#import "OWActivityViewController.h"

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
//	NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
//	SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awesome!"];
//    
//	// Get the ShareKit action sheet
//	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
//    
//	// Display the action sheet
//	[actionSheet showFromToolbar:self.newsDetailsToolBar];
    
//    UIImage *anImage = [UIImage imageNamed:@"second.png"];
//    NSArray *Items   = [NSArray arrayWithObjects:
//                        @"A text line",
//                        anImage, nil];
//
//    UIActivityViewController *ActivityView =
//    [[UIActivityViewController alloc]
//     initWithActivityItems:Items applicationActivities:nil];
//    [self.navigationController presentModalViewController:ActivityView animated:YES];
    // Prepare activities
    //
    OWTwitterActivity *twitterActivity = [[OWTwitterActivity alloc] init];
    OWMailActivity *mailActivity = [[OWMailActivity alloc] init];
    OWSafariActivity *safariActivity = [[OWSafariActivity alloc] init];
    OWSaveToCameraRollActivity *saveToCameraRollActivity = [[OWSaveToCameraRollActivity alloc] init];
    OWMapsActivity *mapsActivity = [[OWMapsActivity alloc] init];
    OWPrintActivity *printActivity = [[OWPrintActivity alloc] init];
    OWCopyActivity *copyActivity = [[OWCopyActivity alloc] init];
    OWFacebookActivity *faceBookActivity = [[OWFacebookActivity alloc] init];
    // Create some custom activity
    //
    OWActivity *customActivity = [[OWActivity alloc] initWithTitle:@"Custom"
                                                             image:[UIImage imageNamed:@"OWActivityViewController.bundle/Icon_Custom"]
                                                       actionBlock:^(OWActivity *activity, OWActivityViewController *activityViewController) {
                                                           [activityViewController dismissViewControllerAnimated:YES completion:^{
                                                               NSLog(@"Info: %@", activityViewController.userInfo);
                                                           }];
                                                       }];
    
    // Compile activities into an array, we will pass that array to
    // OWActivityViewController on the next step
    //
    
    NSMutableArray *activities = [NSMutableArray arrayWithObject:mailActivity];
    
    // For some device may not support message (ie, Simulator and iPod Touch).
    // There is a bug in the Simulator when you configured iMessage under OS X,
    // for detailed information, refer to: http://stackoverflow.com/questions/9349381/mfmessagecomposeviewcontroller-on-simulator-cansendtext
    if ([MFMessageComposeViewController canSendText]) {
        OWMessageActivity *messageActivity = [[OWMessageActivity alloc] init];
        [activities addObject:messageActivity];
    }
    
    [activities addObjectsFromArray:@[saveToCameraRollActivity, twitterActivity]];
    
    if( NSClassFromString (@"UIActivityViewController") ) {
        // ios 6, add facebook and sina weibo activities
        //OWFacebookActivity *facebookActivity = [[OWFacebookActivity alloc] init];
        OWSinaWeiboActivity *sinaWeiboActivity = [[OWSinaWeiboActivity alloc] init];
        [activities addObjectsFromArray:@[
                                          sinaWeiboActivity
                                          ]];
    }
    
    [activities addObjectsFromArray:@[
                                      safariActivity, mapsActivity, printActivity, copyActivity, customActivity,faceBookActivity]];
    
    // Create OWActivityViewController controller and assign data source
    //
    OWActivityViewController *activityViewController = [[OWActivityViewController alloc] initWithViewController:self activities:activities];
    activityViewController.userInfo = @{
                                        @"image": [UIImage imageNamed:@"second.png"],
                                        @"text": @"Test.....!",
                                        @"url": [NSURL URLWithString:@"https://github.com/romaonthego/OWActivityViewController"],
                                        @"coordinate": @{@"latitude": @(37.751586275), @"longitude": @(-122.447721511)}
                                        };
    
    [activityViewController presentFromRootViewController];

}
@end
