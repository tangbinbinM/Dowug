//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    NSMutableString *percentPath = [NSMutableString stringWithFormat:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;//这里定义的count为了提高效率。只调用一次方法
    /*
     for(int i = 0;i<params.allKeys;i++)
     假设for循环循环1000次，params.allKeys实际上调用的[params allKeys];会调用allKeys1000次。OC语言特性是runtime(运行时)，实际上我们调用一个方法，底层操作是 在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕之后把这个方法名转移到常用方法列表。所以如果再次执行某个方法就在常用方法列表 中搜索调用 效率更高。只要调用方法就会动用方法搜索，所以最好用以下for循环，减少方法搜索。
     */
    for (int i = 0; i<count; i++) {
        if(i == 0){
            [percentPath appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //把字符串中的中文转为%号形势
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", nil];
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    //打印网络请求， DDLog  与  NSLog 功能一样
    path = [self percentPathWithPath:path params:params];
    DDLogVerbose(@"Request Path: %@", path);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

//+ (NSString *)pathWithPercent:(NSString *)path params:(NSDictionary *)params{
//    NSMutableString *fullPath = [[NSMutableString alloc] initWithString:path];
//    NSArray *keys = params.allKeys;
//    for (int i = 0; i < keys.count; i++) {
//        if (i == 0) {
//            [fullPath appendString:@"?"];
//        }else if(i == keys.count - 1){
//            [fullPath appendFormat:@"%@=%@", keys[i], params[keys[i]]];
//        }else{
//            [fullPath appendFormat:@"%@=%@&", keys[i], params[keys[i]]];
//        }
//    }
//    return [fullPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
