//
//  HttpInterface.h
//  meitian
//
//  Created by Jonle on 15/12/24.
//  Copyright © 2015年 jonle. All rights reserved.
//

#ifndef HttpInterface_h
#define HttpInterface_h


/** 每天界面网址 */
#define FUNDAY_URL @"http://api.meitianapp.com/api/v1/articles?filter=isHomepage&start=0&limit=%d"

/** 排行榜网址 */
#define RANKLIST_URL @"http://api.meitianapp.com/api/v1/articles?filter=isRankingList"

/** 文章详情 */
#define Article_URL @"http://www.meitianapp.com/app/article/%@"

/** 推荐网址 */
#define Recommend_URL @"http://api.meitianapp.com/api/v1/articles?filter=byCategoryGroup&limit=10&param=%zd&start=0"

/** 购物网址 */
#define Purchase_URL @"http://api.meitianapp.com/api/v1/sales?filter=isOpen&start=0"

/** 专栏作者网址 */
#define author_URL @"http://api.meitianapp.com/api/v1/authors?filter=isDiscovery&start=0&limit=%d"

#endif /* HttpInterface_h */
