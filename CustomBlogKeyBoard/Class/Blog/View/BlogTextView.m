//
//  BlogTextView.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/16.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "BlogTextView.h"

@implementation BlogTextView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame: frame];

    if (self) {
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change) name:UITextViewTextDidChangeNotification object:nil];
        //垂直方向上永远可以拖拽也就是有弹簧效果
       self.alwaysBounceVertical = YES;
    }
    
    return self;
}

-(void)change {
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    
    if (self.hasText) return;
    
    NSDictionary  * attrsDict = @{NSForegroundColorAttributeName:[UIColor grayColor],
                                  NSFontAttributeName:[UIFont systemFontOfSize:12.0f]
                                 };
    
    [self.placeholder drawInRect:CGRectMake(5, 8,rect.size.width-5, rect.size.height-8) withAttributes:attrsDict];
}

-(void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}
-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}
@end
