//
//  CustomCellView.m
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "CustomCellView.h"

@interface CustomCellView ()

@property (nonatomic,strong) NSLayoutConstraint     *textViewHeightConstraint;

@end

@implementation CustomCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setupDefaults];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupDefaults];
    }
    return self;
}

-(void) setupDefaults {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _textView.translatesAutoresizingMaskIntoConstraints = NO;
    _textViewHeight = 98;
    
}

/*!
 We replace add the missing textView height constraint here and save it as a property for future changes to the height.
 */
-(void)awakeFromNib {
    _textViewHeightConstraint = [NSLayoutConstraint constraintWithItem: self.textView
                                                             attribute: NSLayoutAttributeHeight
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier: 1.0
                                                              constant: (CGFloat)_textViewHeight];
    [self addConstraint: _textViewHeightConstraint];
}

-(void) setTextViewHeight:(NSUInteger)textViewHeight {
    _textViewHeight = textViewHeight;
    
    self.textViewHeightValue.text = [NSString stringWithFormat: @"%lu", _textViewHeight];
    [self setNeedsLayout];
}

-(void) updateConstraints {
    
    [self updateHeightConstraint];
    
    [super updateConstraints];
    
}

-(void) updateHeightConstraint {
    self.textViewHeightConstraint.constant = (CGFloat)self.textViewHeight;
}
/*!
 Example of animating a change in a constraint.
 */
-(void) animateConstraintChanges {
    [self layoutIfNeeded]; // Ensures that all pending layout operations have been completed
    [UIView animateWithDuration: 1.5 animations:^{
        // Make all constraint changes here
        
        [self updateHeightConstraint];
        
        [self layoutIfNeeded]; // Forces the layout of the subtree animation block and then captures all of the frame changes
    }];
}

- (IBAction)randomizeHeight:(id)sender {
    self.textViewHeight = (NSUInteger)(70.0 + rand() % 130);
    [self animateConstraintChanges];
}
@end
