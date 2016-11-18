//
//  DJPaymentDetailView.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "DJPaymentDetailView.h"
#import "DJPaymentConfirmButton.h"

@interface DJPaymentDetailView ()
@property (nonatomic, strong) UILabel * paymentLabel;
@property (nonatomic, strong) UIView * infoStyleView;
@property (nonatomic, strong) UIView * topLine;
@property (nonatomic, strong) UIView * line1;
@property (nonatomic, strong) UIView * line2;
/** confirm */
@property (nonatomic, strong) DJPaymentConfirmButton * confirmBtn;
@end

@implementation DJPaymentDetailView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubviews];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    frame.size.width = kScreenWidth;
    [super setFrame:frame];
}

-(void)createSubviews
{
    //top
    UIButton * closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kPad, (44-kPad)/2, kPad, kPad)];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(didClickCloseButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = @"支付详情";
    titleLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [titleLabel sizeToFit];
    titleLabel.centerX = self.centerX;
    titleLabel.top = closeBtn.top;
    [self addSubview:titleLabel];
    
    UILabel * exchangeBtn = [[UILabel alloc] initWithFrame:CGRectZero];
    exchangeBtn.text = @"积分兑换";
    exchangeBtn.textColor = kColor00b4c9;
    exchangeBtn.font = [UIFont systemFontOfSize:14];
    [exchangeBtn sizeToFit];
    exchangeBtn.top = titleLabel.top;
    exchangeBtn.right = self.right - kPad;
    [self addSubview:exchangeBtn];
    exchangeBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapExchange = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickExchangeButton)];
    [exchangeBtn addGestureRecognizer:tapExchange];
    
    _topLine = [ViewCreatorHelper lineWithWidth:kScreenWidth];
    [self addSubview:_topLine];
    
    //详情
    UILabel * infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    infoLabel.text = @"订单详情";
    infoLabel.textColor = [ColorUtility colorWithHexString:@"bbbbbb"];
    infoLabel.font = [UIFont systemFontOfSize:14];
    [infoLabel sizeToFit];
    infoLabel.left = kPad;
    infoLabel.height = 49;
    infoLabel.top = 44;
    [self addSubview:infoLabel];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _detailLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    _detailLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_detailLabel];
    
    //方式
    _infoStyleView = [[UIView alloc] initWithFrame:CGRectMake(0, infoLabel.bottom, self.width, 70)];
    [self addSubview:_infoStyleView];
    UILabel * waysLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    waysLabel.text = @"付款方式";
    waysLabel.textColor = [ColorUtility colorWithHexString:@"bbbbbb"];
    waysLabel.font = [UIFont systemFontOfSize:14];
    [waysLabel sizeToFit];
    waysLabel.left = kPad;
    waysLabel.top = kPad;
    [self.infoStyleView addSubview:waysLabel];
    
    _chooseWaysLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _chooseWaysLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    _chooseWaysLabel.font = [UIFont systemFontOfSize:14];
    _chooseWaysLabel.top = waysLabel.top;
    [self.infoStyleView addSubview:_chooseWaysLabel];
    _chooseWaysLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapChoosePay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickChooseWaysButton)];
    [_chooseWaysLabel addGestureRecognizer:tapChoosePay];
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _tipLabel.textColor = [ColorUtility colorWithHexString:@"bbbbbb"];
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.text = @"需消耗1张500人选上邀约券，当前剩余1张";
    [_tipLabel sizeToFit];
    _tipLabel.top = waysLabel.bottom +5;
    [self.infoStyleView addSubview:_tipLabel];
    _tipLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapChoosePay1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickChooseWaysButton)];
    [_tipLabel addGestureRecognizer:tapChoosePay1];
    
    _orangeTip = [[UILabel alloc] initWithFrame:CGRectZero];
    _orangeTip.textColor = [ColorUtility colorWithHexString:@"FF6100"];
    _orangeTip.font = [UIFont systemFontOfSize:12];
    _orangeTip.text = @"可通过积分兑换悬赏邀约1次券";
    [_orangeTip sizeToFit];
    _orangeTip.top = _tipLabel.bottom +5;
    _orangeTip.hidden = YES;
    [self.infoStyleView addSubview:_orangeTip];
    
    
    _line1 = [ViewCreatorHelper lineWithWidth:kScreenWidth -kPad*2];
    [self.infoStyleView addSubview:_line1];
    
    _line2 = [ViewCreatorHelper lineWithWidth:kScreenWidth -kPad*2];
    [self.infoStyleView addSubview:_line2];
    
    //付款
    _paymentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _paymentLabel.text = @"需付款";
    _paymentLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    _paymentLabel.font = [UIFont systemFontOfSize:14];
    [_paymentLabel sizeToFit];
    _paymentLabel.left = kPad;
    _paymentLabel.height = 49;
    [self addSubview:_paymentLabel];
    
    _payLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _payLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    _payLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    [self addSubview:_payLabel];
    
    //confirm
    _confirmBtn = [[DJPaymentConfirmButton alloc] initWithFrame:CGRectMake(kPad, self.height-64, self.width-kPad*2, 44)];
    _confirmBtn.payState = DJPaymentConfirmButtonStateCertainPay;
    [_confirmBtn addTarget:self action:@selector(didClickConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmBtn];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _topLine.top = 44;
    
    [_detailLabel sizeToFit];
    _detailLabel.right = self.right - kPad*2;
    _detailLabel.height = 49;
    _detailLabel.top = _topLine.bottom;
    if (_detailLabel.width > self.width - kPad*3 - 70) {
        _detailLabel.width = self.width - kPad*3 - 70;
    }
    
    
    [_chooseWaysLabel sizeToFit];
    _chooseWaysLabel.right = self.right - kPad*2;
    if (_chooseWaysLabel.width > self.width - kPad*3 - 70) {
        _chooseWaysLabel.width = self.width - kPad*3 - 70;
    }
    
    _tipLabel.right = self.right - kPad*2;
    if (_tipLabel.width > self.width - kPad*3) {
        _tipLabel.width = self.width - kPad*3;
    }
    
    _orangeTip.right = self.right - kPad*2;
    if (_orangeTip.width > self.width - kPad*3) {
        _orangeTip.width = self.width - kPad*3;
    }
    
    _line1.top = 0;
    _line1.left = kPad;
    _line2.bottom = _infoStyleView.height;
    _line2.left = kPad;
    
    _paymentLabel.top = _infoStyleView.bottom;
    _payLabel.top = _paymentLabel.top;

    [_payLabel sizeToFit];
    _payLabel.right = self.right - kPad*2;
    _payLabel.height = 49;
    if (_payLabel.width > self.width - kPad*3 - 70) {
        _payLabel.width = self.width - kPad*3 - 70;
    }
}

