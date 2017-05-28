//
//  CustomSegmentView.m
//
//  Created by Minhaz Panara on 16/05/17.
//

#import "CustomSegmentView.h"

@interface CustomSegmentView ()
{
    UIButton *btnSegment;
    UIView *viewUnderline;
}
@end

@implementation CustomSegmentView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title titleColorSelected:(UIColor *)titleColorSelected titleColorDeselected:(UIColor *)titleColorDeselected deselectedBgColor:(UIColor *)deselectedBgColor selectedBgColor:(UIColor *)selectedBgColor underlineColor:(UIColor *)underlineColor titleFont:(UIFont *)titleFont underlineWidth:(CGFloat)underlineWidth state:(CustomSegmentObjectState)state titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _title = title;
        _titleColorSelected = titleColorSelected;
        _titleColorDeselected = titleColorDeselected;
        _deselectedBgColor = deselectedBgColor;
        _selectedBgColor = selectedBgColor;
        _underlineColor = underlineColor;
        _titleFont = titleFont;
        _underlineWidth = underlineWidth;
        _state = state;
        _titleEdgeInsets = titleEdgeInsets;
        
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupViews];
}

- (void)setupViews
{
    if (!btnSegment) {
        btnSegment = [UIButton buttonWithType:UIButtonTypeCustom];
        btnSegment.frame = self.bounds;
        [self addSubview:btnSegment];
        [btnSegment addTarget:self action:@selector(onBtSegmentClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    btnSegment.contentEdgeInsets = _titleEdgeInsets;
    btnSegment.titleLabel.font = _titleFont;
    [btnSegment setTitle:_title forState:UIControlStateNormal];
    
    if (!viewUnderline) {
        CGRect frame = CGRectMake(0, self.frame.size.height - _underlineWidth, self.frame.size.width, _underlineWidth);
        viewUnderline = [[UIView alloc] initWithFrame:frame];
        [self addSubview:viewUnderline];
    }
    viewUnderline.backgroundColor = _underlineColor;
    
    if (_state == CustomSegmentObjectStateDeselected) {
        [btnSegment setTitleColor:_titleColorDeselected forState:UIControlStateNormal];
        self.backgroundColor = _deselectedBgColor;
        viewUnderline.hidden = NO;
    } else {
        [btnSegment setTitleColor:_titleColorSelected forState:UIControlStateNormal];
        self.backgroundColor = _selectedBgColor;
        viewUnderline.hidden = YES;
    }
    
}

- (void)setState:(CustomSegmentObjectState)state
{
    _state = state;
    [self setupViews];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
    _titleEdgeInsets = titleEdgeInsets;
    [self setupViews];
}

#pragma mark - Button Action
- (void)onBtSegmentClicked:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(customSegmentView:didSelectWithState:)]) {
        [self.delegate customSegmentView:self didSelectWithState:self.state];
    }
}


@end
