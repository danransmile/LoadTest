//
//  NSObject+Swizzle.h
//  GALibrary
//
//  Created by liuyanqin on 16/7/15.
//  Copyright © 2016年 途家. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kNSSafeExceptionNotification @"kNSSafeExceptionNotification"

@interface NSObject (Swizzle)

/*!
 *  @brief 替换静态方法
 *
 *  @param originalSelector 原方法
 *  @param swizzledSelector 新方法
 */
+ (void)swizzleClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

/*!
 *  @brief 替换内部方法
 *
 *  @param originalSelector 原方法
 *  @param swizzledSelector 新方法
 */
- (void)swizzleInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

+ (void)swizzleInstanceMethod:(Class)swizzleClass originalSelector:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
