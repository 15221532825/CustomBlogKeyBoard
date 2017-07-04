
//
//  TitleViewLabel.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/16.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "TitleViewLabel.h"

@implementation TitleViewLabel

+(instancetype)labelWithFrame:(CGRect)frame titleString:(NSString *)titleString contentString:(NSString *)contentString {
    
    TitleViewLabel * label =[[ self alloc]initWithFrame:frame];
    label.textAlignment =NSTextAlignmentCenter;
    label.numberOfLines = 0;
    NSString * totalString =[NSString stringWithFormat:@"%@\n%@",titleString,contentString];
    NSMutableAttributedString * attributeString =[[ NSMutableAttributedString alloc]initWithString: totalString];
    NSRange stringRange = [totalString rangeOfString:contentString];
    
    NSDictionary * dict = @{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]};
    [attributeString setAttributes:dict range:stringRange];
    
    label.attributedText = attributeString;
     
    return label;
}

@end
