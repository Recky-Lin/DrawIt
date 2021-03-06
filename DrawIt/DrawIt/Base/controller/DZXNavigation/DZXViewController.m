//
//  DZXViewController.m
//  DZXNavigationController
//
//  Created by Kenway on 15/12/21.
//  Copyright © 2015年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEVICE_5S 320
#define DEVICE_6 375
#define DEVICE_6P 414
#define DEFAULT_NAVIGATIONCOLOR [UIColor colorWithRed:0.0/255.0 green:174.0/255.0 blue:242.0/255.0 alpha:1.0f]

@implementation DZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //边缘不留白
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationAlphaValue = 1;
    [self createNavigationViewDependDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建导航栏视图
- (void)createNavigationViewDependDevice{
    //初始化navigationView并添加
    self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.navigationView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yw_nav_bar_bg"]];
    
    
    [self.view addSubview:self.navigationView];
}

#pragma mark - 改变导航栏背景透明度
- (void)setNavigationAlpha:(CGFloat)navigationAlpha{
    self.navigationAlphaValue = navigationAlpha;
    self.navigationView.backgroundColor = [self.navigationView.backgroundColor colorWithAlphaComponent:navigationAlpha];
}

#pragma mark - 改变导航栏颜色
- (void)setNavigationBackgroundColor:(UIColor *)navigationBackgroundColor{
    self.navigationView.backgroundColor = navigationBackgroundColor;
}

#pragma mark - 设置导航栏标题
- (void)setNavigationTitle:(NSString *)navigationTitle{
    //    根据文本计算宽度
    CGSize labelSize = [navigationTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0f]}];
    
    //初始化labelTitle并调整位置
    if (labelSize.width > SCREEN_WIDTH) {
        labelSize.width = SCREEN_WIDTH;
    }
    
    if (_labelTitle) {
        [_labelTitle removeFromSuperview];
    }
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, 42)];
    CGPoint center = self.navigationView.center;
    center.y = center.y + 8;
    _labelTitle.center = center;
    
    //文字基本设置
    _labelTitle.textColor = DIColorWhite;
    _labelTitle.numberOfLines = 1;
    _labelTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    _labelTitle.font = [UIFont systemFontOfSize:18.0f];
    _labelTitle.text = navigationTitle;
    [self.navigationView addSubview:_labelTitle];
}

#pragma mark - 自定义导航栏标题位置视图
- (void)setNavigationTitleView:(UIControl *)navigationTitleView{
    CGPoint titleView;
    titleView.x = SCREEN_WIDTH / 2;
    titleView.y = self.navigationView.frame.size.height / 2 + 7;
    navigationTitleView.center = titleView;
    
    [self.navigationView addSubview:navigationTitleView];
}

#pragma mark - 添加导航栏左侧按钮
- (void)setNavigationLeftButton:(UIButton *)navigationLeftButton{
    [_navigationLeftButton removeFromSuperview];
    //判断是文字按钮还是图片按钮，两者坐标稍有不同
    CGFloat leftButtonWidth = navigationLeftButton.frame.size.width;
    CGFloat leftButtonHeight = navigationLeftButton.frame.size.height;
    
    navigationLeftButton.frame = CGRectMake(10, self.navigationView.frame.size.height / 2 - 8, leftButtonWidth, leftButtonHeight);
    _navigationLeftButton = navigationLeftButton;
    [self.navigationView addSubview:_navigationLeftButton];
}

#pragma mark - 添加导航栏右侧按钮
- (void)setNavigationRightButton:(UIButton *)navigationRightButton{
    //同上
    [_navigationRightButton removeFromSuperview];
    CGFloat rightButtonWidth = navigationRightButton.frame.size.width;
    CGFloat rightButtonHeight = navigationRightButton.frame.size.height;
    
    navigationRightButton.frame = CGRectMake(SCREEN_WIDTH - navigationRightButton.frame.size.width - 10, self.navigationView.frame.size.height / 2 - 8, rightButtonWidth, rightButtonHeight);
    _navigationRightButton = navigationRightButton;
    [self.navigationView addSubview:_navigationRightButton];
}

#pragma mark - 添加导航栏左侧按钮集合
- (void)setNavigationLeftButtons:(NSArray<UIButton *> *)navigationLeftButtons{
    CGFloat firstLeftButtonWidth = navigationLeftButtons[0].frame.size.width;
    CGFloat firstLeftButtonHeight = navigationLeftButtons[0].frame.size.height;
    
    CGFloat secondLeftButtonWidth = navigationLeftButtons[1].frame.size.width;
    CGFloat secondLeftButtonHeight = navigationLeftButtons[1].frame.size.height;
    
    navigationLeftButtons[0].frame = CGRectMake(10, self.navigationView.frame.size.height / 2 - 8, firstLeftButtonWidth, firstLeftButtonHeight);
    navigationLeftButtons[1].frame = CGRectMake(10 + firstLeftButtonWidth + 8, self.navigationView.frame.size.height / 2 - 8, secondLeftButtonWidth, secondLeftButtonHeight);
    //8为两个按钮之间的间隔
    
    [self.navigationView addSubview:navigationLeftButtons[0]];
    [self.navigationView addSubview:navigationLeftButtons[1]];
}

#pragma mark - 添加导航栏右侧按钮集合
- (void)setNavigationRightButtons:(NSArray<UIButton *> *)navigationRightButtons{
    CGFloat firstRightButtonWidth = navigationRightButtons[0].frame.size.width;
    CGFloat firstRightButtonHeight = navigationRightButtons[0].frame.size.height;
    
    CGFloat secondRightButtonWidth = navigationRightButtons[1].frame.size.width;
    CGFloat secondRightButtonHeight = navigationRightButtons[1].frame.size.height;
    
    navigationRightButtons[0].frame = CGRectMake(SCREEN_WIDTH - 10 - firstRightButtonWidth, self.navigationView.frame.size.height / 2 - 8, firstRightButtonWidth, firstRightButtonHeight);
    navigationRightButtons[1].frame = CGRectMake(SCREEN_WIDTH - 10 - firstRightButtonWidth - 8 - secondRightButtonWidth, self.navigationView.frame.size.height / 2 - 8, secondRightButtonWidth, secondRightButtonHeight);
    //8为两个按钮之间的间隔
    
    [self.navigationView addSubview:navigationRightButtons[0]];
    [self.navigationView addSubview:navigationRightButtons[1]];
}

@end
