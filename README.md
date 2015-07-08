# ForAnimation
CALayer的各种动画效果

# Introduce
IOS--CALayer实现，界限、透明度、位置、旋转、缩放组合动画

基于框架：QuartzCore.framework
//抖动<br>
CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
<br>//设置抖动幅度        
<br>shake.fromValue = [NSNumber numberWithFloat:-0.2];
<br>shake.toValue = [NSNumber numberWithFloat:+0.2];
<br>shake.duration = 0.1f;
<br>shake.repeatCount = fDuration/4/0.1f;        
<br>shake.autoreverses = YES;

<br><br>效果如下：
<br><br>
![](http://s4.sinaimg.cn/mw690/0028NHt6gy6TGgqchjl33&690)
<br><br>
<br>//界限
<br>CABasicAnimation *boundsAnimation = [CABasicAnimationanimationWithKeyPath:@"bounds"];boundsAnimation.fromValue = [NSValue valueWithCGRect:CGRectZero];boundsAnimation.toValue = [NSValue valueWithCGRect: layer.bounds];
<br>效果如下：
<br><br>
![](http://s7.sinaimg.cn/mw690/0028NHt6gy6TGgf0eY6b6&690)
<br><br>

<br>//透明度变化CABasicAnimation *opacityAnimation = [CABasicAnimationanimationWithKeyPath:@"opacity"];opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];opacityAnimation.toValue = [NSNumber numberWithFloat:0.5];
<br><br>效果如下：
<br><br>
![](http://s16.sinaimg.cn/mw690/0028NHt6gy6TGgthC1h2f&690)
<br><br>
<br>//位置移动
<br>CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];animation.fromValue =  [NSValue valueWithCGPoint: layer.position];CGPoint toPoint = layer.position;toPoint.x += 180;animation.toValue = [NSValue valueWithCGPoint:toPoint];
<br><br>效果如下：
<br><br>
![](http://s5.sinaimg.cn/mw690/0028NHt6gy6TGgyCSj264&690)
<br><br>
<br>//旋转动画CABasicAnimation* rotationAnimation =       [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];     // 3 is the number of 360 degree rotations // Make the rotation animation duration slightly less than the other animations to give it the feel // that it pauses at its largest scale valuerotationAnimation.duration = 2.0f;rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
<br><br>效果如下：
<br><br>
![](http://s4.sinaimg.cn/mw690/0028NHt6gy6TGgGs42753&690)
<br><br>

<br>//旋转＋缩放动画
CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];scaleAnimation.duration = 2.0f;scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
CAAnimationGroup *animationGroup = [CAAnimationGroup animation];animationGroup.duration = 2.0f;animationGroup.autoreverses = YES;   //是否重播，原动画的倒播animationGroup.repeatCount = NSNotFound;//HUGE_VALF;     //HUGE_VALF,源自math.h[animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
//将上述两个动画编组[layer addAnimation:animationGroup forKey:@"animationGroup"];
<br><br>效果如下：
<br><br>
![](http://s9.sinaimg.cn/mw690/0028NHt6gy6TGgJTGXu28&690)
<br><br>
//去掉所有动画[layer removeAllAnimations];
<br>//去掉key动画[layer removeAnimationForKey:@"animationGroup"];
<br>上面的gif动图效果不太好，运行看下效果吧。
<br><br>配套的博客
http://blog.sina.com.cn/s/blog_74f6a6700102vvfv.html
