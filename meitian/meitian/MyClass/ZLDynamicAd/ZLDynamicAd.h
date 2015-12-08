//
//  ZLDynamicAd.h
//  封装（简单）广告位
//
//  Created by Jonle on 15/9/18.
//  Copyright (c) 2015年 Jonle. All rights reserved.
//

#import <UIKit/UIKit.h>



#warning 需要引用SDWebImage第三方库

@interface ZLDynamicAd : UIView <UIScrollViewDelegate>

/**
 *  需要循环的图
 */
@property (nonatomic, strong) NSArray * images;

@property (nonatomic, assign, getter=isUrlImages) BOOL alwaysUrlImages;

/** 图片持续停留时间；默认为0，广告位不滚动 */
@property (nonatomic, assign) CGFloat duration;

/** 点击事件的回调  */
@property (nonatomic, copy) void (^didClikedPage)(ZLDynamicAd * pictureView, NSInteger indexPage);


/** 页码指示器,默认在底部居中 */
@property (nonatomic, strong, readonly) UIPageControl * pageControl;
@property (nonatomic, assign, getter=isShowPageControl) BOOL showPageControl;


@property (nonatomic, strong, readonly) UIScrollView * scrollView;

/** 默认背景图*/
@property (nonatomic, strong) UIImage * placeHolderImage;
/**************************************************************************/


/**
 *  类方法初始化
 *
 *  @return self
 */
+ (instancetype)dynamicAd;

/**
 *  类方法初始化,设置frame，duration，images
 *
 *  @param frame    广告位的位置及大小
 *  @param duration 广告滚动设置；默认0，不滚动
 *  @param images   需要的图片
 *
 *  @return
 */
+ (instancetype)dynamicAdWithFrame:(CGRect)frame duration:(CGFloat)duration images:(NSArray *)images;

/**
 *  成员方法,设置frame，duration，images
 *
 *  @param frame    广告位的位置及大小
 *  @param duration 广告滚动设置；默认0，不滚动
 *  @param images   需要的图片
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame duration:(CGFloat)duration images:(NSArray *)images;

/**  获取当前图片索引 */
- (void)setAdUrlWithClickPicture:(void (^)(ZLDynamicAd * pictureView, NSInteger indexPage))clikedPage;

/**刷新UI**/
- (void)refreshUIWithImages:(NSArray *)images;

/*获取当前显示的图片*/
- (void)currentImageIndex:(void (^)(NSInteger indexPage))block;

@end
