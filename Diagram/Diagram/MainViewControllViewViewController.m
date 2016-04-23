//
//  MainViewControllViewViewController.m
//  Diagram
//
//  Created by fanxu1218 on 16/4/11.
//  Copyright © 2016年 fanxu1218. All rights reserved.
//

#import "MainViewControllViewViewController.h"
#import "DiagramView.h"
@interface MainViewControllViewViewController ()
@property (nonatomic,strong) DiagramView                *diagramVC;
@property (nonatomic,strong) NSMutableArray             *aryTheData;
@end

@implementation MainViewControllViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.diagramVC = [[DiagramView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, CollecViewHeight)];
    [self.diagramVC reloadTheData:self.aryTheData];
    [self.view addSubview:self.diagramVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *)aryTheData{
    if (!_aryTheData) {
        _aryTheData = [[NSMutableArray alloc] init];
        PetFoodModel *model = [[PetFoodModel alloc] init];
        model.date = @"1460217600";
        [_aryTheData addObject:model];
        PetFoodModel *model2 = [[PetFoodModel alloc] init];
        model2.date = @"1460304000";
        [_aryTheData addObject:model2];
        PetFoodModel *model3 = [[PetFoodModel alloc] init];
        model3.date = @"1460390400";
        [_aryTheData addObject:model3];
        PetFoodModel *model4 = [[PetFoodModel alloc] init];
        model4.date = @"1460476800";
        [_aryTheData addObject:model4];
    }
    return _aryTheData;
}

@end
