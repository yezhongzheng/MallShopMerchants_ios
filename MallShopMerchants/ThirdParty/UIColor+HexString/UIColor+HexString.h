//
//  UIColor+HexString.h
//
//  Created by Micah Hainline
//  http://stackoverflow.com/users/590840/micah-hainline
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  将颜色转换成 HEX 字符串
 */
+ (NSString *)hexFromUIColor: (UIColor*) color;

/**
 *  将 16进制 颜色换成 UIColor
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue;

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;


@end
