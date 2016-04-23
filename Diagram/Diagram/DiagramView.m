//
//  DiagramView.m
//  Diagram
//
//  Created by fanxu1218 on 16/4/11.
//  Copyright © 2016年 fanxu1218. All rights reserved.
//

#import "DiagramView.h"
static NSString *draftAttentItemIdenifer = @"draftAttentCollectionCell";
@implementation DiagramView

-(id)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView{
    [self addSubview:self.displayCollectionView];
    [self addSubview:self.lbeFoodTimes];
    [self addSubview:self.lbeFoodTimesShow];
    [self addSubview:self.lbeFoodUnit];
    [self addSubview:self.lbeCounts];
    [self addSubview:self.lbeCountsShow];
    [self addSubview:self.lbeCountUnit];
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
        _lbeFoodTimes = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
        _lbeFoodTimes.text = @"当日共喂食:";
        _lbeFoodTimes.textColor = [UIColor lightGrayColor];
    }
    return _lbeFoodTimes;
}

- (UILabel *)lbeFoodTimesShow{
    if (!_lbeFoodTimesShow) {
        _lbeFoodTimesShow = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodTimes.frame), 3, 30, 30)];
        _lbeFoodTimesShow.text = @"10";
        _lbeFoodTimesShow.font = [UIFont systemFontOfSize:25.0f];
        _lbeFoodTimesShow.textColor = [UIColor orangeColor];
    }
    return _lbeFoodTimesShow;
}

- (UILabel *)lbeFoodUnit{
    if (!_lbeFoodUnit) {
        _lbeFoodUnit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodTimesShow.frame), 0, 30, 30)];
        _lbeFoodUnit.text = @"份";
        _lbeFoodUnit.font = [UIFont systemFontOfSize:15.0f];
        _lbeFoodUnit.textColor = [UIColor orangeColor];
    }
    return _lbeFoodUnit;
}

- (UILabel *)lbeCounts{
    if (!_lbeCounts) {
        _lbeCounts = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeFoodUnit.frame) + 10, 5, 50, 30)];
        _lbeCounts.text = @"合计:";
        _lbeCounts.textColor = [UIColor lightGrayColor];
    }
    return _lbeCounts;
}

- (UILabel *)lbeCountsShow{
    if (!_lbeCountsShow) {
        _lbeCountsShow = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeCounts.frame), 3, 50, 30)];
        _lbeCountsShow.text = @"480";
        _lbeCountsShow.font = [UIFont systemFontOfSize:25.0f];
        _lbeCountsShow.textColor = [UIColor orangeColor];
    }
    return _lbeCountsShow;
}

- (UILabel *)lbeCountUnit{
    if (!_lbeCountUnit) {
        _lbeCountUnit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lbeCountsShow.frame), 0, 30, 30)];
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
        _displayCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width,CollecViewHeight)  collectionViewLayout:self.draftLayout];
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
//        self.automaticallyAdjustsScrollViewInsets = NO;
        [self addSubview:_displayCollectionView];
        
    }
    return _displayCollectionView;
}

- (NSMutableArray *)aryDisplays{
    if (!_aryDisplays) {
        _aryDisplays = [[NSMutableArray alloc] init];
    }
    return _aryDisplays;
}

- (void)reloadTheData:(NSArray *)newData{
    _aryDisplays = [[NSMutableArray alloc] init];
    [_aryDisplays addObject:newData];
    if (newData.count < kHalfLittleCellNum) {
        int start = (int)newData.count;
        self.arySpace = [[NSMutableArray alloc] init];
        for (int i = start; i < kHalfLittleCellNum;i++) {
            PetFoodModel *model = [[PetFoodModel alloc] init];
            model.date = @"0";
            model.weight = @"0";
            [_arySpace addObject:model];
        }
        [_aryDisplays addObject:self.arySpace];
    }
    [self.displayCollectionView reloadData];
}


@end
