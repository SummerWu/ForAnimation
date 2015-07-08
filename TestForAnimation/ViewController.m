//
//  ViewController.m
//  TestForAnimation
//
//  Created by DamonNG on 15/7/2.
//  Copyright (c) 2015年 JiehaoWu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(IBAction)shakeButtonTouch:(id)sender {
    [ViewController shakeView:_mainView duration:3];
}

-(IBAction)boundButtonTouchUpInside:(id)sender {
    CABasicAnimation *boundsAnimation =
    [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:CGRectZero];
    boundsAnimation.toValue = [NSValue valueWithCGRect: _mainView.bounds];
    boundsAnimation.duration = 1;
    [_mainView.layer addAnimation:boundsAnimation forKey:@"bounds"];
}


-(IBAction)opacityButtonTouchUpInside:(id)sender {
    //透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.2];
    opacityAnimation.duration = 2;
    [_mainView.layer addAnimation:opacityAnimation forKey:@"opacity"];
}

-(IBAction)positionButtonTouchUpInside:(id)sender {
    //位置移动
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue =  [NSValue valueWithCGPoint: _mainView.layer.position];
    CGPoint toPoint = _mainView.layer.position;
    toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.duration = 2.0f;
    [_mainView.layer addAnimation:animation forKey:@"position"];
}

-(IBAction)transformRotationButtonTouchUpInside:(id)sender {
    //旋转动画
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    // 3 is the number of 360 degree rotations // Make the rotation animation duration slightly less than the other animations to give it the feel // that it pauses at its largest scale value
    rotationAnimation.duration = 2.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    [_mainView.layer addAnimation:rotationAnimation forKey:@"transform.rotation.z"];
}
-(IBAction)transformScaleButtonTouchUpInside:(id)sender {
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    rotationAnimation.duration = 2.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    [_mainView.layer addAnimation:rotationAnimation forKey:@"transform.rotation.z"];
    //缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 2.0f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.0f;
    animationGroup.autoreverses = NO;   //是否重播，原动画的倒播
    //animationGroup.repeatCount = NSNotFound;//HUGE_VALF;     //HUGE_VALF,源自math.h
    [animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
    
    //将上述两个动画编组
    [_mainView.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 视图抖动动画
+ (void)shakeView:(UIView *)view duration:(CGFloat)fDuration
{
    if (view && (fDuration >= 0.1f))
    {
        CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //设置抖动幅度
        shake.fromValue = [NSNumber numberWithFloat:-0.2];
        shake.toValue = [NSNumber numberWithFloat:+0.2];
        shake.duration = 0.1f;
        shake.repeatCount = fDuration/4/0.1f;
        shake.autoreverses = YES;
        [view.layer addAnimation:shake forKey:@"shakeView"];
    }else{}
}


@end
