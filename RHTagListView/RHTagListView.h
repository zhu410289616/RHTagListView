//
//  RHTagListView.h
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/25.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RHTagListView;
@class RHTagListViewCell;

@protocol RHTagListViewDelegate <NSObject, UIScrollViewDelegate>

- (void)tagListView:(RHTagListView *)tagListView cellTouched:(RHTagListViewCell *)cell;
- (void)tagListView:(RHTagListView *)tagListView cellHighlight:(RHTagListViewCell *)cell;
- (void)tagListView:(RHTagListView *)tagListView cellUnhighlight:(RHTagListViewCell *)cell;

@end

@protocol RHTagListViewDataSource <NSObject>

@required

- (NSInteger)numberOfCellsInTagListView:(RHTagListView *)tagListView;
- (CGSize)tagListView:(RHTagListView *)tagListView cellSizeForIndex:(NSInteger)index;
- (RHTagListViewCell *)tagListView:(RHTagListView *)tagListView cellAtIndex:(NSInteger)index;

@end

@interface RHTagListView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat marginX;
@property (nonatomic, assign) CGFloat marginY;

/** 背景容器 */
@property (nonatomic, strong, readonly) UIView *backgroundView;
/** 所有cell的位置 */
@property (nonatomic, strong, readonly) NSMutableArray *framesForAllCells;
/** 可重用cell */
@property (nonatomic, strong, readonly) NSMutableArray *reusableCells;
/** 当前可见cell的索引 */
@property (nonatomic, strong, readonly) NSMutableArray *indexsForVisibleCells;
/** 当前可见cell */
@property (nonatomic, strong, readonly) NSMutableArray *visibleCells;

@property (nonatomic, weak) id<RHTagListViewDataSource> dataSource;
@property (nonatomic, weak) id<RHTagListViewDelegate> delegate;

- (RHTagListViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
- (RHTagListViewCell *)cellAtIndex:(NSInteger)index;
- (CGRect)cellFrameAtIndex:(NSInteger)index;
- (void)reloadData;

@end
