//
//  ZLScreenAdaption.h
//  美天
//
//  Created by qianfeng on 15/10/24.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#ifndef ZLScreenAdaption_h
#define ZLScreenAdaption_h


#define AdaptaionFlag

#ifdef AdaptaionFlag

#define CGRectMake CGRectMakeEx
#define CGSizeMake CGSizeMakeEx
#define widthEx widthEx
#define heightEx heightEx

#else

#define CGRectMake CGRectMake
#define CGSizeMake CGSizeMake
#define widthEx
#define heightEx

#endif

#endif /* ZLScreenAdaption_h */
