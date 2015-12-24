//
//  BaseDataModel.m
//  Copyright © 2015年 jonle. All rights reserved.
//

#import "BaseDataModel.h"

@implementation BaseDataModel

+ (instancetype)dataModelWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dict {
    
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    [super setValue:value forUndefinedKey:key];
}

@end
