//
//  SelectedView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "SelectedView.h"
#import "EmotionBtn.h"
@interface SelectedView()

@end

@implementation SelectedView


-(instancetype)initWithFrame:(CGRect)frame {
    
    self =[ super initWithFrame: frame];
    if (self) {
    
        [self setup];
    }
    
    return self;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat height = self.frame.size.height;
    CGFloat width =[UIScreen mainScreen].bounds.size.width/count;
    
    for (NSInteger index = 0;index < self.subviews.count; index ++) {
        EmotionBtn  * btn = self.subviews[index];
        btn.frame = CGRectMake(index * width, 0, width, height - 5);
    }
}
-(void)setup {
  
    [self btnWithTitle:@"最近" type:selectedCurrent];
    [self btnWithTitle:@"表情" type:selectedCustiom];
    [self btnWithTitle:@"默认" type:selectedEmotion];
    [self btnWithTitle:@"浪小花"type:selectedLxh];
}

-(EmotionBtn * )btnWithTitle:(NSString * )title type:(SelectedType)type {
    EmotionBtn * btn =[[ EmotionBtn alloc]init];
    btn.tag = type;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
}

-(void)click:(UIButton *)btn {
    
    if (self.clickBlock){
        self.clickBlock(btn.tag);
    }
}

@end
