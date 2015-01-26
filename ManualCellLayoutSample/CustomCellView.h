//
//  CustomCellView.h
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 A custom cell to be used in the SimpleVerticalCellLayout.
 
 In MVC, the cell would be associated with a model to display the model properties.
 
 The layout of the cell is done visually in the CustomCellView.xib. Note the width is free flowing but the height is fully specified. However,
 the textView height constraint is flagged to be removed at runtime so it can be replaced with the coded constraint. The constraint could be left 
 as a minimum default and set to a low priority.
 */
@interface CustomCellView : UIView

@property (nonatomic, assign) NSUInteger        textViewHeight;

@property (weak, nonatomic) IBOutlet UILabel    *textLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel    *textViewHeightValue;

- (IBAction)randomizeHeight:(id)sender;

@end
