//
//  SimpleVerticalCellLayout.h
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomCellView.h"



@interface SimpleVerticalCellLayout : UIView

@property (nonatomic,assign) NSUInteger                     numberOfCells;

@property (nonatomic,assign) CGFloat          rowSpacing;

@end
