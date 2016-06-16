//
//  Status.m
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/15.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "Status.h"
#import "PicUrls.h"

@implementation Status

+ (NSDictionary *)andy_objectClassInArray
{
    return @{@"pic_urls" : [PicUrls class]};
}

@end
