//
//  BankCardCell.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "BankCardCell.h"

@interface BankCardCell ()

@property (nonatomic, strong) UIImageView *banklogoImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation BankCardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.banklogoImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.numberLabel];
        [self initCellView];
    }
    return self;
}

-(void)initCellView{
    [self.banklogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(kSixScreen(10));
        make.size.mas_equalTo(CGSizeMake(kSixScreen(28), kSixScreen(28)));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.banklogoImgView.mas_right).with.offset(kSixScreen(8));
        make.top.mas_equalTo(kSixScreen(15));
        make.height.mas_equalTo(kSixScreen(17));
    }];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(kSixScreen(15));
        make.height.mas_equalTo(kSixScreen(15));
    }];
}

-(void)setDataModel:(BankCartItem *)model{
    self.nameLabel.text = model.name;
//    [self.banklogoImgView sd]
    self.numberLabel.text = model.number;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)banklogoImgView{
    if(!_banklogoImgView){
        self.banklogoImgView = [[UIImageView alloc]init];
    }
    return _banklogoImgView;
}

-(UILabel *)nameLabel{
    if(!_nameLabel){
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.textColor = MainTextGrayColor;
        self.nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: kSixScreen(16)];
    }
    return _nameLabel;
}

-(UILabel *)numberLabel{
    if(!_numberLabel){
        self.numberLabel = [[UILabel alloc]init];
        self.numberLabel.textColor = MainTextGrayColor;
        self.numberLabel.font = [UIFont fontWithName:@"DIN Alternate Bold" size: kSixScreen(15)];
    }
    return _numberLabel;
}

@end
