//
//  AGAlertListView.m
//  AlertListView
//
//  Created by Angelo on 17/2/23.
//  Copyright © 2017年 Angelo. All rights reserved.
//

#import "AGAlertListView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface AGAlertListView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic , strong)UIPickerView *dataPickerView;

@property (nonatomic , strong)NSArray<NSString*> *dataArray;

@end

@implementation AGAlertListView


- (instancetype)initWithOptions:(NSArray<NSString *> *)options{
    if (self = [super init]) {
        self.dataArray = options;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth * 0.1, kScreenHeight / 3, kScreenWidth * 0.8, kScreenHeight / 3)];
        bgView.backgroundColor = [UIColor grayColor];
        bgView.layer.masksToBounds = YES;
        bgView.layer.cornerRadius = 5;
        [self addSubview:bgView];
        [bgView addSubview:self.dataPickerView];

        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(0, CGRectGetMaxY(self.dataPickerView.frame) + 1, kScreenWidth * 0.4 - 0.5, 43);
        [cancelBtn setTitle:@"取消" forState: UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [cancelBtn setBackgroundColor:[UIColor whiteColor]];
        [cancelBtn addTarget:self action:@selector(ag_cancelClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:cancelBtn];
        
        UIButton *trueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        trueBtn.frame = CGRectMake(kScreenWidth * 0.4 + 0.5, CGRectGetMaxY(self.dataPickerView.frame) + 1, kScreenWidth * 0.4 - 0.5, 43);
        [trueBtn setTitle:@"确定" forState: UIControlStateNormal];
        [trueBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [trueBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [trueBtn setBackgroundColor:[UIColor whiteColor]];
        [trueBtn addTarget:self action:@selector(ag_trueClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:trueBtn];
        
        UITapGestureRecognizer *removeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ag_dismiss)];
        [self addGestureRecognizer:removeTap];
        
    }
    return self;
}

- (UIPickerView *)dataPickerView{
    if (!_dataPickerView) {
        _dataPickerView = [[UIPickerView alloc] init];
        _dataPickerView.frame = CGRectMake(0, 0, kScreenWidth * 0.8, kScreenHeight / 3 - 44);
        _dataPickerView.delegate = self;
        _dataPickerView.dataSource = self;
        _dataPickerView.backgroundColor = [UIColor whiteColor];
    }
    return _dataPickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArray[row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 35;
}

- (void)ag_dismiss{
    [self removeFromSuperview];
}

- (void)ag_cancelClickAction:(UIButton*)sender{
    [self ag_dismiss];
}

- (void)ag_trueClickAction:(UIButton*)sender{
    NSInteger index = [_dataPickerView selectedRowInComponent:0];
    __weak typeof(self) wearkSelf = self;
    if ([self.delegate respondsToSelector:@selector(ag_selectWithListView:indes:option:)]) {
        [self.delegate ag_selectWithListView:wearkSelf indes:index option:wearkSelf.dataArray[index]];
    }
    [self ag_dismiss];
}


- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}





@end
