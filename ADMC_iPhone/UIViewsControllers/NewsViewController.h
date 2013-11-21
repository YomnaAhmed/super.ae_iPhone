//
//  FirstViewController.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/6/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewsViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{

    AppDelegate *appDelegate;
    BOOL pageControlUsed;
    BOOL isOpen;
    BOOL isSearchViewVisible;
}
@property (nonatomic,strong) IBOutlet UIScrollView  *newsScrollView;
@property (nonatomic,strong) IBOutlet UIPageControl *newsPageController;
@property (nonatomic,strong) IBOutlet UITableView   *newsTableView;
@property (nonatomic,strong) IBOutlet UIScrollView  *pageControlScrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;


-(void)loadScrollViewWithPage:(int)page;
//- (void)scrollViewDidScroll:(UIScrollView *)sender;
-(IBAction)search:(id)sender;
-(IBAction)openSectionsView:(id)sender;
-(IBAction)changePage:(id)sender;
@end
