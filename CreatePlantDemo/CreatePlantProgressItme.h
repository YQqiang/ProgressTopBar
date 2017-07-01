//
//  CreatePlantProgressItme.h
//  CreatePlantDemo
//
//  Created by sungrow on 2017/7/1.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UnProcessState,     // 未处理
    ProcessingLeading,  // 处理中-头部
    ProcessingMiddle,   // 处理中-中间
    ProcessingTrialing, // 处理中-尾部
    ProcessedLeading,   // 处理完成-头部
    ProcessedMiddle,    // 处理完成-头部
    ProcessedTrialing,  // 处理完成-尾部
    ProcessFirtDoing,   // 第一个正在处理
    ProcessLastDone     // 最后一个已经完成
} ProcessState;

@interface CreatePlantProgressItme : UIView

@property (nonatomic, assign) ProcessState processState;
@property (nonatomic, copy) NSString *processValue;

- (instancetype)initWithFrame:(CGRect)frame processState:(ProcessState)processState processValue:(NSString *)processValue;

@end
