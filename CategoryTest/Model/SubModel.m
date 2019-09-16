//
//  SubModel.m
//  CategoryTest
//
//  Created by 刘艳芹 on 2019/5/23.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "SubModel.h"

@implementation SubModel
+(void)load{
    NSLog(@"%s",__func__);
    [FatherModel swizzleInstanceMethod:@selector(printLog) withMethod:@selector(hookPrintLog)];
}

-(void)hookPrintLog{
    NSLog(@"%s",__func__);
}

-(void)overwriteOriginalMethod{
    NSLog(@"%s",__func__);
}
@end
