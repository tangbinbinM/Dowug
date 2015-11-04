//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XiMaNetManager.h"
#import "TuWanNetManager.h"
#import "DuoWanNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
/*喜马拉雅接口测试通过*/
    [XiMaNetManager getRankListWithPageId:1 completionHandle:^(RankingListModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [XiMaNetManager getAlbumWithId:3092772 page:1 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@""); //需要添加 text/plain 解析允许，在baseNetwork中
    }];
    
/*兔玩接口测试通过*/
    [TuWanNetManager getTuWanInfoWithType:InfoTypeTouTiao start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [TuWanNetManager getTuWanInfoWithType:InfoTypeCos start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeLuShi start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeDuJia start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeMeiNv start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeQuWen start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeMoShou start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeShiPin start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeShouWang start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeFengBao start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeGongLue start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeXingJi2 start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    [TuWanNetManager getTuWanInfoWithType:InfoTypeAnHei3 start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];

    /*多玩盒子 接口测试*/
    [DuoWanNetManager getHeroWithType:HeroTypeAll completionHandle:^(AllHeroModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroWithType:HeroTypeFree completionHandle:^(FreeHeroModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroSkinsWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroSoundWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroVideosWithPage:1 tag:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroCZWithHeroName:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    return YES;
}

@end









