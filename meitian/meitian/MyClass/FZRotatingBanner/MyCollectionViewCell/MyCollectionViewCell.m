//
//  CollectionViewCell.m
//  FZRotatingBanner
//
//  Created by Jonle on 15/12/16.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "FZImage.h"

@interface MyCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MyCollectionViewCell


- (void)awakeFromNib {
    

}

- (void)layoutSubviews {
    
    [super layoutSubviews];
}

- (void)setImageIcon:(NSString *)imageIcon {
    
    _imageIcon = imageIcon;
    
    if ([imageIcon hasPrefix:@"http"]) {
        
        [_imageView sd_setImageWithURL:[NSURL URLWithString:imageIcon] placeholderImage:_placeHolderImage];
        return;
    }
    _imageView.image = [FZImage imageNamed:imageIcon];

}

@end
