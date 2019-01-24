//
//  YLBbarrageManager.h
//  YLBbarrage_Example
//
//  Created by yulibo on 2019/1/23.
//  Copyright © 2019年 yulibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBbarrageManager : NSObject

@property(nonatomic, weak) UIView *bulletView;/**< 弹幕显示界面*/
@property(nonatomic, strong) NSMutableArray *bullet_Room_Array;/**< 弹幕数据源*/
@property(nonatomic, assign) BOOL isAnimation_Room_Bullet;/**< 是否在动画中*/
@property(nonatomic, copy) void (^configData)(void);/**< 配置数据*/

/**
 弹幕动画
 */
- (void)refreshRoomBullet:(NSTimeInterval)duration
               configData:(void (^)(void))configData
               animations:(void (^)(void))animations
               completion:(void (^ __nullable)(BOOL finished))completion;
@end

NS_ASSUME_NONNULL_END
