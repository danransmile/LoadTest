//
//  Model+one.m
//  CategoryTest
//
//  Created by 刘艳芹 on 2019/5/23.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "Model+one.h"

@implementation FatherModel (one)
@dynamic string;
static char stringLength;
+(void)load{
    NSLog(@"%s",__func__);
    
    
    [FatherModel swizzleInstanceMethod:@selector(printLog) withMethod:@selector(hookPrintLog)];
    
    
}

-(NSString *)string{
    return objc_getAssociatedObject(self, &stringLength);
}

-(void)setString:(NSString *)string{
    objc_setAssociatedObject(self, &stringLength, string, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)hookPrintLog{
    NSLog(@"%s",__func__);
}

-(void)overwriteOriginalMethod{
    NSLog(@"%s",__func__);
}
@end
