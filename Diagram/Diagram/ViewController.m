//
//  ViewController.m
//  Diagram
//
//  Created by fanxu1218 on 16/4/10.
//  Copyright © 2016年 fanxu1218. All rights reserved.
//

#import "ViewController.h"
#import "DiagramView.h"

#import "CSStickyHeaderFlowLayout.h"
#import "DataCenterCollectionCell.h"
#import "CSSectionHeader.h"

#import "PetFoodModel.h"
static NSString *draftAttentItemIdenifer = @"draftAttentCollectionCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) CSStickyHeaderFlowLayout   *draftLayout;
@property (nonatomic,strong) UILabel                    *lbeFoodTimes;
@property (nonatomic,strong) UILabel                    *lbeFoodTimesShow;
@property (nonatomic,strong) UILabel                    *lbeFoodUnit;
@property (nonatomic,strong) UILabel                    *lbeCounts;
@property (nonatomic,strong) UILabel                    *lbeCountsShow;
@property (nonatomic,strong) UILabel                    *lbeCountUnit;
@property (nonatomic,strong) UICollectionView           *displayCollectionView;
@property (nonatomic,strong) NSMutableArray             *aryDisplays;
@property (nonatomic,strong) NSMutableArray             *aryTheData;
@property (nonatomic,strong) NSMutableArray             *arySpace;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.displayCollectionView];
    [self.view addSubview:self.lbeFoodTimes];
    [self.view addSubview:self.lbeFoodTimesShow];
    [self.view addSubview:self.lbeFoodUnit];
    [self.view addSubview:self.lbeCounts];
    [self.view addSubview:self.lbeCountsShow];
    [self.view addSubview:self.lbeCountUnit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionDataDelgate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.aryDisplays.count;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return  [[_aryDisplays objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataCenterCollectionCell *cell = (DataCenterCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:draftAttentItemIdenifer forIndexPath:indexPath];
    cell.collectionHight = collectionView.frame.size.height;
    PetFoodModel *model = [[self.aryDisplays objectAtIndex:indexPath.section] objectAtIndex:indexPath.item];
    [cell setModel:model];
    cell.bottomTitle.textColor =  [UIColor orangeColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CSSectionHeader *viewShow = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
    if (self.aryDisplays.count != 0){
        PetFoodModel *healthData = [[self.aryDisplays objectAtIndex:indexPath.section] objectAtIndex:indexPath.item];
        [viewShow setModel:healthData];
    }
    return viewShow;
}


#pragma mark Setter

- (UILabel *)lbeFoodTimes{
    if (!_lbeFoodTimes) {
        _lbeFoodTimes = [[UILabel alloc] initWithFrame:CGRectMake(10, 105, 100, 30)];
        _lbeFoodTimes.text = @"当日共喂食:";
        _lbeFoodTimes.textColor = [UIColor lightGrayColor];
    }
    return _lbeFoodTimes;
}

- (UILabel *)lbeFoodTimesShow{
    if (!_lbeFoodTimesShow) {
        _lbeFoodTimesShow = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodTimes.frame), 103, 30, 30)];
        _lbeFoodTimesShow.text = @"10";
        _lbeFoodTimesShow.font = [UIFont systemFontOfSize:25.0f];
         _lbeFoodTimesShow.textColor = [UIColor orangeColor];
    }
    return _lbeFoodTimesShow;
}

- (UILabel *)lbeFoodUnit{
    if (!_lbeFoodUnit) {
        _lbeFoodUnit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodTimesShow.frame), 95, 30, 30)];
        _lbeFoodUnit.text = @"份";
        _lbeFoodUnit.font = [UIFont systemFontOfSize:15.0f];
        _lbeFoodUnit.textColor = [UIColor orangeColor];
    }
    return _lbeFoodUnit;
}

- (UILabel *)lbeCounts{
    if (!_lbeCounts) {
        _lbeCounts = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodUnit.frame) + 10, 105, 50, 30)];
        _lbeCounts.text = @"合计:";
        _lbeCounts.textColor = [UIColor lightGrayColor];
    }
    return _lbeCounts;
}

- (UILabel *)lbeCountsShow{
    if (!_lbeCountsShow) {
        _lbeCountsShow = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeCounts.frame), 103, 50, 30)];
        _lbeCountsShow.text = @"480";
        _lbeCountsShow.font = [UIFont systemFontOfSize:25.0f];
        _lbeCountsShow.textColor = [UIColor orangeColor];
    }
    return _lbeCountsShow;
}

- (UILabel *)lbeCountUnit{
    if (!_lbeCountUnit) {
        _lbeCountUnit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeCountsShow.frame), 95, 30, 30)];
        _lbeCountUnit.text = @"ml";
        _lbeCountUnit.font = [UIFont systemFontOfSize:15.0f];
        _lbeCountUnit.textColor = [UIColor orangeColor];
    }
    return _lbeCountUnit;
}

- (CSStickyHeaderFlowLayout *)draftLayout{
    if (!_draftLayout) {
        _draftLayout = [[CSStickyHeaderFlowLayout alloc] init];
        _draftLayout.headerReferenceSize = CGSizeMake(24, 30);
    }
    return _draftLayout;
}

- (UICollectionView *)displayCollectionView{
    if (!_displayCollectionView) {
        _displayCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,100, self.view.frame.size.width,CollecViewHeight)  collectionViewLayout:self.draftLayout];
        [_displayCollectionView registerClass:[DataCenterCollectionCell class] forCellWithReuseIdentifier:draftAttentItemIdenifer];
        [_displayCollectionView registerClass:[CSSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView"];
        _displayCollectionView.bounces = NO;
        _displayCollectionView.delegate = self;
        _displayCollectionView.dataSource = self;
        _displayCollectionView.showsHorizontalScrollIndicator = NO;
        _displayCollectionView.showsVerticalScrollIndicator = NO;
        _displayCollectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        _displayCollectionView.alwaysBounceVertical = YES;
        _displayCollectionView.backgroundColor = [UIColor whiteColor];
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self.view addSubview:_displayCollectionView];

    }
    return _displayCollectionView;
}

- (NSMutableArray *)aryDisplays{
    if (!_aryDisplays) {
        _aryDisplays = [[NSMutableArray alloc] init];
        [_aryDisplays addObject:self.aryTheData];
        if (self.aryTheData.count < kHalfLittleCellNum) {
            [_aryDisplays addObject:self.arySpace];
        }
    }
    return _aryDisplays;
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

- (NSMutableArray *)arySpace{
    if (!_arySpace) {
        _arySpace = [[NSMutableArray alloc] init];
        int start = (int)self.aryTheData.count;
        for (int i = start; i < kHalfLittleCellNum;i++) {
            PetFoodModel *model = [[PetFoodModel alloc] init];
            model.date = @"0";
            model.weight = @"0";
            [_arySpace addObject:model];
        }
    }
    return _arySpace;
}


@end
