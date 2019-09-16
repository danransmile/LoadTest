//
//  NSObject+Swizzle.m
//  GALibrary
//
//  Created by liuyanqin on 16/7/15.
//  Copyright © 2016年 途家. All rights reserved.
//

#import "NSObject+Swizzle.h"

#pragma mark NSObject Swizzle

@implementation NSObject (Swizzle)

+ (void)swizzleClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector
{
    Class cls = [self class];
    
    Method originalMethod = class_getClassMethod(cls, originalSelector);
    Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    
    Class metacls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    if (class_addMethod(metacls,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /*swizzing super class instance method, added if not exist */
        class_replaceMethod(metacls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)swizzleInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector
{
    [NSObject swizzleInstanceMethod:[self class] originalSelector:originalSelector withMethod:swizzledSelector];
}

+ (void)swizzleInstanceMethod:(Class)swizzleClass originalSelector:(SEL)originalSelector withMethod:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(swizzleClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzleClass, swizzledSelector);
    
    if (class_addMethod(swizzleClass,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /*swizzing super class instance method, added if not exist */
        class_replaceMethod(swizzleClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
