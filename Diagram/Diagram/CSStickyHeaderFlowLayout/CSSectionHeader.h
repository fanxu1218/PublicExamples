//
//  CSSectionHeader.h
//  YunduoV2
//
//  Created by apple on 15/4/7.
//  Copyright (c) 2015年 Cullen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetFoodModel.h"

@interface CSSectionHeader : UICollectionReusableView
@property (nonatomic,strong) UILabel            *labelShow;
@property (nonatomic,strong) PetFoodModel       *model;
@end
