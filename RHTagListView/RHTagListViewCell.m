//
//  RHTagListViewCell.m
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/25.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHTagListViewCell.h"

@implementation RHTagListViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _contentView = [[UIView alloc] initWithFrame:self.bounds];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.borderWidth = 0.5f;
        _contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _contentView.layer.masksToBounds = YES;
        [self addSubview:_contentView];
        
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _textLabel.font = [UIFont systemFontOfSize:16];
        _textLabel.textColor = [UIColor redColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.numberOfLines = 0;
        [_contentView addSubview:_textLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
