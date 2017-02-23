//
//  ViewController.m
//  AlertListView
//
//  Created by Angelo on 17/2/23.
//  Copyright © 2017年 Angelo. All rights reserved.
//

#import "ViewController.h"
#import "AGAlertListView.h"

@interface ViewController ()<AGAlertListDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [[[UIApplication sharedApplication].delegate window] addSubview:[[AGAlertListView alloc] init]];
    
    AGAlertListView *v = [[AGAlertListView alloc] initWithOptions:@[@"苹果",@"橘子",@"香蕉",@"西瓜",@"葡萄",@"哈密瓜"]];
    v.delegate = self;
    
    
    [self.view addSubview:v];
}

- (void)ag_selectWithIndes:(NSInteger)index option:(NSString *)option{
    NSLog(@"%ld ------- %@",index,option);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AGAlertListView *v = [[AGAlertListView alloc] initWithOptions:@[@"s",@"d",@"d"]];
    v.delegate = self;
    [self.view addSubview:v];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
