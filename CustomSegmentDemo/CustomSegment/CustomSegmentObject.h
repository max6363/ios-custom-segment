//
//  CustomSegmentObject.h
//
//  Created by Minhaz Panara on 15/05/17.
//

#import <Foundation/Foundation.h>
#import "CustomSegmentView.h"

@interface CustomSegmentObject : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) UIColor *titleColorSelected, *titleColorDeselected, *deselectedBgColor, *selectedBgColor, *underlineColor;
@property (nonatomic) UIFont *titleFont;
@property (nonatomic) CGFloat underlineWidth;
@property (nonatomic, readwrite) CustomSegmentObjectState state;
@property (nonatomic) UIEdgeInsets titleEdgeInsets;

+ (CustomSegmentObject *)segmentWithTitle:(NSString *)title
                     titleColorSelected:(UIColor *)titleColorSelected
                   titleColorDeselected:(UIColor *)titleColorDeselected
                      deselectedBgColor:(UIColor *)deselectedBgColor
                        selectedBgColor:(UIColor *)selectedBgColor
                         underlineColor:(UIColor *)underlineColor
                              titleFont:(UIFont *)titleFont
                         underlineWidth:(CGFloat)underlineWidth
                                  state:(CustomSegmentObjectState)state
                          titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;

@end

