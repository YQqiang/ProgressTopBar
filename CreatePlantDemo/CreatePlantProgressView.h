//
//  CreatePlantProgressView.h
//  CreatePlantDemo
//
//  Created by sungrow on 2017/6/30.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CreatePlantProgressView;

typedef enum : NSUInteger {
    ProgressTypeWith20 = 0,
    ProgressTypeWith40,
    ProgressTypeWith60,
    ProgressTypeWith80,
    ProgressTypeWith100
} ProgressValueType;

@protocol CreatePlantProgressViewDelegate
@optional
- (void)createPlantProgressView:(CreatePlantProgressView *)progressView ProgressValueType:(ProgressValueType)progressValueType;

@end

@interface CreatePlantProgressView : UIView

@property (nonatomic, weak) id delegate;

@property (nonatomic, assign) ProgressValueType progressValueType;
@property (nonatomic, assign) NSInteger selectIndex;

- (instancetype)initWithFrame:(CGRect)frame progressValueType:(ProgressValueType)progressValueType selectedIndex:(NSInteger)selectedIndex;


@end
