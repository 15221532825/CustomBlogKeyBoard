//
//  ComposeTool.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/16.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "ComposeTool.h"

@implementation ComposeTool

-(instancetype)initWithFrame:(CGRect)frame {
    
    self =[ super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

-(void)setup {
    
    self.backgroundColor = [UIColor redColor];

    [self addBtnWithTitle:@"相机" Type: ComposeButtonCamera];
    [self addBtnWithTitle:@"话题" Type:ComposeButtonTopic];
    [self addBtnWithTitle:@"表情" Type:ComposeButtonEmotion];
}

-(void)addBtnWithTitle:(NSString *)title Type:(ComposeButtonType)type {
    
    UIButton * btn =[ UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.tag = type;
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat buttoW = width/self.subviews.count;
    
    for (NSInteger index=0; index < self.subviews.count; index ++) {
        
        UIButton * btn = (UIButton *)self.subviews[index];
    
        btn.frame = CGRectMake(index * buttoW, 0, buttoW, height);
    }
}
-(void)click:(UIButton *)btn {
    
    self.block(btn.tag);
}

@end
