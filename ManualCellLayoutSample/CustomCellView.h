//
//  CustomCellView.h
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellView : UIView

@property (nonatomic, assign) NSUInteger        textViewHeight;

@property (weak, nonatomic) IBOutlet UILabel    *textLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel    *textViewHeightValue;
- (IBAction)randomizeHeight:(id)sender;

@end
