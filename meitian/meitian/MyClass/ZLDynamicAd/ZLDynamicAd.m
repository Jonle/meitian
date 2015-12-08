//
//  ZLDynamicAd.m
//  封装（简单）广告位
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 Jonle. All rights reserved.
//

#import "ZLDynamicAd.h"
#import "UIImageView+WebCache.h"

#define SCREEN_Width [[UIScreen mainScreen] bounds].size.width

#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height

@interface ZLDynamicAd ()

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, copy) void (^pageBlock) (NSInteger currentPage);

@end

@implementation ZLDynamicAd
{

    NSInteger _pageNum;
}

/**
 *  类方法初始化
 *
 *  @return self
 */
+ (instancetype)dynamicAd{
    
    return [[self alloc] init];
}

/**
 *  类方法
 *
 *  @param frame    广告位的位置及大小
 *  @param duration 广告滚动设置；默认0，不滚动
 *  @param images   需要的图片
 *
 *  @return
 */
+ (instancetype)dynamicAdWithFrame:(CGRect)frame duration:(CGFloat)duration images:(NSArray *)images{
    
    return [[self alloc] initWithFrame:(CGRect)frame duration:duration images:images];
}

/**
 *  成员方法
 *
 *  @param frame    广告位的位置及大小
 *  @param duration 广告滚动设置；默认0，不滚动
 *  @param images   需要的图片
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame duration:(CGFloat)duration images:(NSArray *)images{
    
    if (self = [super initWithFrame:frame]) {
        
        [self initlize];
        [self setImages:images];
        [self setDuration:duration];
        [self setPageControl:nil];

    }
    return self;
}
- (void)initlize {
    
    _alwaysUrlImages = YES;
    _showPageControl = YES;
}


#pragma mark - 获取图片索引的Block方法
/**  获取当前图片索引 */
- (void)setAdUrlWithClickPicture:(void (^)(ZLDynamicAd * pictureView, NSInteger indexPage))clikedPage{
    
    self.didClikedPage = clikedPage;
}

#pragma mark - 重写背景颜色方法
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    
    _scrollView.backgroundColor = backgroundColor;
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
     
    [self setPageControl:nil];
    [self scrollView];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    
//    _scrollView 
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self sendSubviewToBack:_scrollView];
    
}

#pragma mark - 设置图片组
- (void)setImages:(NSArray *)images{
    
    _images = images;
    _pageNum = images.count;

}

#pragma mark - 设置scrollView
- (UIScrollView *)scrollView{
    
    if (!_scrollView) _scrollView = [[UIScrollView alloc] init];

    //判断图片是否是本地图片
    if (_alwaysUrlImages) [self urlImages];
    else  [self localImages];

    _scrollView.frame = self.frame;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame), 0);

    _scrollView.delegate = self;
    
    [self addSubview:_scrollView];

    return _scrollView;
}

#pragma mark - 创建图片View

- (void)urlImages {
    
//    if (_images.count == 0) return;
    
    CGFloat width = CGRectGetWidth(_scrollView.frame);
    CGFloat height = CGRectGetHeight(_scrollView.frame);
    
    for (int i = 0; i < self.images.count + 2; i++) {
        
        UIImageView * imageView = [[UIImageView alloc] init];
        
        imageView.frame = CGRectMake(width * i, 0, width, height);
        
        imageView.userInteractionEnabled = YES;
        
        if (i == 0) {
            
            [imageView sd_setImageWithURL:self.images[self.images.count - 1] placeholderImage:_placeHolderImage];
            
        } else if (i == self.images.count + 1) {
            
            [imageView sd_setImageWithURL:self.images[0] placeholderImage:_placeHolderImage];
            
        }else{
            
            [imageView sd_setImageWithURL:self.images[i - 1] placeholderImage:_placeHolderImage];
            
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedAction:)]];
        }
        
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.contentSize = CGSizeMake((self.images.count + 2) * width, 0);

    
}
- (void)localImages {
    
//    if (_images.count == 0) return;
    
    CGFloat width = CGRectGetWidth(_scrollView.frame);
    CGFloat height = CGRectGetHeight(_scrollView.frame);
    
    for (int i = 0; i < self.images.count + 2; i++) {
        
        UIImageView * imageView = [[UIImageView alloc] init];
        
        imageView.frame = CGRectMake(width * i, 0, width, height);
        
        imageView.userInteractionEnabled = YES;
        
        if (i == 0) {
            imageView.image = [UIImage imageNamed:self.images[self.images.count - 1]];
            
        } else if (i == self.images.count + 1) {
            
            imageView.image = [UIImage imageNamed:self.images[0]];
        }else{
            
            imageView.image = [UIImage imageNamed:self.images[i - 1]];
            
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedAction:)]];
        }
        
        [_scrollView addSubview:imageView];
    }
    
     _scrollView.contentSize = CGSizeMake((self.images.count + 2) * width, 0);

}


