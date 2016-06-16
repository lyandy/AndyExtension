//
//  Status.h
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/15.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface Status : NSObject

@property (nonatomic, assign) NSInteger ID;
// 解析字典自动生成属性代码
@property (nonatomic, strong) NSString *source;

@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, strong) NSArray *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) int attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) int comments_count;

@property (nonatomic, strong) User *user;

@property (nonatomic, strong) NSDictionary *retweeted_status;

@end
