SliderMenu
==========

Slide Menu using UIScrollView For iOS Universal App using View Class Example

![Alt text](http://i4.photobucket.com/albums/y118/Bishal/GitHub/ScreenShot2013-09-02at82910PM.png "Slider Menu")


```  objective-c
#define kBUTTON_WIDTH 90
#define kBUTTON_HEIGHT 55

-(void) btnAction:(UIButton *) button {
    for (int k = 1; k < [items count] + 1; k ++) {
        UIView *buttonAll =(UIView*)[mainScrollView viewWithTag:k];
        buttonAll.backgroundColor = [UIColor grayColor];
    }
    
    selectedMonth = button.tag;
    button.backgroundColor = [UIColor blueColor];
    
    [self.delegate sliderMenuSelectedItem:items[button.tag-1] forTagNo:self.tag];
}

-(void) baseInit {
    mainScrollView = [[UIScrollView alloc] init];
    mainScrollView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, kBUTTON_HEIGHT);
    // mainScrollView.bounces = NO;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    
    int i = 0;
    for (i = 1; i < [items count] + 1; i ++) {
        UIButton *buttonItem = [[UIButton alloc] init];
        [buttonItem setTitle:[NSString stringWithFormat:@"%@", items[i-1]] forState:UIControlStateNormal];
        buttonItem.backgroundColor = [UIColor grayColor];
        buttonItem.frame = CGRectMake((kBUTTON_WIDTH+2) * (i-1) , 0, kBUTTON_WIDTH, kBUTTON_HEIGHT);
        buttonItem.tag = i;
        [buttonItem addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [mainScrollView addSubview:buttonItem];
    }
    
    mainScrollView.contentSize = CGSizeMake((kBUTTON_WIDTH+2) * (i-1), 55);
    mainScrollView.backgroundColor = [UIColor yellowColor];
    [self addSubview:mainScrollView];
}
