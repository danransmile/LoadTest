//
//  Model.m
//  CategoryTest
//
//  Created by 刘艳芹 on 2019/5/23.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "FatherModel.h"

@implementation FatherModel
+(void)load{
    NSLog(@"%s",__func__);
    [FatherModel swizzleInstanceMethod:@selector(printLog) withMethod:@selector(hookPrintLog)];
}

-(void)printLog{
    NSLog(@"%s",__func__);
}

-(void)hookPrintLog{
    NSLog(@"%s",__func__);
}

-(void)overwriteOriginalMethod{
    NSLog(@"%s",__func__);
}

@end
