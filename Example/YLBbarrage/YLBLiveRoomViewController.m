//
//  YLBLiveRoomViewController.m
//  YLBbarrage_Example
//
//  Created by yulibo on 2019/1/23.
//  Copyright © 2019年 yulibo. All rights reserved.
//

#import "YLBLiveRoomViewController.h"
#import <YLBbarrage/YLBbarrageManager.h>

@interface YLBLiveRoomViewController ()

@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, assign) BOOL canClick;

@property(nonatomic, strong) YLBbarrageManager *barrageManager;
@property(nonatomic, assign) int index;

@property(nonatomic, strong) UILabel *bulletLabel;
@property(nonatomic, strong) UIButton *resetButton;
@property(nonatomic, strong) UIButton *startButton;
@end

@implementation YLBLiveRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _canClick = YES;
    [self setUpSubviews];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)setUpSubviews {
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 50)];
    _startButton = startButton;
    startButton.center = CGPointMake(CGRectGetWidth(self.view.frame)/2.0, startButton.center.y);
    startButton.tag = 0;
    startButton.backgroundColor = UIColor.yellowColor;
    [startButton setTitle:@"显示弹幕" forState:UIControlStateNormal];
    [startButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    _resetButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(startButton.frame) + 10, CGRectGetMinY(startButton.frame), 50, 50)];
    _resetButton.tag = 1;
    _resetButton.backgroundColor = [UIColor greenColor];
    [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [_resetButton addTarget:self action:@selector(resetButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_resetButton];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [@[
                        @"弹幕1",
                        @"弹幕2",
                        @"弹幕3",
                        @"弹幕4",
                        @"弹幕5",
                        @"弹幕6",
                        ] mutableCopy];
    }
    return _dataArray;
}
- (YLBbarrageManager *)barrageManager
{
    if (!_barrageManager) {
        _barrageManager = [[YLBbarrageManager alloc] init];
    }
    return _barrageManager;
}
- (void)resetButtonMethod:(UIButton *)sender {
    self.dataArray = [@[
                        @"弹幕1",
                        @"弹幕2",
                        @"弹幕3",
                        @"弹幕4",
                        @"弹幕5",
                        @"弹幕6",
                        ] mutableCopy];
    [_startButton setTitle:@"显示弹幕" forState:UIControlStateNormal];
}
- (void)clickButton:(UIButton *)sender
{
    __weak __typeof(self)weakSelf = self;
    if (self.dataArray.count == 0) {
        [sender setTitle:@"无弹幕数据" forState:UIControlStateNormal];
        return;
    }
    if (_canClick == NO) {
        return;
    }
    _canClick = NO;
    sender.enabled = NO;
    __weak __typeof(sender)weakSender = sender;
    
    {
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(-200, 200, 200, 50)];
        _bulletLabel = bulletLabel;
        bulletLabel.backgroundColor = UIColor.orangeColor;
        bulletLabel.text = [self.dataArray objectAtIndex:0];
        bulletLabel.textAlignment = NSTextAlignmentCenter;
        bulletLabel.layer.masksToBounds = YES;
        bulletLabel.layer.cornerRadius = bulletLabel.frame.size.height/2.0;
        [self.view addSubview:bulletLabel];
        
        self.barrageManager.bullet_Room_Array = self.dataArray;
        self.barrageManager.bulletView = bulletLabel;
        __weak __typeof(bulletLabel)weakBulletLabel = bulletLabel;
        [self.barrageManager refreshRoomBullet:3.0 configData:^{
            
        } animations:^{
            
        } completion:^(BOOL finished) {
            weakSelf.canClick = YES;
            weakSender.enabled = YES;
            [weakBulletLabel removeFromSuperview];
        }];
        
    }
    
    [self showMultiLineBullet];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint touchPoint = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(((CALayer *)[_bulletLabel.layer presentationLayer]).frame, touchPoint)) {
        NSLog(@"点击弹幕");
    }
}
#pragma mark - 多条弹幕飘屏

- (void)showMultiLineBullet {
    __weak __typeof(self)weakSelf = self;
    CGFloat H = 200 + 100;
    NSMutableArray *dataArray1 = [@[
                                   @"弹幕1",
                                   @"弹幕2",
                                   @"弹幕3",
                                   @"弹幕4",
                                   @"弹幕5",
                                   @"弹幕6",
                                   ] mutableCopy];
    NSMutableArray *dataArray2 = [@[
                                   @"弹幕1",
                                   @"弹幕2",
                                   @"弹幕3",
                                   @"弹幕4",
                                   @"弹幕5",
                                   @"弹幕6",
                                   ] mutableCopy];
    NSMutableArray *dataArray3 = [@[
                                   @"弹幕1",
                                   @"弹幕2",
                                   @"弹幕3",
                                   @"弹幕4",
                                   @"弹幕5",
                                   @"弹幕6",
                                   ] mutableCopy];
    NSMutableArray *dataArray4 = [@[
                                   @"弹幕1",
                                   @"弹幕2",
                                   @"弹幕3",
                                   @"弹幕4",
                                   @"弹幕5",
                                   @"弹幕6",
                                   ] mutableCopy];
    for (int i = 0; i < 4; i++)
    {
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, H, 200, 50)];
        bulletLabel.backgroundColor = UIColor.orangeColor;
        bulletLabel.text = [dataArray1 objectAtIndex:0];
        bulletLabel.textAlignment = NSTextAlignmentCenter;
        bulletLabel.layer.masksToBounds = YES;
        bulletLabel.layer.cornerRadius = bulletLabel.frame.size.height/2.0;
        [self.view addSubview:bulletLabel];
        
        YLBbarrageManager * barrageManager = [[YLBbarrageManager alloc] init];
        barrageManager.bullet_Room_Array = dataArray1;
        barrageManager.bulletView = bulletLabel;
        __weak __typeof(bulletLabel)weakBulletLabel = bulletLabel;
        [barrageManager refreshRoomBullet:3.0 configData:^{
            
        } animations:^{
            
        } completion:^(BOOL finished) {
            [weakBulletLabel removeFromSuperview];
        }];
        H = H + 50 + 10;
    }
}

@end
