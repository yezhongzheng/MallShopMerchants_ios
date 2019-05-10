//
//  ReportAmountView.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "ReportAmountView.h"

@interface ReportAmountView ()

@property(nonatomic,strong)UILabel * paymentLabel;
@property(nonatomic,strong)UILabel * paymentPriceLabel;
@property(nonatomic,strong)UILabel * orderLabel;
@property(nonatomic,strong)UILabel * orderNumberLabel;
@property(nonatomic,strong)UILabel * peopleLabel;
@property(nonatomic,strong)UILabel * peopleNumberLabel;

@end


@implementation ReportAmountView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.paymentLabel];
        [self addSubview:self.paymentPriceLabel];
        [self addSubview:self.orderLabel];
        [self addSubview:self.orderNumberLabel];
        [self addSubview:self.peopleLabel];
        [self addSubview:self.peopleNumberLabel];
        [self setLoadUIView];
    }
    return self;
}

-(void)setLoadUIView{
    WEAKSELF
    [self.paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kSixScreen(12));
        make.left.mas_equalTo(kSixScreen(36));
        make.height.mas_equalTo(kSixScreen(19));
    }];
    [self.paymentPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.paymentLabel);
        make.top.equalTo(weakSelf.paymentLabel.mas_bottom).with.offset(kSixScreen(5));
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.equalTo(weakSelf.paymentLabel);
        make.left.mas_equalTo(kSixScreen(213));
    }];
    [self.orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.orderLabel);
        make.height.top.equalTo(weakSelf.paymentPriceLabel);
    }];
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.equalTo(weakSelf.paymentLabel);
        make.top.equalTo(weakSelf.paymentPriceLabel.mas_bottom).with.offset(kSixScreen(30));
    }];
    [self.peopleNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(weakSelf.paymentPriceLabel);
        make.top.equalTo(weakSelf.peopleLabel.mas_bottom).with.offset(kSixScreen(5));
    }];
}

-(void)setDataModel:(ReportItem *)model{
    self.paymentPriceLabel.text = SHITF_STRING(model.order_amount);
    self.orderNumberLabel.text = SHITF_STRING(model.order_count);
    self.peopleNumberLabel.text = SHITF_STRING(model.member_count);
}


-(UILabel *)paymentLabel{
    if(!_paymentLabel){
        self.paymentLabel = [[UILabel alloc]init];
        self.paymentLabel.textColor = MainTextBlackColor;
        self.paymentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.paymentLabel.text = @"付款金额(元)";
    }
    return _paymentLabel;
}

-(UILabel *)paymentPriceLabel{
    if(!_paymentPriceLabel){
        self.paymentPriceLabel = [[UILabel alloc]init];
        self.paymentPriceLabel.textColor = kBlackColor;
        self.paymentPriceLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _paymentPriceLabel;
}

-(UILabel *)orderLabel{
    if(!_orderLabel){
        self.orderLabel = [[UILabel alloc]init];
        self.orderLabel.textColor = MainTextBlackColor;
        self.orderLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.orderLabel.text = @"付款单数(单)";
    }
    return _orderLabel;
}

-(UILabel *)orderNumberLabel{
    if(!_orderNumberLabel){
        self.orderNumberLabel = [[UILabel alloc]init];
        self.orderNumberLabel.textColor = kBlackColor;
        self.orderNumberLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _orderNumberLabel;
}

-(UILabel *)peopleLabel{
    if(!_peopleLabel){
        self.peopleLabel = [[UILabel alloc]init];
        self.peopleLabel.textColor = MainTextBlackColor;
        self.peopleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.peopleLabel.text = @"付款人数(人)";
    }
    return _peopleLabel;
}

-(UILabel *)peopleNumberLabel{
    if(!_peopleNumberLabel){
        self.peopleNumberLabel = [[UILabel alloc]init];
        self.peopleNumberLabel.textColor = kBlackColor;
        self.peopleNumberLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _peopleNumberLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
