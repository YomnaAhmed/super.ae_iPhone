//
//  PageControlViewController.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/20/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlViewController : UIViewController{

   
   NSArray *pagesArray;

}
@property (nonatomic,strong) IBOutlet UILabel *pageNumberLabel;
@property (nonatomic,assign) int pageNumber;

- (id)initWithPageNumber:(int)page;
- (UIColor *)pageControlColorWithIndex:(int)index;
@end
