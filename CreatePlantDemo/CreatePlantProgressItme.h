//
//  CreatePlantProgressItme.h
//  CreatePlantDemo
//
//  Created by sungrow on 2017/7/1.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UnProcessState,     // 未处理 灰色 百分比
    UnProcessRightRornerRadiusState,     // 未处理 灰色 百分比 右圆角
    ProcessingLeading,  // 处理中-头部 橘色 百分比 小圆点 左圆角
    ProcessingMiddle,   // 处理中-中间 橘色 百分比 小圆点 头部渐变橘 尾部渐变灰
    ProcessingTrialing, // 处理中-尾部 橘色 对勾 小圆点 头部渐变橘 右圆角
    ProcessedLeading,   // 处理完成-头部 蓝色 对勾 左圆角
    ProcessedMiddle,    // 处理完成-中间 蓝色 对勾 尾部渐变 对勾
    ProcessedTrialing,  // 处理完成-尾部 蓝色 对勾 尾部渐变 对勾 左圆角
    ProcessFirtDoing,   // 第一个正在处理
    ProcessFirtDone,    // 第一个处理完成
    ProcessLastDone     // 最后一个已经完成
} ProcessState;

@interface CreatePlantProgressItme : UIView

@property (nonatomic, assign) ProcessState processState;
@property (nonatomic, copy) NSString *processValue;

- (instancetype)initWithFrame:(CGRect)frame processState:(ProcessState)processState processValue:(NSString *)processValue selected:(BOOL)isSelected;

@end
