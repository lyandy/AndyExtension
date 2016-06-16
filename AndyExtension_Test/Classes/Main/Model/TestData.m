//
//  TestData.m
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/15.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "TestData.h"
#import "Status.h"

@implementation TestData

+ (NSDictionary *)andy_objectClassInArray
{
    return @{@"just" : [Status class]};
}

+ (NSDictionary *)andy_replacedKeyFromPropertyName
{
    return @{@"good" : @"total_number", @"just" : @"statuses"};
}


@end
