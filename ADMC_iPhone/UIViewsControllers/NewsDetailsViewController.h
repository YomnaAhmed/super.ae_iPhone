//
//  NewsDetailsViewController.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/21/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewsDetailsViewController : UIViewController{


    AppDelegate *appDelegate;
}

@property (nonatomic,strong) IBOutlet UILabel *articleTitle;
@property (nonatomic,strong) IBOutlet UILabel *articleDate;
@property (nonatomic,strong) IBOutlet UILabel *writtenBy;
@property (nonatomic,strong) IBOutlet UILabel *dislikeLabel;
@property (nonatomic,strong) IBOutlet UILabel *likeLabel;
@property (nonatomic,strong) IBOutlet UIButton *likeButton;
@property (nonatomic,strong) IBOutlet UIButton *disLikeButton;
@property (nonatomic,strong) IBOutlet UIImageView *articleImageView;
@property (nonatomic,strong) IBOutlet UITextView *articleTextView;
@property (nonatomic,strong) IBOutlet UIScrollView *newsDetailsScroll;
@property (nonatomic,strong) IBOutlet UISlider *articleSlider;
- (IBAction) sliderValueChanged:(id)sender;

@end
