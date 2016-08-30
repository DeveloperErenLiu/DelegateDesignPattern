//
//  ViewController.m
//  Delegate-Demo
//
//  Created by 刘小壮 on 16/8/29.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDelegateObject.h"

@interface ViewController ()
@property (nonatomic, weak  ) IBOutlet UITableView    *tableView;
@property (nonatomic, strong) TableViewDelegateObject *delegateObject;
@end

@implementation ViewController

/** 
 当前Demo只是针对UITableView做一个演示，将UITableView的数据源和代理方法交给代理对象类，其他可以设置代理的类都可以使用这种设计思路。
 通过这种方式，可以达到为控制器瘦身的目的，使原本臃肿的控制器代码量减少。如果代理对象设计得好的话，还可以复用代理对象。
 */
/** 
 下面只是简单的实现了将UITableView的点击事件传递出来，如果当前类和代理对象交互比较复杂和频繁，可以考虑用代理的形式来传递事件。
 在代理和block的选取中，一定要记住：代理是面向过程的回调，block是面向结果的回调。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化测试数据
    NSMutableArray<NSString *> *dataList = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        [dataList addObject:[NSString stringWithFormat:@"lxz %d", i]];
    }
    
    // 创建代理对象，并将数据列表传入
    self.delegateObject = [TableViewDelegateObject tableViewDelegateWithDataList:dataList selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了 %ld 行", indexPath.row);
    }];
    
    // 设置UITableView的代理和数据源方法，并刷新页面
    self.tableView.delegate   = self.delegateObject;
    self.tableView.dataSource = self.delegateObject;
    [self.tableView reloadData];
}

@end






































