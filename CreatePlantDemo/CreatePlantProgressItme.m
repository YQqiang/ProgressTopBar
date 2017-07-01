//
//  CreatePlantProgressItme.m
//  CreatePlantDemo
//
//  Created by sungrow on 2017/7/1.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "CreatePlantProgressItme.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface CreatePlantProgressItme()

@property (nonatomic, strong) UIButton *titleBtn;

@end

@implementation CreatePlantProgressItme

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, 80, 30);
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame processState:(ProcessState)processState processValue:(NSString *)processValue {
    if (self = [super initWithFrame:frame]) {
        self.processState = processState;
        self.processValue = processValue;
        [self createUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createUI];
}

- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    CGFloat space = 0;
    CGFloat lineHeight = 3;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat radius = (width - 2 * space) * 0.16;
    CGFloat controlPointY = 3.2;
    CGFloat startAngle = M_PI * 0.2;
    CGFloat endAngle = M_PI - startAngle;
    
    UIColor *doneColor = RGB(0, 158, 238);
    UIColor *doingColor = RGB(247, 141, 97);
    //    UIColor *lightDoneColor = RGB(105, 153, 171);
    UIColor *lightDoingColor = RGB(184, 147, 127);
    UIColor *unDoColor = RGB(212, 213, 214);
    
    UIColor *overalColor = doneColor;
    UIColor *leadingGradientColor = nil;
    UIColor *trailingGradientColor = nil;
    
    switch (self.processState) {
        case UnProcessState:
            overalColor = unDoColor;
            break;
        case ProcessingLeading:
            overalColor = doingColor;
            leadingGradientColor = doingColor;
            trailingGradientColor = unDoColor;
            break;
        case ProcessingMiddle:
            overalColor = doingColor;
            leadingGradientColor = lightDoingColor;
            trailingGradientColor = unDoColor;
            break;
        case ProcessingTrialing:
            overalColor = doingColor;
            break;
        case ProcessedLeading:
            overalColor = doneColor;
            break;
        case ProcessedMiddle:
            overalColor = doneColor;
            break;
        case ProcessedTrialing:
            overalColor = doneColor;
            trailingGradientColor = lightDoingColor;
            break;
        case ProcessFirtDoing:
            overalColor = doingColor;
            trailingGradientColor = unDoColor;
            break;
        case ProcessLastDone:
            overalColor = doingColor;
            leadingGradientColor = lightDoingColor;
            break;
        default:
            break;
    }
    // 路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width * 0.5, lineHeight) radius: radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addQuadCurveToPoint:CGPointMake((width - 2 * space) * 0.25 + space, lineHeight) controlPoint:CGPointMake(width * 0.32, controlPointY)];
    [path addLineToPoint:CGPointMake(space, lineHeight)];
    [path addLineToPoint:CGPointMake(space, 0)];
    [path addLineToPoint:CGPointMake(width - space, 0)];
    [path addLineToPoint:CGPointMake(width - space, lineHeight)];
    [path addLineToPoint:CGPointMake( width - (width - 2 * space) * 0.25 - space, lineHeight)];
    double endX = cos(startAngle) * radius + (width * 0.5);
    double endY = sin(startAngle) * radius + lineHeight;
    [path addQuadCurveToPoint:CGPointMake(endX, endY) controlPoint:CGPointMake(width * 0.68, controlPointY)];
    
    // 绘制路径图层
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.frame = self.bounds;
    backLayer.fillColor =  overalColor.CGColor;
    backLayer.strokeColor  = overalColor.CGColor;
    backLayer.lineWidth = 1;
    backLayer.path = [path CGPath];
//    backLayer.strokeEnd = 5;
    [self.layer addSublayer:backLayer];
    
    // 颜色渐变
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    NSMutableArray *colors = [NSMutableArray array];
    [colors addObject:(id)overalColor.CGColor];
    if (trailingGradientColor) {
        [colors addObject:(id)trailingGradientColor.CGColor];
    } else {
        [colors addObject:(id)overalColor.CGColor];
    }
    if (leadingGradientColor) {
        [colors insertObject:(id)leadingGradientColor.CGColor atIndex:0];
    }
    
    [gradientLayer setColors:colors];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    if (colors.count == 2) {
        gradientLayer.locations = @[@0.7];
    } else if (colors.count == 3) {
        gradientLayer.locations = @[@0.1, @0.7];
    }
    [self.layer addSublayer:gradientLayer];
    [gradientLayer setMask:backLayer];
    
    // 黄色圆圈(标识正在处理)
    if (self.processState == ProcessingTrialing || self.processState == ProcessingMiddle || self.processState == ProcessingLeading || self.processState == ProcessLastDone || self.processState == ProcessFirtDoing) {
        CGFloat cycleRadius = 3;
        UIView *cycleView = [[UIView alloc] init];
        cycleView.backgroundColor = RGB(247, 141, 97);
        [self addSubview:cycleView];
        cycleView.frame = CGRectMake(width * 0.5 - cycleRadius, lineHeight + radius + cycleRadius, cycleRadius * 2, cycleRadius * 2);
        cycleView.layer.cornerRadius = cycleRadius;
    }
    
    self.titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:8];
    [self addSubview:self.titleBtn];
    [self.titleBtn sizeToFit];
    CGPoint titleBtnCenter = self.titleBtn.center;
    titleBtnCenter.x = self.center.x - 5;
    titleBtnCenter.y = lineHeight + 5;
    self.titleBtn.center = CGPointMake(width * 0.5, lineHeight + 3);
    if (self.processState == ProcessedLeading || self.processState == ProcessedMiddle || self.processState == ProcessedTrialing || self.processState == ProcessLastDone) {
        // 已完成的步骤显示√
        UIBezierPath *gouPath = [UIBezierPath bezierPath];
        [gouPath moveToPoint:CGPointMake(12, CGRectGetHeight(self.titleBtn.frame) * 0.5 + 0)];
        [gouPath addLineToPoint:CGPointMake(CGRectGetWidth(self.titleBtn.frame) * 0.5, CGRectGetHeight(self.titleBtn.frame) - 8)];
        [gouPath addLineToPoint:CGPointMake(CGRectGetWidth(self.titleBtn.frame) - 10, 8)];
        CAShapeLayer *gouLayer = [CAShapeLayer layer];
        gouLayer.path = gouPath.CGPath;
        gouLayer.frame = self.titleBtn.bounds;
        gouLayer.lineWidth = 1.5;
        gouLayer.lineCap = @"round";
        gouLayer.lineJoin = @"round";
        gouLayer.fillColor = [UIColor clearColor].CGColor;
        gouLayer.strokeColor = [UIColor whiteColor].CGColor;
        [self.titleBtn.layer addSublayer:gouLayer];
        
    } else {
        [self.titleBtn setTitle:self.processValue forState:UIControlStateNormal];
    }
}

- (void)drawRect:(CGRect)rect {
    
}

@end
