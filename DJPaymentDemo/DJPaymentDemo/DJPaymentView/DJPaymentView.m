//
//  DJPaymentView.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "DJPaymentView.h"
#import "DJPaymentDetailView.h"
#import "DJPaymentChooseView.h"

#define kTopSpace 250

@interface DJPaymentView ()<DJPaymentDetailViewDelegate,DJPaymentChooseViewDelegate>

@property (nonatomic, strong) UIView *bgView;                             // 载体背景视图
@property (nonatomic, strong) DJPaymentDetailView *paymentDetailView;     // 付款详情视图
@property (nonatomic, strong) DJPaymentChooseView *paymentChooseView;     // 付款方式视图

@property (nonatomic, assign) DJPaymentMethod paymentMethod;
@property (nonatomic, copy) NSString *detailInfo;
@property (nonatomic, copy) NSString *money;

@property (nonatomic, assign) CGFloat kHeight;
@end

@implementation DJPaymentView

-(void)dealloc
{
    
}

- (instancetype)initWithInfo:(NSString *)info money:(NSString *)money paymentMethod:(DJPaymentMethod)paymentMethod
{
    if (self = [super init]) {
        self.paymentMethod = paymentMethod;
        self.detailInfo = info;
        self.money = money;
    }
    return self;
}

/**
 *  显示付款视图
 */
- (void)show
{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    self.frame = kScreenBounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    _kHeight = kScreenHeight - kTopSpace;
    if (_kHeight < 300) {
        _kHeight = 300;
    }
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth * 2, _kHeight)];
    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    
    // 付款选择视图
    self.paymentDetailView = [[DJPaymentDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _kHeight)];
    self.paymentDetailView.delegate = self;
    self.paymentDetailView.chooseWaysLabel.text = self.money;
    self.paymentDetailView.detailLabel.text = self.detailInfo;
    self.paymentDetailView.payLabel.text = @"悬赏邀约500人券1张";
    if (self.paymentMethod == DJPaymentMethodPrivilegeBook) {
        
    }
    else if (self.paymentMethod == DJPaymentMethodPrivilegePoint) {
        
    }
    [self.bgView addSubview:self.paymentDetailView];
    
    // 付款方式视图
    self.paymentChooseView = [[DJPaymentChooseView alloc] init];
    self.paymentChooseView.delegate = self;
    self.paymentChooseView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, _kHeight);
    [self.bgView addSubview:self.paymentChooseView];
    
    // 动画弹出详情视图
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.transform = CGAffineTransformTranslate(self.bgView.transform, 0, -_kHeight);
    }];
}

/**
 *  销毁付款视图
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.transform = CGAffineTransformTranslate(self.bgView.transform, 0, _kHeight);
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
        
        self.paymentMethod = 0;
        self.detailInfo = nil;
        self.money = nil;
    }];
}

/**
 *  付款结果
 *
 *  @param result YES为成功
 *  @param message 提示信息
 */
- (void)paymentResult:(BOOL)result message:(NSString *)message
{
    if (result) {
        // 显示成功UI
        
    }
    else {
        // 显示失败UI
    }
}

#pragma mark - DJPaymentDetailViewDelegate
-(void)didClickCloseButton
{
    [self dismiss];
}

-(void)didClickChooseWaysLabel
{
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.transform = CGAffineTransformTranslate(self.bgView.transform, -kScreenWidth, 0);
    }];
}

#pragma mark - DJPaymentChooseViewDelegate
-(void)didClickBackButton
{
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.transform = CGAffineTransformTranslate(self.bgView.transform, kScreenWidth, 0);
    }];
}

@end
