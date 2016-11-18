
//  DJPaymentConfirmButton.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "DJPaymentConfirmButton.h"
#import "DJPaymentLoadingView.h"

#define kLoading_H self.height/2

@interface DJPaymentConfirmButton ()

/** loading */
@property (nonatomic, strong) DJPaymentLoadingView * loadingView;

@end

@implementation DJPaymentConfirmButton

-(void)dealloc
{
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)setPayState:(DJPaymentConfirmButtonState)payState
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.backgroundColor = kColor00b4c9;
    switch (payState) {
        case DJPaymentConfirmButtonStateCertainPay:
        {
            [self setTitle:@"确认支付" forState:UIControlStateNormal];
        }
            break;
        case DJPaymentConfirmButtonStatePayLoading:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
            [self setTitle:@"正在支付..." forState:UIControlStateNormal];
            if (!_loadingView) {
                _loadingView = [[DJPaymentLoadingView alloc] initWithFrame:CGRectMake(0, (self.height-kLoading_H)/2, kLoading_H, kLoading_H)];
                [self addSubview:_loadingView];
                _loadingView.left = self.titleLabel.left - 20;
            }
            [_loadingView loadStatus:DJPaymentLoadStatusLoading];
        }
            break;
        case DJPaymentConfirmButtonStatePaySuccess:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
            [self setTitle:@"支付成功" forState:UIControlStateNormal];
            if (_loadingView) {
                [_loadingView loadStatus:DJPaymentLoadStatusSuccess];
            }
        }
            break;
        case DJPaymentConfirmButtonStatePayNomoney:
        {
            [self setTitle:@"余额不足，无法支付" forState:UIControlStateNormal];
            self.backgroundColor = [ColorUtility colorWithHexString:@"DCDFE6"];
        }
            break;
    }
}

@end
