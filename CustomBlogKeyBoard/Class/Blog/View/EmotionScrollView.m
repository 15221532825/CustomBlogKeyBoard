//
//  EmotionScrollView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "EmotionScrollView.h"

@interface EmotionScrollView()


@end
@implementation EmotionScrollView

-(instancetype)init {
    
    self =[super init];
    if (self) {
        [self setup];
    }
    return self;
}
+(instancetype)scrollView {
    
    EmotionScrollView * scrollView =[[ EmotionScrollView alloc]init];
    
    return scrollView;
}

-(void)setup {
    
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

@end
