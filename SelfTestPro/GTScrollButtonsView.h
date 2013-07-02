//
//  GTScrollButtonsView.h
//  SelfTestPro
//
//  Created by gtliu on 7/1/13.
//  Copyright (c) 2013 gtliu. All rights reserved.
//

#define GT_BUTTON_HEIGHT_RATE      0.9
#define GT_BUTTON_WIDTH            50.0
#define GT_BUTTON_SPACE            4.0

#import <UIKit/UIKit.h>

@protocol GTScrollButtonsViewDelegate <NSObject>
-(void)selectedButDown:(UIButton *)sender;
@end

@interface GTScrollButtonsView : UIScrollView

@property(assign)id<GTScrollButtonsViewDelegate> gtDelegate;
@property(assign, nonatomic)NSInteger buttonNumber;
@property(assign, nonatomic)NSInteger currentButtonIndex;
@property(assign, nonatomic)CGFloat buttonWidth;
@property(assign, nonatomic)CGFloat buttonHeight;
@property(assign, nonatomic)CGFloat buttonSpace;

-(void)setButtonNumber:(NSInteger)butNumber InitIndex:(NSUInteger)initIndex;
-(void)moveToButtonWithIndex:(NSUInteger)butInedex;

@end
