//
//  CreatePlantProgressView.m
//  CreatePlantDemo
//
//  Created by sungrow on 2017/6/30.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "CreatePlantProgressView.h"
#import "CreatePlantProgressItme.h"

@interface CreatePlantProgressView()

@property (nonatomic, assign) NSInteger currentSelectIndex;

@end

@implementation CreatePlantProgressView

- (instancetype)initWithFrame:(CGRect)frame progressValueType:(ProgressValueType)progressValueType selectedIndex:(NSInteger)selectedIndex {
    if (self = [super initWithFrame:frame]) {
        self.progressValueType = progressValueType;
        self.currentSelectIndex = selectedIndex;
        [self creatUI];
    }
    
    return self;
}

- (void)creatUI {
    CGFloat itemWidth = CGRectGetWidth(self.frame) * 0.2;
    CGFloat itemHeight = CGRectGetHeight(self.frame);
    ProcessState processState = ProcessedLeading;
    for (int i = 0; i < 5; i ++) {
        if (i == self.progressValueType - 1) {
            processState = ProcessedTrialing;
        } else if (i < self.progressValueType) {
            processState = ProcessedMiddle;
        } else if (i == self.progressValueType) {
            processState = ProcessingMiddle;
        } else {
            processState = UnProcessState;
        }
        
        if (i == 0 && self.progressValueType != ProgressTypeWith40) {
            processState = ProcessedLeading;
        }
        if (i == 0 && self.progressValueType == ProgressTypeWith40) {
            processState = ProcessFirtDone;
        }
        if (i == 4) {
            processState = UnProcessRightRornerRadiusState;
        }
        
        if (self.progressValueType == ProgressTypeWith20 && i == 0) {
            processState = ProcessFirtDoing;
        }
        if (self.progressValueType == ProgressTypeWith100 && i == 4) {
            processState = ProcessLastDone;
        }
        CreatePlantProgressItme *item = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, itemHeight) processState:processState processValue:[NSString stringWithFormat:@"%zd%%", (i + 1) * 20] selected:(self.currentSelectIndex == i)];
        item.tag = 2017 + i;
        if (i <= self.progressValueType) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
            [item addGestureRecognizer:tap];
        }
        [self addSubview:item];
    }
}

- (void)tapGestureAction:(UIGestureRecognizer *)tap {
    if (self.currentSelectIndex == tap.view.tag - 2017) return;
    if ([self.delegate respondsToSelector:@selector(createPlantProgressView:ProgressValueType:)]) {
        self.currentSelectIndex = tap.view.tag - 2017;
        [self.delegate createPlantProgressView:self ProgressValueType:self.currentSelectIndex];
    }
}

@end
