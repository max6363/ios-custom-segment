//
//  ViewController.m
//  CustomSegmentDemo
//
//  Created by Minhaz on 28/05/17.
//  Copyright © 2017 minhaz. All rights reserved.
//

#import "ViewController.h"
#import "CustomSegment.h"
#import "CustomSegmentObject.h"

// Tags:
#define TAG_segment_time_modes                  1
#define TAG_segment_weight_unit_modes           2
#define TAG_segment_other_modes                 3

@interface ViewController () <CustomSegmentDelegate>
{
    __weak IBOutlet CustomSegment *customSegmentTimeModes;
    __weak IBOutlet CustomSegment *customSegmentWeightUnitModes;
    __weak IBOutlet CustomSegment *customSegmentOtherModes;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. set time mode segment
    [self setTimeModeSegment];
    
    // 2. set weight unit mode segment
    [self setWeightUnitModeSegment];
    
    // 3. set other segment
    [self setOtherModeSegment];
}

- (void)setTimeModeSegment
{
    customSegmentTimeModes.tag = TAG_segment_time_modes;
    customSegmentTimeModes.cornerRadius = customSegmentTimeModes.frame.size.height/2.0;
    [customSegmentTimeModes setSegments:[self getSegmentsTimeModes] gap:1 delegate:self];
}

- (void)setWeightUnitModeSegment
{
    customSegmentWeightUnitModes.tag = TAG_segment_weight_unit_modes;
    customSegmentWeightUnitModes.cornerRadius = 8.0;
    [customSegmentWeightUnitModes setSegments:[self getSegmentsUnitModes] gap:2.0 delegate:self];
}

- (void)setOtherModeSegment
{
    customSegmentOtherModes.tag = TAG_segment_other_modes;
    customSegmentOtherModes.cornerRadius = 4.0;
    customSegmentOtherModes.borderWidth = 1;
    customSegmentOtherModes.borderColor = [UIColor colorWithRed:21/255.0 green:125/255.0 blue:249/255.0 alpha:1];
    [customSegmentOtherModes setSegments:[self getOtherSegmentModes] gap:0.0 delegate:self];
}

