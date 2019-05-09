//
//  WalletHeardView.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "WalletHeardView.h"

@interface WalletHeardView ()

@property(nonatomic,strong)UIImageView *heardBgImgView;
@property(nonatomic,strong)UILabel * canCarryLabel;
@property(nonatomic,strong)UILabel * canCarryPriceLabel;
@property(nonatomic,strong)UILabel * alreadyCarryLabel;
@property(nonatomic,strong)UILabel * alreadyCarryPriceLabel;
@property(nonatomic,strong)UILabel * settlementLabel;
@property(nonatomic,strong)UILabel * settlementPriceLabel;
@property(nonatomic,strong)UILabel * noSettlementLabel;
@property(nonatomic,strong)UILabel * noSettlementPriceLabel;

@end

@implementation WalletHeardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.heardBgImgView];
        [self addSubview:self.canCarryLabel];
        [self addSubview:self.canCarryPriceLabel];
        [self addSubview:self.alreadyCarryLabel];
        [self addSubview:self.alreadyCarryPriceLabel];
        [self addSubview:self.settlementLabel];
        [self addSubview:self.settlementPriceLabel];
        [self addSubview:self.noSettlementLabel];
        [self addSubview:self.noSettlementPriceLabel];
        [self setLoadUIView];
    }
    return self;
}

-(void)setLoadUIView{
    [self.heardBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    WEAKSELF
    [self.canCarryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kSixScreen(15));
        make.left.mas_equalTo(kSixScreen(35));
        make.height.mas_equalTo(kSixScreen(19));
    }];
    [self.canCarryPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.canCarryLabel);
        make.top.equalTo(weakSelf.canCarryLabel.mas_bottom).with.offset(kSixScreen(5));
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.alreadyCarryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.equalTo(weakSelf.canCarryLabel);
        make.left.mas_equalTo(kSixScreen(211));
    }];
    [self.alreadyCarryPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.alreadyCarryLabel);
        make.top.equalTo(weakSelf.canCarryPriceLabel);
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.settlementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.canCarryLabel);
        make.top.equalTo(weakSelf.canCarryPriceLabel.mas_bottom).with.offset(kSixScreen(25));
        make.height.mas_equalTo(kSixScreen(19));
    }];
    [self.settlementPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.canCarryLabel);
        make.top.equalTo(weakSelf.settlementLabel.mas_bottom).with.offset(kSixScreen(5));
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.noSettlementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.alreadyCarryLabel);
        make.top.equalTo(weakSelf.settlementLabel);
        make.height.mas_equalTo(kSixScreen(19));
    }];
    [self.noSettlementPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.noSettlementLabel);
        make.top.equalTo(weakSelf.settlementPriceLabel);
        make.height.mas_equalTo(kSixScreen(30));
    }];
}

-(void)setDataModel:(WalletInfo *)model{
    self.canCarryPriceLabel.text = model.withdrawable;
    self.alreadyCarryPriceLabel.text = model.withdrawals;
    self.settlementPriceLabel.text = model.settled;
    self.noSettlementPriceLabel.text = model.unsettled;
}

-(UIImageView *)heardBgImgView{
    if(!_heardBgImgView){
        self.heardBgImgView = [[UIImageView alloc]init];
        self.heardBgImgView.backgroundColor = [UIColor colorWithHexString:@"DFC289"];
    }
    return _heardBgImgView;
}

-(UILabel *)canCarryLabel{
    if(!_canCarryLabel){
        self.canCarryLabel = [[UILabel alloc]init];
        self.canCarryLabel.textColor = kWhiteColor;
        self.canCarryLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.canCarryLabel.text = @"可提现金额";
    }
    return _canCarryLabel;
}

-(UILabel *)canCarryPriceLabel{
    if(!_canCarryPriceLabel){
        self.canCarryPriceLabel = [[UILabel alloc]init];
        self.canCarryPriceLabel.textColor = kWhiteColor;
        self.canCarryPriceLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _canCarryPriceLabel;
}

-(UILabel *)alreadyCarryLabel{
    if(!_alreadyCarryLabel){
        self.alreadyCarryLabel = [[UILabel alloc]init];
        self.alreadyCarryLabel.textColor = kWhiteColor;
        self.alreadyCarryLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.alreadyCarryLabel.text = @"已提现金额";
    }
    return _alreadyCarryLabel;
}

-(UILabel *)alreadyCarryPriceLabel{
    if(!_alreadyCarryPriceLabel){
        self.alreadyCarryPriceLabel = [[UILabel alloc]init];
        self.alreadyCarryPriceLabel.textColor = kWhiteColor;
        self.alreadyCarryPriceLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _alreadyCarryPriceLabel;
}

-(UILabel *)settlementLabel{
    if(!_settlementLabel){
        self.settlementLabel = [[UILabel alloc]init];
        self.settlementLabel.textColor = kWhiteColor;
        self.settlementLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.settlementLabel.text = @"已结算金额";
    }
    return _settlementLabel;
}

-(UILabel *)settlementPriceLabel{
    if(!_settlementPriceLabel){
        self.settlementPriceLabel = [[UILabel alloc]init];
        self.settlementPriceLabel.textColor = kWhiteColor;
        self.settlementPriceLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _settlementPriceLabel;
}

-(UILabel *)noSettlementLabel{
    if(!_noSettlementLabel){
        self.noSettlementLabel = [[UILabel alloc]init];
        self.noSettlementLabel.textColor = kWhiteColor;
        self.noSettlementLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(13)];
        self.noSettlementLabel.text = @"未结算金额";
    }
    return _noSettlementLabel;
}

-(UILabel *)noSettlementPriceLabel{
    if(!_noSettlementPriceLabel){
        self.noSettlementPriceLabel = [[UILabel alloc]init];
        self.noSettlementPriceLabel.textColor = kWhiteColor;
        self.noSettlementPriceLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(30)];
    }
    return _noSettlementPriceLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
