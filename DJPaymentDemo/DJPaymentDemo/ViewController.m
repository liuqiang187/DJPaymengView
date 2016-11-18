//
//  ViewController.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "ViewController.h"
#import "DJPaymentView.h"

@interface ViewController ()<DJPaymentViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [closeBtn setTitle:@"click" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(didClickCloseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    closeBtn.backgroundColor = [UIColor redColor];
}

-(void)didClickCloseButton
{
    DJPaymentView * payview = [[DJPaymentView alloc] initWithInfo:@"悬赏邀约500人1次"
                                                            money:@"特权券支付"
                                                    paymentMethod:DJPaymentMethodPrivilegeBook];
    payview.delegate = self;
    [payview show];
}

-(void)paymentComplete
{
    
}
@end
