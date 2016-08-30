//
//  TableViewDelegateObject.m
//  Delegate-Demo
//
//  Created by 刘小壮 on 16/8/29.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import "TableViewDelegateObject.h"

@interface TableViewDelegateObject ()
@property (nonatomic, copy) NSArray<NSString *> *dataList;
@property (nonatomic, copy) selectCell block;
@end

@implementation TableViewDelegateObject

#pragma mark - ----- Life Cycle ------

+ (instancetype)tableViewDelegateWithDataList:(NSArray<NSString *> *)dataList
                                  selectBlock:(selectCell)selectBlock {
    
    return [[[self class] alloc] initTableViewDelegateWithDataList:dataList
                                                       selectBlock:selectBlock];
}

- (instancetype)initTableViewDelegateWithDataList:(NSArray<NSString *> *)dataList
                                      selectBlock:(selectCell)selectBlock {
    
    self = [super init];
    if (self) {
        self.dataList = [dataList copy];
        self.block    = selectBlock;
    }
    return self;
}

#pragma mark - ----- TableView Delegate ------

// 在下面实现数据源和代理方法，并将对应的响应事件传递出去

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // 将点击事件通过block的方式传递出去
    self.block(indexPath);
}

@end





























