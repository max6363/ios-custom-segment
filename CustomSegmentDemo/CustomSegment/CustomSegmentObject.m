//
//  CustomSegmentObject.m
//
//  Created by Minhaz Panara on 15/05/17.
//  Copyright © 2017 minhaz. All rights reserved.
//

#import "CustomSegmentObject.h"

@implementation CustomSegmentObject

+ (CustomSegmentObject *)segmentWithTitle:(NSString *)title
                     titleColorSelected:(UIColor *)titleColorSelected
                   titleColorDeselected:(UIColor *)titleColorDeselected
                      deselectedBgColor:(UIColor *)deselectedBgColor
                        selectedBgColor:(UIColor *)selectedBgColor
                         underlineColor:(UIColor *)underlineColor
                              titleFont:(UIFont *)titleFont
                         underlineWidth:(CGFloat)underlineWidth
                                  state:(CustomSegmentObjectState)state
                          titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
    CustomSegmentObject *obj = [[CustomSegmentObject alloc] init];
    obj.title = title;
    obj.titleColorSelected = titleColorSelected;
    obj.titleColorDeselected = titleColorDeselected;
    obj.deselectedBgColor = deselectedBgColor;
    obj.selectedBgColor = selectedBgColor;
    obj.underlineColor = underlineColor;
    obj.titleFont = titleFont;
    obj.underlineWidth = underlineWidth;
    obj.state = state;
    obj.titleEdgeInsets = titleEdgeInsets;
    return obj;
}

@end
