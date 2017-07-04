//
//  KeyboardEmotionBtn.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/21.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "KeyboardEmotionBtn.h"
#import "NSString+Code.h"
@implementation KeyboardEmotionBtn

-(void)setModel:(EmotionModel *)model {
    _model = model;
    if (model.code) {
        
        [self setTitle:model.code.emoji forState:UIControlStateNormal];
    }else {
        
        [self setImage:[UIImage imageNamed:model.png] forState:UIControlStateNormal];
    }
    //设置高亮状态下不自动调整图片
    
    self.adjustsImageWhenHighlighted = NO;
}
@end
