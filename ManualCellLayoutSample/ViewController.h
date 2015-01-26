//
//  ViewController.h
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleVerticalCellLayout.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView               *scrollView;
@property (weak, nonatomic) IBOutlet SimpleVerticalCellLayout   *simpleVerticalCellLayout;

@end

