//
//  RHTagListView.m
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/25.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHTagListView.h"
#import "RHTagListViewCell.h"

@implementation RHTagListView

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _marginX = 10;
        _marginY = 10;
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_backgroundView];
        _framesForAllCells = [[NSMutableArray alloc] init];
        _reusableCells = [[NSMutableArray alloc] init];
        _visibleCells = [[NSMutableArray alloc] init];
        _indexsForVisibleCells = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    _dataSource = nil;
    self.delegate = nil;
}

- (RHTagListViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    RHTagListViewCell *cell = nil;
    if (_reusableCells.count > 0) {
        cell = [_reusableCells firstObject];
        [_reusableCells removeObject:cell];
    }
    
    return cell;
}

- (RHTagListViewCell *)cellAtIndex:(NSInteger)index
{
    return nil;
}

- (CGRect)cellFrameAtIndex:(NSInteger)index
{
    if (index >= _framesForAllCells.count) {
        return CGRectZero;
    }
    NSString *frameString = _framesForAllCells[index];
    CGRect frame = CGRectFromString(frameString);
    return frame;
}

- (void)reloadData
{
    for (RHTagListViewCell *cell in _visibleCells) {
        [_reusableCells addObject:cell];
    }
    [_indexsForVisibleCells removeAllObjects];
    [_visibleCells removeAllObjects];
    
    NSInteger number = 0;
    if (_dataSource && [_dataSource respondsToSelector:@selector(numberOfCellsInTagListView:)]) {
        number = [_dataSource numberOfCellsInTagListView:self];
    }
    
    CGFloat maxWidth = CGRectGetWidth(self.bounds);
    CGFloat posX = 0;
    CGFloat posY = 0;
    CGFloat rowHeight = 0;
    
    for (NSInteger i=0; i<number; i++) {
        CGSize cellSize = CGSizeZero;
        if (_dataSource && [_dataSource respondsToSelector:@selector(tagListView:cellSizeForIndex:)]) {
            cellSize = [_dataSource tagListView:self cellSizeForIndex:i];
        }
        
        if (posX + cellSize.width > maxWidth) {
            posX = 0;
            posY = posY + rowHeight + _marginY;
            rowHeight = 0;
        }
        
        CGRect cellFrame = CGRectMake(posX, posY, cellSize.width, cellSize.height);
        NSString *frameString = NSStringFromCGRect(cellFrame);
        [_framesForAllCells addObject:frameString];
        
        RHTagListViewCell *cell = [self dequeueReusableCellWithIdentifier:nil];
        if (_dataSource && [_dataSource respondsToSelector:@selector(tagListView:cellAtIndex:)]) {
            cell = [_dataSource tagListView:self cellAtIndex:i];
        }
        
        if (cell) {
            [_backgroundView addSubview:cell];
        }
        
        posX = posX + cellSize.width + _marginX;
        rowHeight = MAX(rowHeight, cellSize.height);
        [_visibleCells addObject:cell];
    }//for
    
    CGRect frame = _backgroundView.frame;
    _backgroundView.frame = CGRectMake(0, 0, frame.size.width, posY + rowHeight);
    self.contentSize = _backgroundView.frame.size;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger number = [_dataSource numberOfCellsInTagListView:self];
    if (number == 0) {
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
