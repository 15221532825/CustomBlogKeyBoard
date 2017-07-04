//
//  CustomEmojView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/17.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "CustomEmojView.h"
#import "SelectedView.h"
#import "EmotionListView.h"
#import "BlogTool.h"

@interface CustomEmojView()

@property(nonatomic,strong)EmotionListView * currentView;
@property(nonatomic,strong)EmotionListView * defaultView;
@property(nonatomic,strong)EmotionListView * emojiView;
@property(nonatomic,strong)EmotionListView * lxhView;
//加载emotionView
@property(nonatomic,strong)UIView * contentView;

@end

@implementation CustomEmojView

#pragma  mark---懒加载
-(EmotionListView *)currentView {
    
    if (!_currentView) {
        _currentView = [[EmotionListView alloc]init];
    }
    return _currentView;
}
-(EmotionListView *)defaultView {
    
    if (!_defaultView) {
      
        _defaultView= [[EmotionListView alloc]init];
        _defaultView.emotions = BlogTool.defaultArray;
  
    }
    return _defaultView;
}
-(EmotionListView *)emojiView {
    
    if (!_emojiView) {
        _emojiView = [[EmotionListView alloc]init];
        _emojiView.emotions =BlogTool.emojiArray;
       
    }
    return _emojiView;
}
-(EmotionListView *)lxhView {
    
    if (!_lxhView) {
        _lxhView = [[EmotionListView alloc]init];
        _lxhView.emotions = BlogTool.lxhArray;
    }
    return _lxhView;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self =[ super initWithFrame:frame];
    
    if (self) {
        [self setupView];
    }
    return self;
}

//加载自定义的键盘view
-(void)setupView {
    
     //上面是一个listView 下面是一个继承自UIView的选择切换控件
    SelectedView * selectedView =[[ SelectedView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-30,self.frame.size.width ,30)];
    
    selectedView.clickBlock = ^(NSInteger btnTag) {
        
        [self chooseWithType:btnTag];
    };
    [self addSubview:selectedView];
    
    self.contentView =[[ UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height -selectedView.frame.size.height)];
    
    [self addSubview:self.contentView];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    EmotionListView * emotionView =[ self.contentView.subviews lastObject];
    emotionView.frame = self.contentView.bounds;
 
}
-(void)chooseWithType:(NSInteger)btnTag {
    
    //保证只有一个在contentView上面
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    switch (btnTag) {
            
        case selectedCurrent:
            [self.contentView addSubview:self.currentView];
            
            break;
            
        case selectedEmotion:
            [self.contentView addSubview:self.defaultView];
            break;
            
        case selectedCustiom:
            [self.contentView addSubview:self.emojiView];
            break;
            
        case selectedLxh:
            [self.contentView addSubview:self.lxhView];
            break;
            
        default:
            break;
    }
    
    [self setNeedsLayout];
}

 
@end
