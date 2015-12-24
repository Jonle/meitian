//
//  FZRotatingBanner.m
//  FZRotatingBanner
//
//  Created by Jonle on 15/12/16.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import "FZRotatingBanner.h"
#import "MyCollectionViewCell.h"

#define CELL_IDENTIFIER @"cellIndentifier"

const NSInteger collectionViewSections = 50;

@interface FZRotatingBanner ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>
{
    
    NSTimer * _timer;
}
@property (nonatomic, weak) UICollectionView * collectionView;
@property (nonatomic, weak) UIPageControl * pageControl;
@property (nonatomic, copy) void(^clickedIndex)(NSInteger index);


@end

@implementation FZRotatingBanner

+ (instancetype)defaultRotatingBannerWithFrame:(CGRect)frame {
    
    return [[self alloc] initRotatingBannerWithFrame:frame];
}
+ (instancetype)bannerWithFrame:(CGRect)frame {
    return [[self alloc] initRotatingBannerWithFrame:frame];
}

- (instancetype)initRotatingBannerWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
    }
    return self;
}

+ (instancetype)defaultRotatingBannerWithFrame:(CGRect)frame duration:(CGFloat)duration {
    
    return [[self alloc] initRotatingBannerWithFrame:frame duration:duration];
}
+ (instancetype)bannerWithFrame:(CGRect)frame duration:(CGFloat)duration {
    
    return [[self alloc] initRotatingBannerWithFrame:frame duration:duration];
}

- (instancetype)initRotatingBannerWithFrame:(CGRect)frame duration:(CGFloat)duration {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
        
        _duration = duration;
    }
    return self;
}

#pragma mark - 初始化默认数据

- (void)initialize {
    
    _duration = 0;
    _pageControlHeight = 50;
    _pageControlFrame = CGRectMake(0, CGRectGetHeight(self.frame) - _pageControlHeight, CGRectGetWidth(self.frame), _pageControlHeight);
    _placeHolderImage = nil;
    
}
#pragma mark - 初始化计时器
- (void)addTimer {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_duration target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

/** 下一页 */
- (void)nextPage {
    
    NSIndexPath * currentPage = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath * currentPageReset = [NSIndexPath indexPathForItem:currentPage.item inSection:collectionViewSections / 2];
    
    [self.collectionView scrollToItemAtIndexPath:currentPageReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentPageReset.item + 1;
    NSInteger nextSection = currentPageReset.section;
    
    if (nextItem == _imagesNameOrUrl.count) {
        
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath * nextPagePath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [self.collectionView scrollToItemAtIndexPath:nextPagePath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}

#pragma mark - setter和getter方法
- (void)setImagesNameOrUrl:(NSArray *)imagesNameOrUrl {
    
    _imagesNameOrUrl = imagesNameOrUrl;
    
    self.pageControl.numberOfPages = imagesNameOrUrl.count;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    
    _pageIndicatorTintColor = pageIndicatorTintColor;
    
    self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

- (void)setPageControlHeight:(CGFloat)pageControlHeight {
    
    _pageControlHeight = pageControlHeight;
    
    _pageControlFrame.size.height = pageControlHeight;
    
    self.pageControlFrame = _pageControlFrame;
}
- (void)setPageControlFrame:(CGRect)pageControlFrame {
    
    _pageControlFrame = pageControlFrame;
    self.pageControl.frame = pageControlFrame;
}
- (void)setHiddenPageControl:(BOOL)hiddenPageControl {
    
    _hiddenPageControl = hiddenPageControl;
    
    self.pageControl.hidden = hiddenPageControl;
}

#pragma mark - 懒加载控件

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView = collectionView;
        
        _collectionView.pagingEnabled = YES;
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CELL_IDENTIFIER];
        
        [self addSubview:_collectionView];
    }
    return _collectionView;
}
- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        
        UIPageControl * pageControl = [[UIPageControl alloc] init];
        
        _pageControl = pageControl;
        
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

#pragma mark - collectionView的Delegate和DataSource方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _imagesNameOrUrl.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return collectionViewSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    cell.imageIcon = _imagesNameOrUrl[indexPath.item];
    cell.placeHolderImage = _placeHolderImage;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.frame.size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.clickedIndex) {
        
        self.clickedIndex(indexPath.item);
    }
}
#pragma mark - scrollView的delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger page = (NSInteger)(scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame) + 0.5) % self.imagesNameOrUrl.count;
    
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self addTimer];
}
#pragma mark - 子控件设置
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    self.pageControl.frame = _pageControlFrame;
    
    [self bringSubviewToFront:self.pageControl];
    [self addTimer];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:collectionViewSections / 2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}


#pragma mark - 图片点击回调
-(void)clickImageWithBlock:(void (^)(NSInteger))clickAction {
    
    self.clickedIndex = clickAction;
}


@end
