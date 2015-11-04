//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
//很多具有共同点的东西，可以统一宏定义, 凡是自己写的宏定义 都需要用k开头，这是编码习惯

//如果宏命令超长需要换行，只需要在换行位置添加 \ 即可， 最后一行不用加
#define kOSType       @"OSType": [@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion] //获取当前系统版本号

#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140

//把path写到文件头部，使用宏定义形势。 方便后期维护
//把所有路径宏定义封装到DuoWanRequestPath.h文件中,太多东西放在文件头部,好乱的说😊
#import "DuoWanRequestPath.h"

@implementation DuoWanNetManager

+ (id)getHeroWithType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, kV}];
    switch (type) {
        case HeroTypeFree: {
            [params setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll: {
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree: {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            case HeroTypeAll: {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            default: {
                completionHandle(nil, error);
                break;
            }
        }
    }];
}


+ (id)getHeroSkinsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSkinPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroSoundWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSoundPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
//Json数据就是标准数组，不需要解析
        completionHandle(responseObj, error);
    }];
}

+ (id)getHeroVideosWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroVideoPath parameters:@{kVersionName, kOSType, @"action": @"l", @"p": @(page), @"src": @"letv", @"tag": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroCZPath parameters:@{kV, kOSType, @"limit": @7, @"championName": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

@end

























