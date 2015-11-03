//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by apple-jd18 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//很多具有共同占的东西，可以统一宏定义，比如凡是自己写的宏定义，都需要用k开头，这是编码习惯
#define kOSType  @"OSType":@"ios9.1"
//把path写到文件头部，使用宏定义形势，方便后期维护
//#define kHeropathL @""
#define kHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php"//免费+英雄
#define kHeroSkinPath @"http://box.dwstatic.com/apiHeroSkin.php"//英雄头像
#define kHeroVideoPath @"http://box.dwstatic.com/apiVideoesNormalDuowan.php"//视频
#define kHeroCZPath @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php"//出装
#define kHeroDetailPath @"http://lolbox.duowan.com/phone/apiHeroDetail.php"//资料
#define  KHeroGiftPath @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php"//排行
#define kHeroChangePath @"http://db.duowan.com/boxnews/heroinfo.php"//改动
#define kHeroWeekDataPath @"http://183.61.12.108/apiHeroWeekData.php"//一周数据

@interface DuoWanNetManager : BaseNetManager

@end
