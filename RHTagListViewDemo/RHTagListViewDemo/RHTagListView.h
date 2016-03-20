//
//  RHTagListView.h
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/19.
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

- (NSInteger)numberOfCellsInTagListView:(RHTagListView *)tagListView;
- (CGSize)tagListView:(RHTagListView *)tagListView cellSizeForIndex:(NSInteger)index;
- (RHTagListViewCell *)tagListView:(RHTagListView *)tagListView cellAtIndex:(NSInteger)index;

@end

@interface RHTagListView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, weak) id<RHTagListViewDataSource> dataSource;
@property (nonatomic, weak) id<RHTagListViewDelegate> delegate;

@end
