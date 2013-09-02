//
//  BGViewController.m
//  SliderMenu
//
//  Created by Bishal Ghimire on 9/2/13.
//  Copyright (c) 2013 Bishal Ghimire. All rights reserved.
//

#import "BGViewController.h"
#import "BGSliderMenuView.h"
#import "BGAppDelegate.h"

@interface BGViewController ()

@property (nonatomic, strong) UILabel *labelMonth;
@property (nonatomic, strong) UILabel *labelWeek;
@property (nonatomic, strong) UILabel *labelDate;

@end

@implementation BGViewController

@synthesize labelDate;
@synthesize labelMonth;
@synthesize labelWeek;

#pragma mark - Delegates
#pragma mark Slider Menu Delegate

typedef NS_ENUM(NSUInteger, MenuType) {
    kMonthMenu = 1,
    kWeekMenu,
    kDateMenu
};

-(void) sliderMenuSelectedItem:(NSString *)itemName forTagNo:(int)tagNo {
    switch (tagNo) {
        case kMonthMenu:
            labelMonth.text = [NSString stringWithFormat:@"Month : %@", itemName];
            break;
            
        case kWeekMenu:
            labelWeek.text = [NSString stringWithFormat:@"Week : %@", itemName];
            break;
            
        case kDateMenu:
            labelDate.text = [NSString stringWithFormat:@"Date : %@", itemName];
            break;
            
        default:
            break;
    }
}

-(void) drawViews {
    NSArray *monthsName = @[@"janvier",@"février",@"mars",@"avril",@"mai",@"juin",@"juillet",@"août",@"septembre",@"octobre",@"novembre",@"décembre"];
    
    NSArray *daysName = @[@"lundi",@"mardi",@"mercredi",@"jeudi",@"vendredi",@"samedi",@"dimanche"];
    
    NSMutableArray *dateNumber = [[NSMutableArray alloc] initWithCapacity:35];
    for (int i = 1; i < 32; i++) {
        [dateNumber addObject:[NSNumber numberWithInt:i]];
    }
    
    BGSliderMenuView *sliderMonth = [[BGSliderMenuView alloc] initWithFrame:CGRectMake(0, 55, SCREEN_WIDTH, 55)];
    sliderMonth.items = monthsName;
    sliderMonth.tag = 1;
    sliderMonth.delegate = self;
    [self.view addSubview:sliderMonth];
    
    labelMonth = [[UILabel alloc] init];
    labelMonth.frame = CGRectMake(20, 260, 280, 20);
    labelMonth.textColor = [UIColor blackColor];
    labelMonth.text = @"Month ";
    [self.view addSubview:labelMonth];
    
    BGSliderMenuView *sliderWeek = [[BGSliderMenuView alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 55)];
    sliderWeek.items = daysName;
    sliderWeek.tag = 2;
    sliderWeek.delegate = self;
    [self.view addSubview:sliderWeek];
    
    labelWeek = [[UILabel alloc] init];
    labelWeek.frame = CGRectMake(20, 280, 280, 20);
    labelWeek.text = @"Week ";
    [self.view addSubview:labelWeek];
    
    BGSliderMenuView *sliderDate = [[BGSliderMenuView alloc] initWithFrame:CGRectMake(0, 190, SCREEN_WIDTH, 55)];
    sliderDate.items = dateNumber;
    sliderDate.tag = 3;
    sliderDate.delegate = self;
    [self.view addSubview:sliderDate];
    
    labelDate = [[UILabel alloc] init];
    labelDate.frame = CGRectMake(20, 300, 280, 20);
    labelDate.text = @"Date ";
    [self.view addSubview:labelDate];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
