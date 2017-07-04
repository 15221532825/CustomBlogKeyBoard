//
//  ViewController.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/16.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "ViewController.h"
#import "TitleViewLabel.h"
#import "BlogTextView.h"
#import "ComposeTool.h"
#import "CustomEmojView.h"
#import "BlogTool.h"
#import "KeyboardEmotionBtn.h"
#import "NSString+Code.h"
#import "UITextView+Extension.h"
@interface ViewController ()<UITextViewDelegate>

@property(nonatomic,retain)BlogTextView * textView;
@property(nonatomic,retain)ComposeTool * toolBar;
@property(nonatomic,retain)UIView * inputView;
@property(nonatomic,retain)CustomEmojView * emitionView ;

@property(nonatomic,assign) BOOL isShowingCunstomkeyboard;

@end

@implementation ViewController
#pragma mark--懒加载
-(CustomEmojView *)emitionView {
    
    if (!_emitionView) {
        
        _emitionView =[[ CustomEmojView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 216)];
    }
    return _emitionView;
}

#pragma  mark--initialize

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self setupBar];
    [self setupTextView];
    [self addNotification];
    [self setupToolBar];
  }

-(void)setupBar {
    
    NSString * titleString = @"发微博";
    NSString * contentString = @"Stay hungry,Stay foolish!";
    CGFloat width = 200;
    CGRect frame = CGRectMake((SCREENWIDTH - width)/2.0,20 ,width, 44);
    
    TitleViewLabel * label =[ TitleViewLabel labelWithFrame:frame titleString:titleString contentString:contentString];
    self.navigationItem.titleView = label;
}

-(void)setupTextView {
    
    self.textView =[[ BlogTextView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.textView.placeholder  = @"请输入占位文字";
    [self.textView becomeFirstResponder];
    self.textView.delegate =self;
    [self.view addSubview:self.textView];
}
-(void)setupToolBar{
    
    self.toolBar =[BlogTool toolWithBlock:^{
        
        [self swithcKeyBoard];
    }];
    
    [self.view addSubview:self.toolBar];
}

-(void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(insert:) name:INSERTNOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteClick) name:DELETENOTIFICTAION object:nil];
}

#pragma  mark--NotificationFunction

-(void)textViewWillChange:(NSNotification *)note {

     if (self.isShowingCunstomkeyboard)  return;
    
    NSDictionary * dict = note.userInfo;
    
    //动画的时间
     CGFloat animationTime = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //键盘的位置
    CGRect keyboardF =  [ dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    __block  CGRect toolBarF = self.toolBar.frame;
   
    [UIView animateWithDuration:animationTime animations:^{
        
        toolBarF.origin.y = keyboardF.origin.y - toolBarF.size.height;
    }];
    
    self.toolBar.frame = toolBarF;
}

-(void)insert:( NSNotification* )note {
    
    KeyboardEmotionBtn * emotion = note.userInfo[BTNKEY];
  
    emotion.model.code? ([self.textView insertText:emotion.model.code.emoji]):([self.textView insertAttributeText:emotion.model.png]);
}

-(void)deleteClick {
   //删除
    [self.textView deleteBackward];
}
#pragma  mark--代理方法

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
 
    [self.view endEditing:YES];
}

-(void)swithcKeyBoard {
 
     self.textView.inputView==nil ? (self.textView.inputView=self.emitionView):(self.textView.inputView=nil);
    
     self.isShowingCunstomkeyboard = YES;

     [self.textView resignFirstResponder];
    
     self.isShowingCunstomkeyboard = NO;

     [self.textView becomeFirstResponder];
}

@end