#pragma mark - Segments
- (NSArray *)getSegmentsTimeModes
{
    UIColor *titleColorSelected = [UIColor whiteColor];
    UIColor *titleColorDeselected = [UIColor lightGrayColor];
    UIColor *bgColorSelected = [[UIColor purpleColor] colorWithAlphaComponent:0.8];
    UIColor *bgColorDeselected = [[UIColor lightGrayColor] colorWithAlphaComponent:0.40];
    UIColor *underlineColor = [[UIColor lightGrayColor] colorWithAlphaComponent:1.0];
    UIFont *titleFont = [UIFont boldSystemFontOfSize:15.0];
    CGFloat underlineWidth = 2.0;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    CustomSegmentObject *objDay = [CustomSegmentObject segmentWithTitle:@"Day"
                                                       titleColorSelected:titleColorSelected
                                                     titleColorDeselected:titleColorDeselected
                                                        deselectedBgColor:bgColorDeselected
                                                          selectedBgColor:bgColorSelected
                                                           underlineColor:underlineColor
                                                                titleFont:titleFont
                                                           underlineWidth:underlineWidth
                                                                    state:CustomSegmentObjectStateSelected
                                                          titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objWeek = [CustomSegmentObject segmentWithTitle:@"Week"
                                                     titleColorSelected:titleColorSelected
                                                   titleColorDeselected:titleColorDeselected
                                                      deselectedBgColor:bgColorDeselected
                                                        selectedBgColor:bgColorSelected
                                                         underlineColor:underlineColor
                                                              titleFont:titleFont
                                                         underlineWidth:underlineWidth
                                                                  state:CustomSegmentObjectStateDeselected
                                                        titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objMonth = [CustomSegmentObject segmentWithTitle:@"Month"
                                                      titleColorSelected:titleColorSelected
                                                    titleColorDeselected:titleColorDeselected
                                                       deselectedBgColor:bgColorDeselected
                                                         selectedBgColor:bgColorSelected
                                                          underlineColor:underlineColor
                                                               titleFont:titleFont
                                                          underlineWidth:underlineWidth
                                                                   state:CustomSegmentObjectStateDeselected
                                                         titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objYear = [CustomSegmentObject segmentWithTitle:@"Year"
                                                      titleColorSelected:titleColorSelected
                                                    titleColorDeselected:titleColorDeselected
                                                       deselectedBgColor:bgColorDeselected
                                                         selectedBgColor:bgColorSelected
                                                          underlineColor:underlineColor
                                                               titleFont:titleFont
                                                          underlineWidth:underlineWidth
                                                                   state:CustomSegmentObjectStateDeselected
                                                         titleEdgeInsets:edgeInsets];
    
    NSArray *items = @[objDay, objWeek, objMonth, objYear];
    return items;
}

- (NSArray *)getSegmentsUnitModes
{
    UIColor *titleColorSelected = [UIColor whiteColor];
    UIColor *titleColorDeselected = [UIColor lightGrayColor];
    UIColor *bgColorSelected = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    UIColor *bgColorDeselected = [[UIColor lightGrayColor] colorWithAlphaComponent:0.40];
    UIColor *underlineColor = [[UIColor lightGrayColor] colorWithAlphaComponent:1.0];
    UIFont *titleFont = [UIFont boldSystemFontOfSize:20.0];
    CGFloat underlineWidth = 2.0;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    CustomSegmentObject *objKg = [CustomSegmentObject segmentWithTitle:@"Kg"
                                                     titleColorSelected:titleColorSelected
                                                   titleColorDeselected:titleColorDeselected
                                                      deselectedBgColor:bgColorDeselected
                                                        selectedBgColor:bgColorSelected
                                                         underlineColor:underlineColor
                                                              titleFont:titleFont
                                                         underlineWidth:underlineWidth
                                                                  state:CustomSegmentObjectStateSelected
                                                        titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objLbs = [CustomSegmentObject segmentWithTitle:@"Lbs"
                                                      titleColorSelected:titleColorSelected
                                                    titleColorDeselected:titleColorDeselected
                                                       deselectedBgColor:bgColorDeselected
                                                         selectedBgColor:bgColorSelected
                                                          underlineColor:underlineColor
                                                               titleFont:titleFont
                                                          underlineWidth:underlineWidth
                                                                   state:CustomSegmentObjectStateDeselected
                                                         titleEdgeInsets:edgeInsets];
    
    NSArray *items = @[objKg, objLbs];
    return items;
}

// 21, 125, 249
- (NSArray *)getOtherSegmentModes
{
    UIColor *titleColorSelected = [UIColor whiteColor];
    UIColor *titleColorDeselected = [UIColor colorWithRed:21/255.0 green:125/255.0 blue:249/255.0 alpha:1];
    UIColor *bgColorSelected = [UIColor colorWithRed:21/255.0 green:125/255.0 blue:249/255.0 alpha:1];
    UIColor *bgColorDeselected = [UIColor whiteColor];
    UIColor *underlineColor = [UIColor clearColor];
    UIFont *titleFont = [UIFont systemFontOfSize:13.0];
    CGFloat underlineWidth = 0.0;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    CustomSegmentObject *objDetails = [CustomSegmentObject segmentWithTitle:@"Details"
                                                     titleColorSelected:titleColorSelected
                                                   titleColorDeselected:titleColorDeselected
                                                      deselectedBgColor:bgColorDeselected
                                                        selectedBgColor:bgColorSelected
                                                         underlineColor:underlineColor
                                                              titleFont:titleFont
                                                         underlineWidth:underlineWidth
                                                                  state:CustomSegmentObjectStateSelected
                                                        titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objReviews = [CustomSegmentObject segmentWithTitle:@"Reviews"
                                                      titleColorSelected:titleColorSelected
                                                    titleColorDeselected:titleColorDeselected
                                                       deselectedBgColor:bgColorDeselected
                                                         selectedBgColor:bgColorSelected
                                                          underlineColor:underlineColor
                                                               titleFont:titleFont
                                                          underlineWidth:underlineWidth
                                                                   state:CustomSegmentObjectStateDeselected
                                                         titleEdgeInsets:edgeInsets];
    
    CustomSegmentObject *objRelated = [CustomSegmentObject segmentWithTitle:@"Related"
                                                       titleColorSelected:titleColorSelected
                                                     titleColorDeselected:titleColorDeselected
                                                        deselectedBgColor:bgColorDeselected
                                                          selectedBgColor:bgColorSelected
                                                           underlineColor:underlineColor
                                                                titleFont:titleFont
                                                           underlineWidth:underlineWidth
                                                                    state:CustomSegmentObjectStateDeselected
                                                          titleEdgeInsets:edgeInsets];
    
    NSArray *items = @[objDetails, objReviews, objRelated];
    return items;
}

#pragma mark - CustomSegmentDelegate
- (void)customSegment:(CustomSegment *)customSegment didSelectSegmentView:(CustomSegmentView *)segment
{
    if (customSegment.tag == TAG_segment_time_modes) {
        NSLog(@"Selected time mode -> %@",segment.title);
    }
    else if (customSegment.tag == TAG_segment_weight_unit_modes) {
        NSLog(@"Selected weight unit mode -> %@",segment.title);
    }
}

#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
