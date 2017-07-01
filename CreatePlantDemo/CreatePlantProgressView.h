//
//  CreatePlantProgressView.h
//  CreatePlantDemo
//
//  Created by sungrow on 2017/6/30.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ProgressTypeWith20 = 0,
    ProgressTypeWith40,
    ProgressTypeWith60,
    ProgressTypeWith80,
    ProgressTypeWith100
} ProgressValueType;

@interface CreatePlantProgressView : UIView

@property (nonatomic, assign) ProgressValueType progressValueType;

- (instancetype)initWithFrame:(CGRect)frame progressValueType:(ProgressValueType)progressValueType;

@end
