//
//  DJPaymentLoadingView.m
//  djBusiness
//
//  Created by Liu on 2016/11/18.
//  Copyright © 2016年 dajie.com. All rights reserved.
//

#import "DJPaymentLoadingView.h"
#import "DJPaymentConfig.h"

#define kDegreesToRadians(degrees) ((3.14159265359 * degrees) / 180)

@interface DJPaymentLoadingView ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) double add;
@property (nonatomic, assign) CGFloat myRadius;
@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DJPaymentLoadingView

-(void)dealloc
{
    
}

- (void)setupShapeLayer
{
    [self cleanLayer];
    
    self.myRadius = self.frame.size.width * 0.5;
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.frame;
    self.shapeLayer.position = CGPointMake(self.myRadius, self.myRadius);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 1.0f;
    self.shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.shapeLayer.lineCap = @"round";
    self.shapeLayer.lineJoin = @"round";
}

- (void)setupAnimationWithPath:(CGPathRef)path loadSelector:(SEL)loadSelector interval:(CGFloat)interval
{
    self.shapeLayer.path = path;
    self.add = interval;
    [self.layer addSublayer:self.shapeLayer];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:loadSelector];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)successOrFailedAnimation
{
    if (self.shapeLayer.strokeEnd <= 1) {
        self.shapeLayer.strokeEnd += self.add;
    } else {
        [self removeDisplayLink];
    }
}

- (void)cleanLayer
{
    [self removeDisplayLink];
    [self.shapeLayer removeFromSuperlayer];
    self.shapeLayer = nil;
}

//移除定时器
- (void)removeDisplayLink
{
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)loadStatus:(DJPaymentLoadStatus)status
{
    // 配置图层
    [self setupShapeLayer];
    
    switch (status) {
        case DJPaymentLoadStatusLoading: {
            
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2) radius:self.myRadius startAngle:kDegreesToRadians(360) endAngle:kDegreesToRadians(300) clockwise:YES];
            self.shapeLayer.path = path.CGPath;
            [self.layer addSublayer:self.shapeLayer];
            //画一个圆
            CAKeyframeAnimation *strokeEndAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
            strokeEndAnimation.duration = 0.5;
            strokeEndAnimation.values = @[@0.0, @1];
            strokeEndAnimation.keyTimes = @[@0.0,@1];
            //旋转2圈
            CABasicAnimation *rotaAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotaAni.fromValue = @(kDegreesToRadians(0));
            rotaAni.toValue = @(kDegreesToRadians(720));
            rotaAni.autoreverses = YES;
            //最后填充颜色
            CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.toValue=(id)[UIColor blackColor].CGColor; //必须要用黑色
            //组合动画
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.repeatCount = INFINITY;
            group.duration = 1.5;
            group.animations = @[strokeEndAnimation,rotaAni,animation];
            [self.shapeLayer addAnimation:group forKey:@"strokeEndAnimation"];
        }
            break;
        case DJPaymentLoadStatusSuccess: {
            self.shapeLayer.strokeStart = 0;
            self.shapeLayer.strokeEnd = 0;
            self.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1.5, 1.5, self.myRadius * 2 - 3, self.myRadius * 2 - 3)];
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(5, self.height/2)];
            [path addLineToPoint:CGPointMake(9, self.height -7)];
            [path addLineToPoint:CGPointMake(self.width -5, 8)];
            
            [self.path appendPath:path];
            [self setupAnimationWithPath:self.path.CGPath loadSelector:@selector(successOrFailedAnimation) interval:0.05];
        }
            break;
        case DJPaymentLoadStatusFailed: {
            
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(5, 5)];
            [path addLineToPoint:CGPointMake(25, 25)];
            
            UIBezierPath *path1 = [UIBezierPath bezierPath];
            [path1 moveToPoint:CGPointMake(25, 5)];
            [path1 addLineToPoint:CGPointMake(5, 25)];
            
            [self.path appendPath:path];
            [self.path appendPath:path1];
            [self setupAnimationWithPath:self.path.CGPath loadSelector:@selector(successOrFailedAnimation) interval:0.015];
        }
            break;
        default:
            break;
    }
}

@end
