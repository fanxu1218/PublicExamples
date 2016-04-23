//
//  DataCenterCollectionCell.h
//  YunduoV2
//
//  Created by apple on 15/4/3.
//  Copyright (c) 2015年 Cullen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetFoodModel.h"

@interface DataCenterCollectionCell : UICollectionViewCell

@property (nonatomic,assign)   NSInteger    maxStepHight;
@property (nonatomic,assign)   CGFloat      collectionHight;
@property (nonatomic,strong)   UILabel      *bottomTitle;          //底部日期
@property (nonatomic,strong)   UILabel      *histogramTitle;       //柱形;
@property (nonatomic,strong)   PetFoodModel *model;
@end
