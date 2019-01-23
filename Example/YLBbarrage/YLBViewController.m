//
//  YLBViewController.m
//  YLBbarrage
//
//  Created by ProBobo on 01/23/2019.
//  Copyright (c) 2019 ProBobo. All rights reserved.
//

#import "YLBViewController.h"
#import "YLBLiveRoomViewController.h"

@interface YLBViewController ()

@end

@implementation YLBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    YLBLiveRoomViewController *vc = [[YLBLiveRoomViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
