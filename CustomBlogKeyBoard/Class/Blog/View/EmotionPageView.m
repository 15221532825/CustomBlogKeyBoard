//
//  EmotionPageView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "EmotionPageView.h"
#import "EmotionModel.h"

#import "KeyboardEmotionBtn.h"
@implementation EmotionPageView

-(void)setRangeArray:(NSArray *)rangeArray {
    
    _rangeArray = rangeArray;
  
    for ( NSInteger index =0; index < self.rangeArray.count+1; index ++) {
    
        if (index < self.rangeArray.count) {
            KeyboardEmotionBtn * btn =[ KeyboardEmotionBtn buttonWithType:UIButtonTypeCustom];
            
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.model = self.rangeArray[index];
            [self addSubview:btn];
            
        }else {
            UIButton * btn =[ UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"删除" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
}

-(void)layoutSubviews {
    
    CGFloat btnWidth =[UIScreen mainScreen].bounds.size.width/COLUMN;
    CGFloat btnHeight = self.frame.size.height /ROW;
  
    for ( NSInteger index =0; index < self.rangeArray.count+1; index ++) {
        
        NSInteger btnRow = index /COLUMN;
        NSInteger btnColumn = index%COLUMN;
        
        if (index < self.rangeArray.count) {
            
            KeyboardEmotionBtn * btn = self.subviews[index];
            btn.frame = CGRectMake(btnColumn * btnWidth, btnRow * btnHeight, btnWidth, btnHeight);
            
        }else {
            
            UIButton * deleteBtn = self.subviews[index];
            deleteBtn.frame = CGRectMake(btnColumn * btnWidth, btnRow * btnHeight, btnWidth, btnHeight);
        }
    }
}

#pragma  mark--按钮的点击事件
-(void)btnClicked:(KeyboardEmotionBtn *)btn {
   
    [[NSNotificationCenter defaultCenter] postNotificationName:INSERTNOTIFICATION object:nil userInfo:@{BTNKEY:btn}];
}
-(void)deleteClick{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DELETENOTIFICTAION object:nil];
    
}

@end
