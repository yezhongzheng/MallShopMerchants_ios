//
//  ComponentTools.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "ComponentTools.h"

@implementation ComponentTools

/**
 *font 字体
 *backgroundColor 背景颜色
 *textColor 文本颜色
 *numberOfLines 显示几行
 *textAlignment 对齐方式
 *text 显示文本
 */
+ (UILabel *)createLabelWithFont:(UIFont *)font
                 backgroundColor:(UIColor *)backgroundColor
                       textColor:(UIColor *)textColor
                   numberOfLines:(NSInteger)numberOfLines
                   textAlignment:(NSTextAlignment)textAlignment
                            text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.backgroundColor = backgroundColor;
    label.textColor = textColor;
    label.numberOfLines = numberOfLines;
    label.textAlignment = textAlignment;
    label.text = text;
    return label;
}

/**
 *font 字体
 *titleColor 文本颜色
 *title 标题
 */
+ (UIButton *)createButtonWithFont:(UIFont *)font
                        buttonType:(UIButtonType)buttonType
                        titleColor:(UIColor *)titleColor
                             title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

@end
