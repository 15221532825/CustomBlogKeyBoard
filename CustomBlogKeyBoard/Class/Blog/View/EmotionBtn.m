//
//  EmotionBtn.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "EmotionBtn.h"

@implementation EmotionBtn
-(instancetype)init {
    self =[super init];
    if (self) {
         [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    
}
@end
