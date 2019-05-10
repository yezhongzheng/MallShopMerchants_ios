//
//  NoticeSectionHeadView.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "NoticeSectionHeadView.h"

@interface NoticeSectionHeadView()

@property (nonatomic, strong) UILabel *timeLable;

@end

@implementation NoticeSectionHeadView

-(instancetype)initWithTimeString:(NSString *)timeString {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(12.f);
            make.bottom.equalTo(self).offset(-12.f);
            make.center.equalTo(self);
        }];
        
        if (timeString.length > 0) {
            self.timeLable.text = timeString;
        }
    }
    return self;
}

- (UILabel *)timeLable {
    if (!_timeLable) {
        _timeLable = [[UILabel alloc] init];
        _timeLable.backgroundColor = [UIColor clearColor];
        _timeLable.font = [UIFont systemFontOfSize:16.f];
    }
    return _timeLable;
}

@end
