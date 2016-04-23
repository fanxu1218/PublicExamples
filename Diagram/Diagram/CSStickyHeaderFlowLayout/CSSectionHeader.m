//
//  CSSectionHeader.m
//  YunduoV2
//
//  Created by apple on 15/4/7.
//  Copyright (c) 2015年 Cullen. All rights reserved.
//

#import "CSSectionHeader.h"

@implementation CSSectionHeader
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    self.backgroundColor = [UIColor clearColor];
    _labelShow = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 26, 30)];
    _labelShow.backgroundColor = [UIColor clearColor];
    _labelShow.text = @"";
    _labelShow.font = [UIFont systemFontOfSize:11];
    _labelShow.textColor = RGBCOLOR(116, 132, 137);

    [self addSubview:_labelShow];
}

- (void)setModel:(PetFoodModel *)model
{
//     _labelShow.text = @"01";
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
