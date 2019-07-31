//
//  YLBbarrageManager.m
//  YLBbarrage_Example
//
//  Created by yulibo on 2019/1/23.
//  Copyright © 2019年 yulibo. All rights reserved.
//

#import "YLBbarrageManager.h"

@implementation YLBbarrageManager

- (NSMutableArray *)bullet_Room_Array {
    if (!_bullet_Room_Array) {
        _bullet_Room_Array = [@[] mutableCopy];
    }
    return _bullet_Room_Array;
}

- (void)setUpData:(UIView *)bulletView bullet_Room_Array:(NSMutableArray *)bullet_Room_Array
{
    self.bulletView = bulletView;
    self.bullet_Room_Array = bullet_Room_Array;
}
- (void)resetBulletViewX:(CGFloat)X {
    CGRect frame = self.bulletView.frame;
    frame.origin.x = X;
    self.bulletView.frame = frame;
}
- (void)refreshRoomBullet:(NSTimeInterval)duration
               configData:(void (^)(void))configData
               animations:(void (^)(void))animations
               completion:(void (^ __nullable)(BOOL finished))completion {
    
    if (self.isAnimation_Room_Bullet == YES || self.bullet_Room_Array.count == 0) {
        return;
    }
    else{
        self.isAnimation_Room_Bullet = YES;
        //从右往左移动
        [self resetBulletViewX:[UIScreen mainScreen].bounds.size.width];
        
        if (configData) {
            configData();
        }
        self.bulletView.hidden = NO;
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            if (animations) {
                animations();
            }
            [self resetBulletViewX:-self.bulletView.frame.size.width];
        } completion:^(BOOL finished) {
            self.isAnimation_Room_Bullet = NO;
            [self.bullet_Room_Array removeObjectAtIndex:0];
            if (completion) {
                completion(finished);
            }
        }];
        
    }
}
@end
