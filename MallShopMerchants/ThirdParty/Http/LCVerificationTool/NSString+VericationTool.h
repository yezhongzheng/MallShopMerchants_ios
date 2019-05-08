//
//  NSString+VericationTool.h
//  LCFoundationLib
//
//  Created by HuZeSen on 15/7/27.
//  Copyright (c) 2015年 GZLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VericationTool)

/**
 *  验证字符串是否为空
 *  
 *  @warning 空格字符串会被认为是空字符串
 *
 *  @param string 目标字符串
 *
 */
- (BOOL)isEmptyOrNull;

/**
 验证字符串是否为空,包括nil

 @param string 待验证字符串
 @return YES代表是空
 */
+ (BOOL)isEmptyString:(NSString *)string;

/**
 *  验证是否为有效邮箱
 */
- (BOOL)isValidateEmail;

/**
 *  验证是否为有效手机号码
 */
- (BOOL)isMobileNumber;

/**
 *  验证是否为有效身份证号码
 */
- (BOOL)isIdCard;

/**
 *  验证是否为纯数字
 */
- (BOOL)isAllNum;

/**
 *  判断名字
 */
-(BOOL)isNameValid:(NSString *)name;
@end
