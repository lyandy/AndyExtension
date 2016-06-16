//
//  NSObject+AndyKeyValue.m
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/16.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "NSObject+AndyKeyValue.h"
#import <objc/message.h>

@implementation NSObject (AndyKeyValue)

+ (instancetype)andy_objectWithKeyValues:(NSDictionary *)keyValues
{
    NSDictionary *dict = keyValues;
    
    id objc = [[self alloc] init];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0 ; i < count; i++) {
        // 获取成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员名
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];

        // 获取key
        NSString *key = [propertyName substringFromIndex:1];
        
        // 获取字典的value
        id value = dict[key];
        //如果value为nil的话，就去andy_replacedKeyFromPropertyName方法里找有没有实现对应的
        if (value == nil)
        {
            NSDictionary *replacedKeyDict = [self andy_replacedKeyFromPropertyName];
            if (replacedKeyDict != nil)
            {
                //找到已经被替换成了其他成员名称
                NSString *replacedKey = replacedKeyDict[key];
                if (replacedKey != nil)
                {
                    value = dict[replacedKey];
                }
                //如果发现为字典里没有替换key对应的replacedKey，则抛弃此成员的解析
                else{}
            }
            //如果发现没有实现andy_replacedKeyFromPropertyName，则抛弃此成员的解析
            else{}
        }
        
        // 给模型的属性赋值
        // 成员属性类型
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // 值是字典,成员属性的类型不是字典,才需要转换成模型
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) {
            // 需字典转换成模型
            // 转换成哪个类型
            // 字符串截取
            NSRange range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.location + range.length];
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:range.location];
            
            // 获取需要转换类的类对象
            Class modelClass =  NSClassFromString(propertyType);
            
            if (modelClass) {
                value =  [modelClass andy_objectWithKeyValues:value];
            }
        }
        //值是数组
        else if ([value isKindOfClass:[NSArray class]])
        {
            //如果已经andy_objectClassInArray方法，指定数据里的数据类型
            NSDictionary *replacedArrayModelDict = [self andy_objectClassInArray];
            if (replacedArrayModelDict != nil)
            {
                Class replacedModelClass = replacedArrayModelDict[key];

                //如果找到 数据 里的数据模型类型
                if (replacedModelClass != nil)
                {
                    NSArray * tempValue = [replacedModelClass andy_objectArrayWithKeyValuesArray:value];
                    if (tempValue != nil)
                    {
                        value = tempValue;
                    }
                }
            }
        }
        
        if (value) {
            // KVC赋值:不能传空. 万一出现空值则有杜蕾斯拦截错误，不会崩溃
            [objc setValue:value forKey:key];
        }
    }
    
    return objc;

}

+ (NSArray *)andy_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray
{
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSDictionary *modelDict in keyValuesArray) {
        [arrM addObject:[self andy_objectWithKeyValues:modelDict]];
    };
    
    if (arrM.count == 0)
    {
        return nil;
    }
    else
    {
        return [arrM copy];
    }
}

@end
