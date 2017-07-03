//
//  ViewController.m
//  CreatePlantDemo
//
//  Created by sungrow on 2017/6/30.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ViewController.h"
#import "CreatePlantProgressItme.h"
#import "CreatePlantProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat x = 10;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * x) / 5;
    // Do any additional setup after loading the view, typically from a nib.
    CreatePlantProgressItme *progressView = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(x + 0 * width, 100, width, 40) processState:ProcessedLeading processValue:@"20%"];
    [self.view addSubview:progressView];
    CreatePlantProgressItme *progressView1 = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(x + 1 * width, 100, width, 40) processState:ProcessedTrialing processValue:@"40%"];
    [self.view addSubview:progressView1];
    CreatePlantProgressItme *progressView2 = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(x + 2 * width, 100, width, 40) processState:ProcessingMiddle processValue:@"60%"];
    [self.view addSubview:progressView2];
    CreatePlantProgressItme *progressView3 = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(x + 3 * width, 100, width, 40) processState:UnProcessState processValue:@"80%"];
    [self.view addSubview:progressView3];
    CreatePlantProgressItme *progressView4 = [[CreatePlantProgressItme alloc] initWithFrame:CGRectMake(x + 4 * width, 100, width, 40) processState:UnProcessRightRornerRadiusState processValue:@"100%"];
    [self.view addSubview:progressView4];
    
    CreatePlantProgressView *pView1 = [[CreatePlantProgressView alloc] initWithFrame:CGRectMake(10, 180, width * 5 - 2 * x, 40) progressValueType:ProgressTypeWith20];
    [self.view addSubview:pView1];
    
    CreatePlantProgressView *pView2 = [[CreatePlantProgressView alloc] initWithFrame:CGRectMake(10, 230, width * 5 - 2 * x, 40) progressValueType:ProgressTypeWith40];
    [self.view addSubview:pView2];
    
    CreatePlantProgressView *pView3 = [[CreatePlantProgressView alloc] initWithFrame:CGRectMake(10, 280, width * 5 - 2 * x, 40) progressValueType:ProgressTypeWith60];
    [self.view addSubview:pView3];
    
    CreatePlantProgressView *pView4 = [[CreatePlantProgressView alloc] initWithFrame:CGRectMake(10, 330, width * 5 - 2 * x, 40) progressValueType:ProgressTypeWith80];
    [self.view addSubview:pView4];
    
    CreatePlantProgressView *pView5 = [[CreatePlantProgressView alloc] initWithFrame:CGRectMake(10, 380, width * 5 - 2 * x, 40) progressValueType:ProgressTypeWith100];
    [self.view addSubview:pView5];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
