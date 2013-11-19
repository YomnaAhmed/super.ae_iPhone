//
//  FirstViewController.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/6/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewsViewController : UIViewController{

 AppDelegate *appDelegate;
}
@property (nonatomic,strong) IBOutlet UIScrollView *newsScrollView;
@end
