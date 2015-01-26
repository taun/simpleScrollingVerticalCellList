//
//  ViewController.m
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*!
 Show how to add scrollView insets so the Cells are not under a navBar or tabBar.
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat topInset = 60.0;
    CGFloat bottomInset = 60.0;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(topInset, 0, bottomInset, 0);
    
    self.scrollView.contentInset = edgeInsets;
    self.scrollView.scrollIndicatorInsets = edgeInsets;
}
/*!
 The controller needs to call setNeedsLayout directly to our UIScrollView SimpleVerticalCellLayout in the UIScrollView.
 */
-(void) viewWillLayoutSubviews {

    [self.simpleVerticalCellLayout setNeedsLayout];

    [super viewWillLayoutSubviews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
