//
//  SimpleVerticalCellLayout.m
//  ManualCellLayoutSample
//
//  Created by Taun Chapman on 01/26/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "SimpleVerticalCellLayout.h"
#import "NSLayoutConstraint+MDBAddons.h"

@interface SimpleVerticalCellLayout ()
/*!
 The views lastBounds is saved so we know if the view has change due to window resizing or other changes. 
 This is critical. The view almost always changes size when first loading and changes to this property is what triggers the fresh layout.
 */
@property (nonatomic,assign) CGRect                         lastBounds;
@end


@implementation SimpleVerticalCellLayout

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupDefaults];
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupDefaults];
        [self setupSubviews];
    }
    return self;
}

-(void) setupDefaults {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    _rowSpacing = 10.0;
    _numberOfCells = 5;
    
}

-(void) setupSubviews {
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    UINib* customNib = [UINib nibWithNibName: @"CustomCellView" bundle: [NSBundle mainBundle]];

    
    for (int i=0; i < _numberOfCells; i++) {
    
        NSArray* objectArray = [customNib instantiateWithOwner: self options: nil];

        CustomCellView* newCell = objectArray[0];
        NSUInteger randomHeight = rand() % 100;
        newCell.textViewHeight = newCell.textViewHeight + randomHeight;
        
        [self addSubview: newCell];
    }
    
    [self setNeedsUpdateConstraints];
}
/*!
 This assumes the only subviews are cells. For more complicated scenarios, one would need a separate property to track the cells
 and perhaps associate them to the model property being listed.
 */
-(void) updateConstraints {
    if (self.subviews.count > 0) {
        [self removeConstraints: self.constraints];
        
        self.lastBounds = self.bounds;
        
        for (UIView* view in self.subviews) {
            //
            NSDictionary* viewsDictionary = NSDictionaryOfVariableBindings(view);
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options: 0 metrics: 0 views: viewsDictionary]];
        }
        
        [self addConstraints: [NSLayoutConstraint constraintsForFlowing: self.subviews
                                                       inContainingView: self
                                                         forOrientation: UILayoutConstraintAxisVertical
                                                            withSpacing: self.rowSpacing]];
        
    }
    
    [super updateConstraints];
}
/*!
 Critical to the working of this technique. We need to trigger layoutSubviews but only if there has been a change to require a new layout. In this case,
 the change is the view bounds. This allows a recursive call of layoutSubviews until the bounds stops changing and we have a stable solution.
 */
-(void) layoutSubviews {
    [super layoutSubviews];
    
    if (!CGRectEqualToRect(self.bounds, self.lastBounds)) {
        //
        [self setNeedsUpdateConstraints];
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
    
}

@end
