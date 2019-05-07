//
//  OrderStatusCell.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "OrderStatusCell.h"
#import "OrderModel.h"

@interface OrderStatusCell ()

@property (nonatomic, strong) UIView *cornerView;
@property (nonatomic, strong) UILabel *orderNameLabel;
@property (nonatomic, strong) UILabel *orderTimeLabel;
@property (nonatomic, strong) UILabel *orderInfoLabel;
@property (nonatomic, strong) UIView *diliverView;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UIButton *viewOrderButton;
@property (nonatomic, strong) UIButton *handleButton;

@end

@implementation OrderStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.cornerView];
        [self.cornerView addSubview:self.orderNameLabel];
        [self.cornerView addSubview:self.orderTimeLabel];
        [self.cornerView addSubview:self.orderInfoLabel];
        [self.cornerView addSubview:self.diliverView];
        [self.cornerView addSubview:self.amountLabel];
        [self.cornerView addSubview:self.viewOrderButton];
        [self.cornerView addSubview:self.handleButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.mas_offset(kSixScreen(13));
        make.right.mas_equalTo(weakSelf.contentView.mas_right).with.mas_offset(kSixScreen(-13));
        make.top.baseline.mas_equalTo(weakSelf.contentView);
        
    }];
    [self.orderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.cornerView.mas_left).with.mas_offset(kSixScreen(10));
        make.top.mas_equalTo(weakSelf.cornerView.mas_top).with.mas_offset(kSixScreen(15));
        make.height.mas_equalTo(kSixScreen(16));
    }];
    [self.orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.orderNameLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.cornerView.mas_right).with.mas_offset(kSixScreen(-11));
        make.height.mas_equalTo(kSixScreen(15));
    }];
    [self.orderInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.orderNameLabel.mas_bottom).with.mas_offset(kSixScreen(13));
        make.left.mas_equalTo(weakSelf.orderNameLabel);
        make.right.mas_equalTo(weakSelf.orderTimeLabel);
    }];
    [self.diliverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.orderInfoLabel);
        make.right.mas_equalTo(weakSelf.cornerView);
        make.top.mas_equalTo(weakSelf.orderInfoLabel.mas_bottom).with.mas_offset(kSixScreen(10));
        make.height.mas_equalTo(kSixScreen(1));
    }];
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.diliverView);
        make.top.mas_equalTo(weakSelf.diliverView.mas_bottom).with.mas_offset(kSixScreen(13));
        make.height.mas_equalTo(kSixScreen(13));
    }];
    [self.viewOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.handleButton.mas_centerY);
        make.size.mas_equalTo(weakSelf.handleButton);
        make.right.mas_equalTo(weakSelf.handleButton.mas_left).with.mas_offset(kSixScreen(-19));
    }];
    [self.handleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kSixScreen(75), kSixScreen(25)));
        make.right.mas_equalTo(weakSelf.orderInfoLabel.mas_right);
        make.top.mas_equalTo(weakSelf.diliverView.mas_bottom).with.mas_offset(kSixScreen(10));
        make.bottom.mas_equalTo(weakSelf.cornerView.mas_bottom).with.mas_offset(kSixScreen(-10));
    }];
}

- (CGFloat)calculateOrderCellHeightWithOrderModel:(OrderModel *)orderModel
{
    NSString *content = [NSString stringWithFormat:@"电话: %@\n地址: %@\n商品: %@", @"", @"", @""];
    self.orderInfoLabel.text = content;
    [self.orderInfoLabel layoutIfNeeded];
    [self.orderInfoLabel sizeToFit];
    return kSixScreen(15) + kSixScreen(16) + kSixScreen(13) + CGRectGetHeight(self.orderInfoLabel.frame) + kSixScreen(10) + kSixScreen(1) + kSixScreen(10) + kSixScreen(25) + kSixScreen(10);
}

//查看订单
- (void)viewOrderButtonDidClick:(UIButton *)sender
{
    
}

//立即处理
- (void)handleButtonDidClick:(UIButton *)sender
{
    
}

#pragma mark - Lazy
- (UIView *)cornerView
{
    if (!_cornerView) {
        self.cornerView = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"ffffff"]];
        self.cornerView.layer.masksToBounds = YES;
        self.cornerView.layer.cornerRadius = kSixScreen(4);
    }
    return _cornerView;
}

- (UILabel *)orderNameLabel
{
    if (!_orderNameLabel) {
        self.orderNameLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Medium" size:kSixScreen(16)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"333333"] numberOfLines:0 textAlignment:NSTextAlignmentLeft text:@"--"];
    }
    return _orderNameLabel;
}

- (UILabel *)orderTimeLabel
{
    if (!_orderTimeLabel) {
        self.orderTimeLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(15)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"999999"] numberOfLines:0 textAlignment:NSTextAlignmentRight text:@"--"];
    }
    return _orderTimeLabel;
}

- (UILabel *)orderInfoLabel
{
    if (!_orderInfoLabel) {
        self.orderInfoLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"666666"] numberOfLines:0 textAlignment:NSTextAlignmentRight text:@"--"];
    }
    return _orderInfoLabel;
}

- (UIView *)diliverView
{
    if (!_diliverView) {
        self.diliverView = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"F4F5F5"]];
    }
    return _diliverView;
}

- (UILabel *)amountLabel
{
    if (!_amountLabel) {
        self.amountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Medium" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"FF4C32"] numberOfLines:0 textAlignment:NSTextAlignmentRight text:@"0.00"];
    }
    return _amountLabel;
}

- (UIButton *)viewOrderButton
{
    if (!_viewOrderButton) {
        self.viewOrderButton = [ComponentTools createButtonWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(13)] buttonType:UIButtonTypeCustom titleColor:[UIColor colorWithHexString:@"999999"] title:@"查看订单"];
        self.viewOrderButton.layer.masksToBounds = YES;
        self.viewOrderButton.layer.cornerRadius = kSixScreen(13);
        self.viewOrderButton.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
        self.viewOrderButton.layer.borderWidth = kSixScreen(1);
        [self.viewOrderButton addTarget:self action:@selector(viewOrderButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _viewOrderButton;
}

- (UIButton *)handleButton
{
    if (!_handleButton) {
        self.handleButton = [ComponentTools createButtonWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(13)] buttonType:UIButtonTypeCustom titleColor:[UIColor colorWithHexString:@"FF4C32"] title:@"立即处理"];
        self.handleButton.layer.masksToBounds = YES;
        self.handleButton.layer.cornerRadius = kSixScreen(13);
        self.handleButton.layer.borderColor = [UIColor colorWithHexString:@"FF4C32"].CGColor;
        self.handleButton.layer.borderWidth = kSixScreen(1);
        [self.handleButton addTarget:self action:@selector(handleButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _handleButton;
}

@end
