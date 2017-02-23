//
//  AGAlertListView.h
//  AlertListView
//
//  Created by Angelo on 17/2/23.
//  Copyright © 2017年 Angelo. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 
 选择列表:类似于 UIAlert 弹出效果
 使用 PickerView 实现选择内容的显示,通过初始化方法传入 options 选项数组实现数据的加载.
 完成选择后,通过点击空白或 '取消' 或 '确定' 实现选择页面消失或选中.
 通过代理实现回调.
 
 */



@protocol AGAlertListDelegate <NSObject>

/**
 点击确定按钮

 @param index 选中的选项编号
 @param option 选中的文字内容
 */
- (void)ag_selectWithIndes:(NSInteger) index option:(NSString*)option;

@end


@interface AGAlertListView : UIView

@property (nonatomic , weak) id<AGAlertListDelegate> delegate;


/**
 初始化对想

 @param options 列表数据
 @return 当前对象
 */
- (instancetype)initWithOptions:(NSArray<NSString*>*)options;

/**
 移除当前选择器
 */
- (void)ag_dismiss;

@end