//
//  NSObject+AndyKeyValue.h
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/16.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AndyKeyValue)

+ (NSDictionary *)andy_replacedKeyFromPropertyName;

+ (NSDictionary *)andy_objectClassInArray;

+ (instancetype)andy_objectWithKeyValues:(NSDictionary *)keyValues;

+ (NSArray *)andy_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray;

@end
