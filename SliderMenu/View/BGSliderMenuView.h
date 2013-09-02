//
//  BGSliderMonth.h
//  MyClap
//
//  Created by Bishal Ghimire on 8/25/13.
//  Copyright (c) 2013 MyCalpTV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGSliderMenuView;

@protocol BGSliderMenuViewDelegate

-(void) sliderMenuSelectedItem:(NSString *)itemName forTagNo:(int)tagNo;

@end

@interface BGSliderMenuView : UIView
<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *items;

@property (assign) id <BGSliderMenuViewDelegate> delegate;

@end
