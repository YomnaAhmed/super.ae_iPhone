//
//  PageControlViewController.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/20/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "PageControlViewController.h"

@interface PageControlViewController ()

@end

@implementation PageControlViewController

- (UIColor *)pageControlColorWithIndex:(int)index {
    if (pagesArray == nil) {
       pagesArray = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor magentaColor],
                                  [UIColor blueColor], [UIColor orangeColor], [UIColor brownColor], [UIColor grayColor], nil];
    }
    // Mod the index by the list length to ensure access remains in bounds.
    return [pagesArray objectAtIndex:index % [pagesArray count]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.pageNumberLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", self.pageNumber + 1];
    //[self.view addSubview:self.pageNumberLabel];
    self.view.backgroundColor = [self pageControlColorWithIndex:self.pageNumber];
    NSLog(@"page number is %d",self.pageNumber);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithPageNumber:(int)page{
    self = [super init];
    if (self) {
      self.pageNumber = page;
    }
    return self;
}
@end
