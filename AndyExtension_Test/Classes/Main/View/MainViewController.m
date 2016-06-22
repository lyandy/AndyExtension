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

@property (weak, nonatomic) IBOutlet UIButton *testStringToModelBtn;
@property (weak, nonatomic) IBOutlet UIButton *testFileNameToModelBtn;
@property (weak, nonatomic) IBOutlet UIButton *testFilePathToModelBtn;
@property (weak, nonatomic) IBOutlet UIButton *testDictToModelBtn;
@property (weak, nonatomic) IBOutlet UIButton *testModelToString;

@property (weak, nonatomic) IBOutlet UIButton *testArrayToModeArrayBtn;
@property (weak, nonatomic) IBOutlet UIButton *testStringToModelArrayBtn;
@property (weak, nonatomic) IBOutlet UIButton *testFileNameToModelArrayBtn;
@property (weak, nonatomic) IBOutlet UIButton *testFilePathToModelArrayBtn;

@end

@implementation MainViewController

static NSString * const plistJsonModelName = @"TestDataJson.plist";

static NSString * const plistJsonArrayName = @"TestDataArray.plist";

static NSString * const jsonModelTxtName = @"TestDataForJsonModel.txt";

static NSString * const jsonArrayTxtName = @"TestDataForJsonArray.txt";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAutoLayout];
    
    [self setupBtnEvent];
}

- (void)setupAutoLayout
{
    // 从横向中间向两侧自动布局
    CGFloat commonMargin = 40;
    
    [self.testDictToModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.bottom.equalTo(self.view.centerY).offset(-commonMargin);
    }];
    
    [self.testFilePathToModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.bottom.equalTo(self.testDictToModelBtn.top).offset(-commonMargin);
    }];
    
    [self.testFileNameToModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.bottom.equalTo(self.testFilePathToModelBtn.top).offset(-commonMargin);
    }];
    
    [self.testStringToModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.bottom.equalTo(self.testFileNameToModelBtn.top).offset(-commonMargin);
    }];
    
    
    
    [self.testStringToModelArrayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.view.centerY).offset(commonMargin);
    }];
    
    [self.testFileNameToModelArrayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.testStringToModelArrayBtn.bottom).offset(commonMargin);
    }];
    
    [self.testFilePathToModelArrayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.testFileNameToModelArrayBtn.bottom).offset(commonMargin);
    }];
    
    [self.testArrayToModeArrayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.testFilePathToModelArrayBtn.bottom).offset(commonMargin);
    }];
    
    [self.testModelToString mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
    }];
    
}

- (void)setupBtnEvent
{
    //测试传入字符串转模型
    [[self.testStringToModelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSString *jsonString = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonModelTxtName ofType:nil] encoding:NSUTF8StringEncoding error:nil];
        TestData *testData = [TestData andy_objectWithString:jsonString];
        AndyLog(@"%@", testData);
    }];
    
    //测试传入文件名转模型
    [[self.testFileNameToModelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        TestData *testData = [TestData andy_objectWithFileName:jsonModelTxtName];
        AndyLog(@"%@", testData);
    }];
    
    //测试传入文件路径转模型
    [[self.testFilePathToModelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:plistJsonModelName ofType:nil];
        TestData *testData = [TestData andy_objectWithFilePath:filePath];
        AndyLog(@"%@", testData);
    }];
    
    //测试传入字典转模型
    [[self.testDictToModelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:plistJsonModelName ofType:nil];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        TestData *testData = [TestData andy_objectWithKeyValues:dict];
        
        AndyLog(@"%@", testData);
    }];
    
    //测试模型转字符串
    [[self.testModelToString rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        TestData *testData = [TestData andy_objectWithFileName:jsonModelTxtName];
        NSString *jsonString = [testData andy_JSONString];
        AndyLog(@"%@", jsonString);
    }];
    
    //测试传入字符串转模型数组
    [[self.testStringToModelArrayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSString *jsonString = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonArrayTxtName ofType:nil] encoding:NSUTF8StringEncoding error:nil];
        NSArray *statusArr = [Status andy_objectArrayWithString:jsonString];
        AndyLog(@"%@", statusArr);
    }];
    
    //测试传入文件名转模型数组
    [[self.testFileNameToModelArrayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSArray *statusArr = [Status andy_objectArrayWithFileName:jsonArrayTxtName];
        AndyLog(@"%@", statusArr);
    }];
    
    [[self.testFilePathToModelArrayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:plistJsonArrayName ofType:nil];
        NSArray *statusArr = [Status andy_objectArrayWithFilePath:filePath];
        AndyLog(@"%@", statusArr);
    }];
    
    //测试传入数组转模型数组
    [[self.testArrayToModeArrayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:plistJsonModelName ofType:nil];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *arr = dict[@"statuses"];
        NSArray *statusArr = [Status andy_objectArrayWithKeyValuesArray:arr];
        
        AndyLog(@"%@", statusArr);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end





























