//
//  OrderOptionView.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "OrderOptionView.h"

@interface OrderOptionView ()

@property (nonatomic, strong) UIView *underLine;

@end

@implementation OrderOptionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self addSubview:self.underLine];
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(16)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"000000"] forState:UIControlStateSelected];
        button.tag = 100 + i;
        CGFloat heigth = kSixScreen(16);
        CGFloat width = kScreenWidth / titles.count;
        CGFloat x = width * i;
        CGFloat y = kSixScreen(9);
        [button setFrame:CGRectMake(x, y, width, heigth)];
        if (i == 0) {
            button.selected = YES;
            NSDictionary *attributedString = @{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(16)]};
            CGFloat lineWidth = [titles[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, heigth) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributedString context:NULL].size.width;
            [self.underLine setFrame:CGRectMake((width - lineWidth) / 2.0, self.bounds.size.height - kSixScreen(2), lineWidth, kSixScreen(2))];
        } else {
            button.selected = NO;
        }
        [button addTarget:self action:@selector(itemButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
}

- (void)itemButtonDidClick:(UIButton *)sender
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            button.selected = NO;
        }
    }
    sender.selected = YES;
    NSInteger tag = sender.tag - 100;
    CGFloat buttonWidth = kScreenWidth / _titles.count;
    NSDictionary *attributedString = @{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(16)]};
    CGFloat lineWidth = [_titles[tag] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, kSixScreen(16)) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributedString context:NULL].size.width;
    [UIView animateWithDuration:.25f animations:^{
        [self.underLine setFrame:CGRectMake((buttonWidth - lineWidth) / 2.0 + buttonWidth * tag, self.bounds.size.height - kSixScreen(2), lineWidth, kSixScreen(2))];
    }];
    if (self.DidSelectIndexBlock) {
        self.DidSelectIndexBlock(tag);
    }
}

- (void)orderOptionViewScrollToButtonIndex:(int)index
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            button.selected = NO;
        }
    }
    UIButton *button = (UIButton *)[self viewWithTag:index + 100];
    button.selected = YES;
    CGFloat buttonWidth = kScreenWidth / _titles.count;
    NSDictionary *attributedString = @{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(16)]};
    CGFloat lineWidth = [_titles[index] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, kSixScreen(16)) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributedString context:NULL].size.width;
    [UIView animateWithDuration:.25f animations:^{
        [self.underLine setFrame:CGRectMake((buttonWidth - lineWidth) / 2.0 + buttonWidth * index, self.bounds.size.height - kSixScreen(2), lineWidth, kSixScreen(2))];
    }];
}

#pragma mark - Lazy
- (UIView *)underLine
{
    if (!_underLine) {
        self.underLine = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"00C968"]];
    }
    return _underLine;
}

@end
