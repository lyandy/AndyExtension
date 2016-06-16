//
//  MainViewController.m
//  AndyExtension_Test
//
//  Created by 李扬 on 16/6/16.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "MainViewController.h"
#import "TestData.h"
#import "Status.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testDictToModelBtn;
@property (weak, nonatomic) IBOutlet UIButton *testArrayToModeArrayBtn;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAutoLayout];
    
    [self setupBtnEvent];
}

- (void)setupAutoLayout
{
    // 从横向中间向两侧自动布局
    CGFloat commonMargin = 100;
    
    [self.testDictToModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY).offset(-commonMargin);
    }];
    
    [self.testArrayToModeArrayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.testDictToModelBtn.centerX);
        make.centerY.equalTo(self.view.centerY).offset(commonMargin);
    }];
}

- (void)setupBtnEvent
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestData.plist" ofType:nil];
    __block NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    [[self.testDictToModelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        TestData *testData = [TestData andy_objectWithKeyValues:dict];
        AndyLog(@"%@", testData);
    }];
    
    [[self.testArrayToModeArrayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSArray *arr = dict[@"statuses"];
        NSArray *statusArr = [Status andy_objectArrayWithKeyValuesArray:arr];
        AndyLog(@"%@", statusArr);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end





























