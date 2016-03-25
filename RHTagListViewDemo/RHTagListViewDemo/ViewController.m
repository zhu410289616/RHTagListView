//
//  ViewController.m
//  RHTagListViewDemo
//
//  Created by zhuruhong on 16/3/19.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "ViewController.h"
#import "RHTagListView.h"
#import "RHTagListViewCell.h"

@interface ViewController () <RHTagListViewDataSource, RHTagListViewDelegate>
{
    RHTagListView *_tagListView;
    NSMutableArray *_tagArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = CGRectMake(15, 80, CGRectGetWidth(self.view.frame) - 30, 100);
    _tagListView = [[RHTagListView alloc] initWithFrame:frame];
    _tagListView.delegate = self;
    _tagListView.dataSource = self;
    [self.view addSubview:_tagListView];
    
    //test data
    _tagArray = [[NSMutableArray alloc] init];
    [_tagArray addObject:@"出行目的：旅游"];
    [_tagArray addObject:@"希望车内气氛：安静"];
    [_tagArray addObject:@"其他需求：车内有小孩，开车平稳点，车内有小孩，开车平稳点，车内有小孩，开车平稳点，车内有小孩，开车平稳点，"];
    [_tagArray addObject:@"出行目的：旅游"];
    [_tagArray addObject:@"出行目的：旅游"];
    [_tagArray addObject:@"其他需求：车内有小孩，开车平稳点，车内有小孩，开车平稳点，"];
    [_tagArray addObject:@"出行目的"];
    [_tagArray addObject:@"出行目的：旅游xxxxxx"];
    
    [_tagListView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize )calcTextSize:(NSString *)content constraint:(CGSize)constraint font:(UIFont *)font
{
    NSDictionary *attributesDictionary = @{ NSFontAttributeName:font };
    CGRect textSize = [content boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:NULL];
    return CGSizeMake(ceil(textSize.size.width), ceil(textSize.size.height));
}

- (CGSize)sizeWithTagText:(NSString *)tagText
{
    CGSize constraintSize = CGSizeMake(CGRectGetWidth(_tagListView.frame) - 30, 2000);
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize textSize = [self calcTextSize:tagText constraint:constraintSize font:font];
    return CGSizeMake(textSize.width + 28, textSize.height + 12);
}

#pragma mark - RHTagListViewDataSource

- (NSInteger)numberOfCellsInTagListView:(RHTagListView *)tagListView
{
    return _tagArray.count;
}

- (CGSize)tagListView:(RHTagListView *)tagListView cellSizeForIndex:(NSInteger)index
{
    NSString *tagText = _tagArray[index];
    return [self sizeWithTagText:tagText];
}

- (RHTagListViewCell *)tagListView:(RHTagListView *)tagListView cellAtIndex:(NSInteger)index
{
    Class cellClass = [RHTagListViewCell class];
    NSString *CellIdentifier = NSStringFromClass(cellClass);
    RHTagListViewCell *cell = [tagListView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        CGRect frame = [tagListView cellFrameAtIndex:index];
        cell = [[cellClass alloc] initWithFrame:frame];
    }
    
    NSString *tagText = _tagArray[index];
    cell.textLabel.text = tagText;
    
    return cell;
}

#pragma mark - RHTagListViewDelegate

- (void)tagListView:(RHTagListView *)tagListView cellTouched:(RHTagListViewCell *)cell
{}

- (void)tagListView:(RHTagListView *)tagListView cellHighlight:(RHTagListViewCell *)cell
{}

- (void)tagListView:(RHTagListView *)tagListView cellUnhighlight:(RHTagListViewCell *)cell
{}

@end
