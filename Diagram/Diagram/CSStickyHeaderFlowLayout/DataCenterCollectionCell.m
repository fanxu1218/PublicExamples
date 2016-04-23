//
//  DataCenterCollectionCell.m
//  YunduoV2
//
//  Created by apple on 15/4/3.
//  Copyright (c) 2015年 Cullen. All rights reserved.
//

#import "DataCenterCollectionCell.h"
#define MAXLINE 9
@interface DataCenterCollectionCell () {
    CGFloat  theHight;
    UILabel  *_labelShow;
    UIView   *_gridline;   //进度线条
}

@end
@implementation DataCenterCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}

#pragma mark - init Views 

- (void)initSubViews {
   
    for (int i = 0; i < MAXLINE ; i ++)
    {
        _gridline = [[UIView alloc]init];
        _gridline.backgroundColor = [UIColor lightGrayColor];
        _gridline.frame = CGRectMake(0,i * (CollecViewHeight - 5)/MAXLINE+20,kChatViewCellHeight*2,0.5);
        if (i == MAXLINE - 1) {
            _gridline.backgroundColor = [UIColor clearColor];
        }
        [self.contentView addSubview:_gridline];
    }
    self.collectionHight = self.frame.size.height;
 
    _bottomTitle = [[UILabel alloc] initWithFrame:CGRectMake(15,self.frame.size.height + 5, 40, 15)];
    _bottomTitle.textAlignment = NSTextAlignmentCenter;
    _bottomTitle.font = [UIFont boldSystemFontOfSize:9.0];
    _bottomTitle.text = @"";
    _bottomTitle.backgroundColor = [UIColor clearColor];
    _bottomTitle.textColor = RGBCOLOR(116, 132, 137);

    
    _histogramTitle = [[UILabel alloc] initWithFrame:CGRectMake(35, 20, 0, 0)];
    _histogramTitle.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _histogramTitle.textAlignment = NSTextAlignmentCenter;
    _histogramTitle.font = [UIFont boldSystemFontOfSize:11.0];
    _histogramTitle.backgroundColor = RGBCOLOR(27, 201, 252);

    _labelShow = [[UILabel alloc] init];
    _labelShow.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _labelShow.textAlignment = NSTextAlignmentCenter;
    _labelShow.font = [UIFont boldSystemFontOfSize:7.0];
    _labelShow.textColor = RGBCOLOR(116, 132, 137);

    _gridline = [[UIView alloc]init];
    _gridline.backgroundColor = [UIColor lightGrayColor];
    _gridline.frame = CGRectMake(22, (CollecViewHeight - 5)/MAXLINE-1, 0.5, self.frame.size.height+4-(CollecViewHeight - 5)/MAXLINE);
    [self.contentView addSubview:_gridline];
//
    _gridline = [[UIView alloc]init];
    _gridline.backgroundColor = [UIColor lightGrayColor];
    _gridline.frame = CGRectMake(46, (CollecViewHeight - 5)/MAXLINE-1, 0.5, self.frame.size.height+4-(CollecViewHeight - 5)/MAXLINE);
    [self.contentView addSubview:_gridline];
    
    [self.contentView addSubview:_bottomTitle];
    [self.contentView addSubview:_histogramTitle];
    [self.contentView addSubview:_labelShow];
}

#pragma mark - Setting Model
- (void)setModel:(PetFoodModel *)model{
    _bottomTitle.text = @"06/07";
    _histogramTitle.frame = CGRectMake(22,self.collectionHight - self.collectionHight * 0.5 - 33, DataCenterCellWidth,self.collectionHight * 0.5);
}


//判断是否为空
- (BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([string isEqualToString:@" "]) {
        return YES;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


@end
