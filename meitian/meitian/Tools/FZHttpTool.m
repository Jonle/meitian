//
//  FZHttpTool.m
//  meitian
//
//  Created by Jonle on 15/12/24.
//  Copyright © 2015年 jonle. All rights reserved.
//

#import "FZHttpTool.h"
#import "AFNetworking.h"

@implementation FZHttpTool

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URLString parameters:parameters progress:nil success:success failure:failure];
}

@end
