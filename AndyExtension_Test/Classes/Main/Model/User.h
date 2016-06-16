//
//  User.h
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/15.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *profile_image_url;

@property (nonatomic, assign) BOOL vip;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) int mbrank;

@property (nonatomic, assign) int mbtype;

@end
