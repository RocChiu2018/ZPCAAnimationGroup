//
//  ViewController.m
//  CAAnimationGroup
//
//  Created by apple on 2016/11/24.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 用CAAnimationGroup类来在一个控件上完成多个动画。
 */
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //创建动画组对象
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    //旋转动画
    CABasicAnimation *rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation";
    rotate.toValue = [NSNumber numberWithFloat:M_PI];
    
    //缩放动画
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = [NSNumber numberWithFloat:0.0];
    
    /**
     设置动画组：
     哪个在前哪个在后无所谓，因为系统会同时执行两个动画。
     */
    animationGroup.animations = [NSArray arrayWithObjects:rotate, scale, nil];
    animationGroup.duration = 2.0;
    
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:animationGroup forKey:nil];
}

@end
