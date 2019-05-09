//
//  WalletFooterView.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "WalletFooterView.h"

@interface WalletFooterView ()

@property(nonatomic,strong)UIButton *addBankBtn;
@property(nonatomic,strong)UIButton *withdrawalBtn;

@end

@implementation WalletFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.addBankBtn];
        [self addSubview:self.withdrawalBtn];
        [self setLoadUIView];
    }
    return self;
}

-(void)setLoadUIView{
    WEAKSELF
    [self.addBankBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(kSixScreen(45));
    }];
    [self.withdrawalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addBankBtn.mas_bottom).with.offset(kSixScreen(12));
        make.left.right.height.equalTo(weakSelf.addBankBtn);
    }];
}

-(void)AddBank_Action:(UIButton *)sender{
    
}

-(void)Withdrawal_Action:(UIButton *)sender{
    self.PushCashOutVC();
}

-(UIButton *)addBankBtn{
    if(!_addBankBtn){
        self.addBankBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addBankBtn setBackgroundImage:[UIImage imageNamed:@"btn_addcard"] forState:UIControlStateNormal];
        [self.addBankBtn addTarget:self action:@selector(AddBank_Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBankBtn;
}

-(UIButton *)withdrawalBtn{
    if(!_withdrawalBtn){
        self.withdrawalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.withdrawalBtn setBackgroundImage:[UIImage imageNamed:@"btn_addmoney"] forState:UIControlStateNormal];
        [self.withdrawalBtn addTarget:self action:@selector(Withdrawal_Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _withdrawalBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
