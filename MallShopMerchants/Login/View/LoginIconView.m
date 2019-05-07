//
//  LoginIconView.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/7.
//  Copyright © 2019年 yezhongzheng. All rights reserved.
//

#import "LoginIconView.h"

@interface LoginIconView ()

@property(nonatomic, strong) UIImageView *imgView;


@end

@implementation LoginIconView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(130));
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(kSixScreen(121), kSixScreen(208)));
        }];
    }
    
    return self;
}

- (UIImageView *)imgView {
    
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:@"pic_enter_logo"];
    }
    
    return _imgView;
}

@end
