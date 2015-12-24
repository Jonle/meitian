//
//  BaseDataModel.h
//
//  Copyright © 2015年 jonle. All rights reserved.

// 用于模型建立的基类(父类)

#import <Foundation/Foundation.h>

@interface BaseDataModel : NSObject

/** 类方法: 传进字典返回模型数据-(usePrefix-dataModel) */
+ (instancetype)dataModelWithDictionary:(NSDictionary *)dict;

/** 类方法: 传进字典返回模型数据--(usePrefix-model)*/
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

/** 传进字典返回模型数据 */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
