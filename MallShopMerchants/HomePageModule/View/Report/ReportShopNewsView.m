//
//  ReportShopNewsView.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "ReportShopNewsView.h"

@interface ReportShopNewsView ()

@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * upGoodsLabel;
@property(nonatomic,strong)UILabel * downGoodsLabel;
@property(nonatomic,strong)UILabel * upNumberLabel;
@property(nonatomic,strong)UILabel * downNumberLabel;

@end

@implementation ReportShopNewsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.upGoodsLabel];
        [self addSubview:self.downGoodsLabel];
        [self addSubview:self.upNumberLabel];
        [self addSubview:self.downNumberLabel];
        [self setLoadUIView];
    }
    return self;
}

-(void)setLoadUIView{
    WEAKSELF
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kSixScreen(15));
        make.left.mas_equalTo(kSixScreen(15));
        make.height.mas_equalTo(kSixScreen(16));
    }];
    [self.upGoodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kSixScreen(36));
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(kSixScreen(15));
        make.height.mas_equalTo(kSixScreen(19));
    }];
    [self.downGoodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kSixScreen(213));
        make.height.top.equalTo(weakSelf.upGoodsLabel);
    }];
    [self.upNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.upGoodsLabel.mas_bottom).with.offset(kSixScreen(5));
        make.left.equalTo(weakSelf.upGoodsLabel);
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.downNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.downGoodsLabel);
        make.height.top.equalTo(weakSelf.upNumberLabel);
    }];
}

-(void)setDataModel:(ReportItem *)model{
    self.upNumberLabel.text = SHITF_STRING(model.goods_enable);
    self.downNumberLabel.text = SHITF_STRING(model.goods_disable);
}


-(UILabel *)titleLabel{
    if(!_titleLabel){
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.textColor = MainTitleGrayColor;
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(16)];
        self.titleLabel.text = @"商品信息";
    }
    return _titleLabel;
}

-(UILabel *)upGoodsLabel{
    if(!_upGoodsLabel){
        self.upGoodsLabel = [[UILabel alloc]init];
        self.upGoodsLabel.textColor = MainTextBlackColor;
        self.upGoodsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.upGoodsLabel.text = @"在架商品";
    }
    return _upGoodsLabel;
}

-(UILabel *)downGoodsLabel{
    if(!_downGoodsLabel){
        self.downGoodsLabel = [[UILabel alloc]init];
        self.downGoodsLabel.textColor = MainTextBlackColor;
        self.downGoodsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.downGoodsLabel.text = @"下架商品";
    }
    return _downGoodsLabel;
}

-(UILabel *)upNumberLabel{
    if(!_upNumberLabel){
        self.upNumberLabel = [[UILabel alloc]init];
        self.upNumberLabel.textColor = kBlackColor;
        self.upNumberLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _upNumberLabel;
}

-(UILabel *)downNumberLabel{
    if(!_downNumberLabel){
        self.downNumberLabel = [[UILabel alloc]init];
        self.downNumberLabel.textColor = kBlackColor;
        self.upNumberLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _downNumberLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
