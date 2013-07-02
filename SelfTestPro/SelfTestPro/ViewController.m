//
//  ViewController.m
//  SelfTestPro
//
//  Created by gtliu on 6/4/13.
//  Copyright (c) 2013 gtliu. All rights reserved.
//

#import "ViewController.h"
#import "GTScrollButtonsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    GTScrollButtonsView *scrollView = [[GTScrollButtonsView alloc] initWithFrame:CGRectMake(5, 20, 310, 50)];
    [scrollView setButtonNumber:30 InitIndex:12];
    [self.view addSubview:scrollView];    
}

-(IBAction)selectButDown:(id)sender
{
    UIButton *but = sender;
    NSLog(@"button tag=%d", but.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
