//
//  DiagramView.h
//  Diagram
//
//  Created by fanxu1218 on 16/4/11.
//  Copyright © 2016年 fanxu1218. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSStickyHeaderFlowLayout.h"
#import "DataCenterCollectionCell.h"
#import "CSSectionHeader.h"
#import "PetFoodModel.h"
@interface DiagramView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) CSStickyHeaderFlowLayout   *draftLayout;
@property (nonatomic,strong) UILabel                    *lbeFoodTimes;
@property (nonatomic,strong) UILabel                    *lbeFoodTimesShow;
@property (nonatomic,strong) UILabel                    *lbeFoodUnit;
@property (nonatomic,strong) UILabel                    *lbeCounts;
@property (nonatomic,strong) UILabel                    *lbeCountsShow;
@property (nonatomic,strong) UILabel                    *lbeCountUnit;
@property (nonatomic,strong) UICollectionView           *displayCollectionView;
@property (nonatomic,strong) NSMutableArray             *aryDisplays;
@property (nonatomic,strong) NSMutableArray             *arySpace;

- (void)reloadTheData:(NSArray *)newData;


@end
