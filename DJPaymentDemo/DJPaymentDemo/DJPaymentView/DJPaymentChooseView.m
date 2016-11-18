//
//  DJPaymentChooseView.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "DJPaymentChooseView.h"
#import "DJPaymentChooseSingleView.h"

@interface DJPaymentChooseView ()

@property (nonatomic, strong) UIView * topLine;

@end

@implementation DJPaymentChooseView

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
    [closeBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(didClickCloseButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = @"选择支付方式";
    titleLabel.textColor = [ColorUtility colorWithHexString:@"5A5F6D"];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [titleLabel sizeToFit];
    titleLabel.centerX = self.centerX;
    titleLabel.top = closeBtn.top;
    [self addSubview:titleLabel];
    
    _topLine = [ViewCreatorHelper lineWithWidth:kScreenWidth];
    [self addSubview:_topLine];
    _topLine.bottom = 44;
    
    DJPaymentChooseSingleView * view1 = [[DJPaymentChooseSingleView alloc] initWithFrame:CGRectMake(0, 45, kScreenWidth, 70)];
    [self addSubview:view1];
    view1.iconImg.image = [UIImage imageNamed:@"icon_quan"];
    view1.titleLabel.text = @"特权券支付";
    view1.subTitleLabel.text = @"需消耗1张500人选上邀约券，当前剩余1张";
    view1.line.hidden = NO;
    
    DJPaymentChooseSingleView * view2 = [[DJPaymentChooseSingleView alloc] initWithFrame:CGRectMake(0, view1.bottom, kScreenWidth, 70)];
    [self addSubview:view2];
    view2.iconImg.image = [UIImage imageNamed:@"icon_dianshu"];
    view2.titleLabel.text = @"特权点数支付";
    view2.subTitleLabel.text = @"需消耗1点，当前特权点数300点";
}

-(void)didClickCloseButton
{
    if ([self.delegate respondsToSelector:@selector(didClickBackButton)]){
        [self.delegate didClickBackButton];
    }
}

@end
