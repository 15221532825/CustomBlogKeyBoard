//
//  EmotionListView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "EmotionListView.h"
#import "EmotionScrollView.h"
#import "EmotionPageView.h"

@interface EmotionListView()<UIScrollViewDelegate>

@property(nonatomic,retain)UIPageControl * pageControl;
@property(nonatomic,retain)EmotionScrollView * scrollView;
@end

@implementation EmotionListView

-(instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[ UIColor magentaColor];
    }
    
    return self;
}

-(void)setEmotions:(NSArray *)emotions {
    
    _emotions = emotions;
    
    [self setup];
}

-(void)setup{

    EmotionScrollView * scrollView =[ EmotionScrollView   scrollView];
    scrollView.delegate =self;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    NSInteger page = (self.emotions.count + pageNumber -1)/pageNumber;
    
    for ( NSInteger index =0; index < page; index ++) {
        
        EmotionPageView * emotionView =[[ EmotionPageView alloc]init];
        NSRange range;
        range.location = index * pageNumber;
        NSInteger leftCount = self.emotions.count - range.location;
        
        leftCount < 20? (range = NSMakeRange(index *pageNumber, leftCount)):  (range = NSMakeRange(index * pageNumber, pageNumber));
        
        emotionView.rangeArray = [self.emotions subarrayWithRange:range];
        [self.scrollView addSubview:emotionView];
    }
    
    
    UIPageControl * pageControl =[[ UIPageControl alloc]init];
   
    pageControl.numberOfPages = page;
    
    pageControl.currentPageIndicatorTintColor =[ UIColor blackColor];
    pageControl.pageIndicatorTintColor =[ UIColor greenColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    [self.pageControl addTarget:self action:@selector(pageControlScrolled) forControlEvents:UIControlEventValueChanged];
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20);
    self.pageControl.frame = CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20);
    for ( NSInteger index =0; index <  self.scrollView.subviews.count;index ++) {
        
        EmotionPageView * emotionView = self.scrollView.subviews[index];
        emotionView.frame = CGRectMake(index * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    }
    NSInteger page = (self.emotions.count + pageNumber -1)/pageNumber;

     self.scrollView.contentSize = CGSizeMake(self.frame.size.width * page, 0);
}

#pragma  mark---代理方法

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x/self.frame.size.width;
    
    self.pageControl.currentPage = page;
}

-(void)pageControlScrolled {
    
    NSInteger page = self.pageControl.currentPage;
    
    [self.scrollView setContentOffset:CGPointMake(page * self.frame.size.width, 0) animated:YES];
}


@end