#pragma mark - 点击图片回调
- (void)clickedAction:(UITapGestureRecognizer *)tap{
    
    NSInteger currentIndex = _scrollView.contentOffset.x / CGRectGetWidth(_scrollView.frame);
    
    if (self.didClikedPage) {
        
        self.didClikedPage(self, currentIndex - 1);
    }
    
}

#pragma mark - 设置页码器
- (void)setPageControl:(UIPageControl *)pageControl{
    
    if (!_showPageControl) return;
 
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 30);
    
    CGPoint center = _pageControl.center;
    center.y = CGRectGetHeight(self.frame) - 15;
    _pageControl.center = center;
    
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    _pageControl.numberOfPages = _pageNum;
    _pageControl.currentPage = 0;
    
    
    [self addSubview:_pageControl];
}


#pragma mark - 启动计时器
- (void)timerAction:(CGFloat)time{
    
    [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(pageAction) userInfo:nil repeats:YES];
}

#pragma mark - 计时器调用页面切换
- (void)pageAction{
    
    NSInteger page = _scrollView.contentOffset.x / CGRectGetWidth(_scrollView.frame);
    
    [_scrollView setContentOffset:CGPointMake(++page * CGRectGetWidth(_scrollView.frame), 0) animated:YES];
}

#pragma mark - 单张图片滑动动态停止，变换页码指示器页码
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    [self setPage:scrollView];
}

#pragma mark - 手动滑动图片
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self setPage:scrollView];
    
}

#pragma mark - setter方法
- (void)setPage:(UIScrollView *)scrollView{
    //当前显示页码
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    //总页码数
    NSInteger num = scrollView.contentSize.width / scrollView.frame.size.width;
 
    NSInteger pageNum = 0;
    
    if (page == 0) {
        
        [scrollView setContentOffset:CGPointMake((num - 2) * CGRectGetWidth(scrollView.frame), 0) animated:NO];
        
        pageNum = num - 2;
        
    }else if (page == num - 1) {
        
        [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.frame), 0) animated:NO];
        
        pageNum = 0;
        
    }else{
        
        pageNum = page - 1;
    }
    
    _pageControl.currentPage = pageNum;
    
    if (self.pageBlock) self.pageBlock(pageNum);

}

- (void)setDuration:(CGFloat)duration{
    
    _duration = duration;
    
    [self timerAction:duration];
}

- (void)setShowPageControl:(BOOL)showPageControl {
    
    _showPageControl = showPageControl;
    
    if (showPageControl) {
        return;
    }
    
    [_pageControl removeFromSuperview];
    _pageControl = nil;
    
}

- (void)setAlwaysUrlImages:(BOOL)alwaysUrlImages {
 
    _alwaysUrlImages = alwaysUrlImages;
}
#pragma mark - 

- (void)refreshUIWithImages:(NSArray *)images; {
    
    for (id view in _scrollView.subviews) {
        
        [view removeFromSuperview];
    }
    
    _images = images;
    
    _scrollView = [self scrollView];
}

- (void)currentImageIndex:(void (^)(NSInteger))block {
    
    self.pageBlock = block;
}

@end
