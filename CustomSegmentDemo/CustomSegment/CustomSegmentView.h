//
//  CustomSegmentView.h
//
//  Created by Minhaz Panara on 16/05/17.
//  Copyright © 2017 minhaz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomSegmentObjectState) {
    CustomSegmentObjectStateDeselected = 0,
    CustomSegmentObjectStateSelected = 1,
};

@protocol CustomSegmentViewDelegate;

@interface CustomSegmentView : UIView

@property (nonatomic) NSString *title;
@property (nonatomic) UIColor *titleColorSelected, *titleColorDeselected, *deselectedBgColor, *selectedBgColor, *underlineColor;
@property (nonatomic) UIFont *titleFont;
@property (nonatomic) CGFloat underlineWidth;
@property (nonatomic) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, readwrite) CustomSegmentObjectState state;

@property (nonatomic) id <CustomSegmentViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title titleColorSelected:(UIColor *)titleColorSelected titleColorDeselected:(UIColor *)titleColorDeselected deselectedBgColor:(UIColor *)deselectedBgColor selectedBgColor:(UIColor *)selectedBgColor underlineColor:(UIColor *)underlineColor titleFont:(UIFont *)titleFont underlineWidth:(CGFloat)underlineWidth state:(CustomSegmentObjectState)state titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;

@end

@protocol CustomSegmentViewDelegate <NSObject>

@optional
- (void)customSegmentView:(CustomSegmentView *)view didSelectWithState:(CustomSegmentObjectState)state;

@end
