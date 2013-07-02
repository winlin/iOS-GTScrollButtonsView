//
//  GTScrollButtonsView.m
//  SelfTestPro
//
//  Created by gtliu on 7/1/13.
//  Copyright (c) 2013 gtliu. All rights reserved.
//

#import "GTScrollButtonsView.h"

@interface GTScrollButtonsView ()

@end

@implementation GTScrollButtonsView
@synthesize buttonNumber;
@synthesize currentButtonIndex;
@synthesize buttonWidth;
@synthesize buttonHeight;
@synthesize buttonSpace;
@synthesize gtDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        buttonHeight = frame.size.height * GT_BUTTON_HEIGHT_RATE;
        buttonWidth = GT_BUTTON_WIDTH;
        buttonSpace = GT_BUTTON_SPACE;
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void)resetScrollView
{
    for (UIView *one in self.subviews) {
        [one removeFromSuperview];
    }
}

-(void)moveToButtonWithIndex:(NSUInteger)butInedex
{
    int tmp = butInedex > 0 ? butInedex : 0;
    tmp = tmp > buttonNumber ? buttonNumber : tmp;
    CGFloat x = tmp * (buttonWidth + buttonSpace) + buttonWidth/2.0;
    CGFloat scrollWidth = self.frame.size.width / 2.0;
    CGPoint curOffset = self.contentOffset;    
    CGFloat sub = curOffset.x + scrollWidth - x;
    curOffset.x -= sub;
    if (curOffset.x < 0) {
        curOffset.x = 0;
    }
    [self setContentOffset:curOffset animated:YES];
}

-(void)setButtonNumber:(NSInteger)butNumber InitIndex:(NSUInteger)initIndex
{
    [self resetScrollView];
    buttonNumber = butNumber;
    CGFloat contentWidth = buttonNumber * (buttonWidth + buttonSpace) - buttonSpace;
    [self setContentSize:CGSizeMake(contentWidth, self.frame.size.height)];
    
    for (int i = 0; i < buttonNumber; ++i) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [but addTarget:self action:@selector(buttonDownHandle:) forControlEvents:UIControlEventTouchUpInside];
        but.tag = i + 1;
        CGFloat x = i * (buttonWidth + buttonSpace);
        [but setFrame:CGRectMake(x, 0, buttonWidth, buttonHeight)];
        [but setTitle:[NSString stringWithFormat:@"%d", but.tag] forState:UIControlStateNormal];
        [self addSubview:but];
    }
    [self moveToButtonWithIndex:initIndex - 1];
}

-(IBAction)buttonDownHandle:(UIButton *)sender
{
    [self moveToButtonWithIndex:sender.tag - 1];
    if ([gtDelegate respondsToSelector:@selector(selectedButDown:)]) {
        [gtDelegate selectedButDown:sender];
    }
}

@end
