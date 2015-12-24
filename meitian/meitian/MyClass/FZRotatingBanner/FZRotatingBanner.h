//
//  FZRotatingBanner.h
//  FZRotatingBanner
//
//  Created by Jonle on 15/12/16.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZRotatingBanner : UIView


/*---------------------setImages----------------------------------*/

/** 传递本地图片名或url数组 */
@property (nonatomic, retain) NSArray * imagesNameOrUrl;

/** 加载网络图片前显示的Image */
@property (nonatomic, retain) UIImage * placeHolderImage;

/*----------------------setPageControl------------------------------*/

/** 页码指示器的高 */
@property (nonatomic, assign) CGFloat pageControlHeight;
/** 设置pageControl的frame 默认居中靠下 */
@property (nonatomic, assign) CGRect pageControlFrame;
/** 页码默认显示颜色 */
@property (nonatomic, retain) UIColor * pageIndicatorTintColor;
/** 当前页码显示颜色 */
@property (nonatomic, retain) UIColor * currentPageIndicatorTintColor;
/** 隐藏页码指示器 */
@property (nonatomic, assign) BOOL hiddenPageControl;

/*---------------------otherSetting-----------------------------*/

/** 计时器计时的间隔 默认计时器不启动：duration赋值0 */
@property (nonatomic, assign) CGFloat duration;


/*-------------------------methods-----------------------------*/

/** 创建轮播(参数：frame) */
+ (instancetype)defaultRotatingBannerWithFrame:(CGRect)frame;
+ (instancetype)bannerWithFrame:(CGRect)frame;
/** init方法创建 */
- (instancetype)initRotatingBannerWithFrame:(CGRect)frame;

/** 创建轮播(参数：frame、duration) */
+ (instancetype)defaultRotatingBannerWithFrame:(CGRect)frame duration:(CGFloat)duration;
+ (instancetype)bannerWithFrame:(CGRect)frame duration:(CGFloat)duration;
/** init方法创建 */
- (instancetype)initRotatingBannerWithFrame:(CGRect)frame  duration:(CGFloat)duration;

/** 点击图片返回索引, 索引值从0开始 */
- (void)clickImageWithBlock:(void(^)(NSInteger index))clickAction;

@end
