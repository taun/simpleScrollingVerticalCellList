//
//  SimpleVerticalCellLayout.h
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomCellView.h"


/*!
 Simple class to layout the numberOfCells vertically with the rowSpacing between each cell. Perhaps a future version will incorporate a demo model.
 
 In MVC, this class would be associated with a model class which has a array property to be displayed. Each property 
 in the array corresponding to model to be displayed by a cell.
 */
@interface SimpleVerticalCellLayout : UIView

@property (nonatomic,assign) NSUInteger                     numberOfCells;

@property (nonatomic,assign) CGFloat                        rowSpacing;

@end