#pragma mark - setter
-(void)setInfoStyle:(DJPaymentDetailInfoStyle)infoStyle
{
    if (infoStyle == DJPaymentDetailInfoStyleNoMoney) {
        _infoStyleView.height = 90;
        _orangeTip.hidden = NO;
    }
    else{
        _infoStyleView.height = 70;
        _orangeTip.hidden = YES;
    }
    [self layoutIfNeeded];
}

#pragma mark - buttonClick
-(void)didClickCloseButton
{
    if ([self.delegate respondsToSelector:@selector(didClickCloseButton)]){
        [self.delegate didClickCloseButton];
    }
}

-(void)didClickChooseWaysButton
{
    if ([self.delegate respondsToSelector:@selector(didClickChooseWaysLabel)]){
        [self.delegate didClickChooseWaysLabel];
    }
}

-(void)didClickExchangeButton
{
    self.infoStyle = DJPaymentDetailInfoStyleNoMoney;
}

-(void)didClickConfirmButton
{
//    self.infoStyle = DJPaymentDetailInfoStyleDefault;
    _confirmBtn.payState = DJPaymentConfirmButtonStatePayLoading;
    [self performSelector:@selector(toboSuccess) withObject:nil afterDelay:4];
}

-(void)toboSuccess
{
    _confirmBtn.payState = DJPaymentConfirmButtonStatePaySuccess;
}
@end
