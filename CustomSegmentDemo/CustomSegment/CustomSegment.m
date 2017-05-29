//
//  CustomSegment.m
//
//  Created by Minhaz Panara on 15/05/17.
//  Copyright © 2017 minhaz. All rights reserved.
//

#import "CustomSegment.h"
#import "CustomSegmentObject.h"

@interface CustomSegment () <CustomSegmentViewDelegate>
{
    NSMutableArray *arrSegments;
}
@end

@implementation CustomSegment

- (void)awakeFromNib
{
    [super awakeFromNib];
    arrSegments = [NSMutableArray array];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self updateBorder];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    [self updateBorder];
}

- (void)updateBorder
{
    if (_borderColor != nil) {
        self.layer.borderColor = _borderColor.CGColor;
        self.layer.borderWidth = _borderWidth;
    } else {
        self.layer.borderWidth = 0.0;
    }
}

- (void)setSegments:(NSArray *)segments gap:(CGFloat)gap delegate:(id)delegate
{
    if (!segments || segments.count == 0) {
        NSLog(@"No segments");
        assert(false);
        return;
    }
    
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds = YES;
    
    [arrSegments makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [arrSegments removeAllObjects];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = (self.frame.size.width - (segments.count - 1) * gap) / segments.count;
    CGFloat height = self.frame.size.height;
    
    for (CustomSegmentObject *object in segments) {
        
        CGRect f = CGRectMake(x, y, width, height);
        CustomSegmentView *view = [[CustomSegmentView alloc] initWithFrame:f
                                                                     title:object.title
                                                        titleColorSelected:object.titleColorSelected
                                                      titleColorDeselected:object.titleColorDeselected
                                                         deselectedBgColor:object.deselectedBgColor
                                                           selectedBgColor:object.selectedBgColor
                                                            underlineColor:object.underlineColor
                                                                 titleFont:object.titleFont
                                                            underlineWidth:object.underlineWidth
                                                                     state:object.state
                                                           titleEdgeInsets:object.titleEdgeInsets];
        view.delegate = self;
        if (_borderColor != nil) {
            view.layer.borderColor = _borderColor.CGColor;
            view.layer.borderWidth = _borderWidth/2.0;
        } else {
            view.layer.borderWidth = 0.0;
        }

        [self addSubview:view];
        [arrSegments addObject:view];
        
        x = x + width + gap;
    }
    
    _delegate = delegate;
}

#pragma mark - Update buttons
- (void)updateButtonsWithSelectedButton:(CustomSegmentView *)selectedButton
{
    for (CustomSegmentView *btn in arrSegments) {
        if (btn == selectedButton) {
            btn.state = CustomSegmentObjectStateSelected;
        } else {
            btn.state = CustomSegmentObjectStateDeselected;
        }
    }
}

#pragma mark - CustomSegmentViewDelegate
- (void)customSegmentView:(CustomSegmentView *)view didSelectWithState:(CustomSegmentObjectState)state
{
    // update buttons
    [self updateButtonsWithSelectedButton:view];
    
    // send callback to delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(customSegment:didSelectSegmentView:)]) {
        [self.delegate customSegment:self didSelectSegmentView:view];
    }
}

@end
