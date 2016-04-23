//
//  CustomerCollectionHeader.h
//  Diagram
//
//  Created by fanxu1218 on 16/4/11.
//  Copyright © 2016年 fanxu1218. All rights reserved.
//

#ifndef CustomerCollectionHeader_h
#define CustomerCollectionHeader_h

#define     RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define     DataCenterCellWidth             24
#define     MainScreenHeight                [UIScreen mainScreen].bounds.size.height
#define     MainScreenWidth                 [UIScreen mainScreen].bounds.size.width

#define  CollecViewHeight 220

//数据中心图表格子宽度
#define kChatViewCellHeight 25

//数据中心图表X比例
#define kChatViewRateOfScreen CollecViewHeight/MainScreenHeight

//数据中心图表半屏格子数量(少)
#define kHalfLittleCellNum (int)([UIScreen mainScreen].bounds.size.width-20)/kChatViewCellHeight


#endif /* CustomerCollectionHeader_h */
