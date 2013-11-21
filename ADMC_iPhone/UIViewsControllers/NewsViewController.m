//
//  FirstViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/6/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "NewsViewController.h"
#import "PageControlViewController.h"
#import "GeneralCell.h"
#import "SearchViewController.h"
#import "NewsDetailsViewController.h"
static NSUInteger numberOfPages = 5;

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
     [self.navigationItem setTitleView:[appDelegate viewTitleAdjustment:@"اخبار"]];
    //====to set the 2 images in the nav bar=========================//
     NSArray *tempArray2= [[NSArray alloc] initWithObjects:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                    action:@selector(openSectionsView:)],[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)],nil];
    self.navigationItem.rightBarButtonItems=tempArray2;
    
    //==============ScreenSize to set the contentSize of the newsScrollView==============//
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    self.newsScrollView.contentSize=CGSizeMake(500.0, screenHeight-120);
    [self.newsScrollView setDelegate:self];
    [self.newsScrollView setScrollEnabled:NO];
    isOpen=NO;
    
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < numberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [self.newsScrollView setTag:0];
    // a page is the width of the scroll view
    self.pageControlScrollView.contentSize = CGSizeMake(self.pageControlScrollView.frame.size.width * numberOfPages,self.pageControlScrollView.frame.size.height);
    //self.pageControlScrollView.delegate = self;
    [self.newsPageController addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];

    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    
    //=====searchView=============
    isSearchViewVisible=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= numberOfPages) return;
	
    // replace the placeholder if necessary
    PageControlViewController *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ADMCStoryBoard" bundle:[NSBundle mainBundle]];
        controller =[storyboard instantiateViewControllerWithIdentifier:@"PageControlViewController"];
        [controller setPageNumber:page];
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) {
        CGRect frame = self.pageControlScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.pageControlScrollView addSubview:controller.view];
    }
}

#pragma- mark UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)sender{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.pageControlScrollView.frame.size.width;
    int page = floor((self.pageControlScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.newsPageController.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
    NSLog(@"left.....");

}

-(IBAction)search:(id)sender
{
    
      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ADMCStoryBoard" bundle:[NSBundle mainBundle]];
      SearchViewController *searchViewController=[storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
         

    if (isSearchViewVisible==NO) {
        [self.view addSubview:searchViewController.view];
        NSLog(@"added.....");
        isSearchViewVisible=YES;
    }
    else{
        
        [searchViewController.view removeFromSuperview];
        isSearchViewVisible=NO;

    
    }
    NSLog(@"Search....");
}

-(IBAction)openSectionsView:(id)sender{
    if (isOpen==NO) {
    self.newsScrollView.contentOffset = CGPointMake(self.newsScrollView.contentSize.width-self.newsScrollView.frame.size.width,self.newsScrollView.frame.origin.y);
    isOpen=YES;
    }
    else{
    self.newsScrollView.contentOffset = CGPointMake(self.newsScrollView.frame.origin.x,self.newsScrollView.frame.origin.y);
    isOpen=NO;
    }
}

-(IBAction)changePage:(id)sender{
    int page = self.newsPageController.currentPage;
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // update the scroll view to the appropriate page
    CGRect frame = self.pageControlScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.pageControlScrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;

}

#pragma- mark UITableViewDelegate/UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"NewsCell";

    GeneralCell *cell=(GeneralCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[GeneralCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.generalLabel setText:@"اخر خبر"];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return[NSString stringWithFormat:@"the sectino is %d",section];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 2;

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ADMCStoryBoard" bundle:[NSBundle mainBundle]];
    NewsDetailsViewController *newsDetailsViewController=[storyboard instantiateViewControllerWithIdentifier:@"NewsDetailsViewController"];
    [self.navigationController pushViewController:newsDetailsViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
