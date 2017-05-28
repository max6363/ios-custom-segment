//
//  CustomSegment.h
//
//  Created by Minhaz Panara on 15/05/17.
//

#import <UIKit/UIKit.h>

@class CustomSegmentView;
@protocol CustomSegmentDelegate;

@interface CustomSegment : UIView

@property (nonatomic) id <CustomSegmentDelegate> delegate;
- (void)setSegments:(NSArray *)segments gap:(CGFloat)gap delegate:(id)delegate;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) UIColor *borderColor;

@end

@protocol CustomSegmentDelegate <NSObject>
@optional
- (void)customSegment:(CustomSegment *)customSegment didSelectSegmentView:(CustomSegmentView *)segment;

@end
