//
//  RHTagListView.m
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/19.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHTagListView.h"
#import "RHTagListViewCell.h"

@interface RHTagListView ()
{
    // index set to query the indexes of the cells used.
    NSMutableArray *_indices;
    
    // vector with all cell positions
    NSMutableArray *_vCellsPosition;
    
    // cells that are currently in the table
    NSMutableArray *_cellsUsed;
    
    // free list of cells
    NSMutableArray *_cellsFreed;
}

@end

@implementation RHTagListView

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _indices = [[NSMutableArray alloc] init];
        _vCellsPosition = [[NSMutableArray alloc] init];
        _cellsUsed = [[NSMutableArray alloc] init];
        _cellsFreed = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)updateCellAtIndex:(NSInteger)index
{
    if (index < 0) {
        return;
    }
    
    NSInteger countOfItems = [_dataSource numberOfCellsInTagListView:self];
    if (0 == countOfItems || index > countOfItems - 1) {
        return;
    }
    
    RHTagListViewCell *cell = [self cellAtIndex:index];
    if (cell) {
        <#statements#>
    }
}

- (void)insertCellAtIndex:(NSInteger)index
{}

- (void)removeCellAtIndex:(NSInteger)index
{}

- (void)reloadData
{
    for (RHTagListViewCell *cell in _cellsUsed) {
        [_cellsFreed addObject:cell];
    }
    [_indices removeAllObjects];
    [_cellsUsed removeAllObjects];
    
    [self _updateCellPositions];
    [self _updateContentSize];
    if ([_dataSource numberOfCellsInTagListView:self] > 0) {
        [self scrollViewDidScroll:self];
    }
}

- (void)_updateCellPositions
{}

- (void)_updateContentSize
{
    CGSize size = CGSizeZero;
    NSInteger cellsCount = [_dataSource numberOfCellsInTagListView:self];
    
    if (cellsCount > 0) {
        NSNumber *maxPosition = _vCellsPosition[cellsCount];
    }
}

- (RHTagListViewCell *)dequeueCell
{
    return nil;
}

- (RHTagListViewCell *)cellAtIndex:(NSInteger)index
{
    if (index < _indices.count) {
        for (RHTagListViewCell *cell in _cellsUsed) {
            if (cell.index == index) {
                return cell;
            }
        }
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
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
