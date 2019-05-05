//
//  ComponentTools.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *该类是快速创建组件类
 */
NS_ASSUME_NONNULL_BEGIN

@interface ComponentTools : NSObject

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
                            text:(NSString *)text;

/**
 *font 字体
 *buttonType 按钮类型
 *titleColor 文本颜色
 *title 标题
 */
+ (UIButton *)createButtonWithFont:(UIFont *)font
                        buttonType:(UIButtonType)buttonType
                       titleColor:(UIColor *)titleColor
                             title:(NSString *)title;

/**
 *backgroundColor 背景色
 *
 */
+ (UIView *)createViewWithBackgroundColor:(UIColor *)backgroundColor;

@end

NS_ASSUME_NONNULL_END
