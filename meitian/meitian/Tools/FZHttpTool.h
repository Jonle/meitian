//
//  FZHttpTool.h
//  meitian
//
//  Created by Jonle on 15/12/24.
//  Copyright © 2015年 jonle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZHttpTool : NSObject

- (void)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
