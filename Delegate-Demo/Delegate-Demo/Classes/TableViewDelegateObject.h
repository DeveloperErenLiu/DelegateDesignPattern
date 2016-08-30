//
//  TableViewDelegateObject.h
//  Delegate-Demo
//
//  Created by 刘小壮 on 16/8/29.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 定义点击Cell后的block回调方法
typedef void (^selectCell) (NSIndexPath *indexPath);

// 代理对象(UITableView的协议需要声明在.h文件中，不然外界在使用的时候会报黄色警告，看起来不太舒服)
@interface TableViewDelegateObject : NSObject <UITableViewDelegate, UITableViewDataSource>

/**
 *  创建代理对象，便利构造器
 *
 *  @param dataList    数据列表
 *  @param selectBlock 点击后的block回调
 *
 *  @return 实例对象
 */
+ (instancetype)tableViewDelegateWithDataList:(NSArray<NSString *> *)dataList
                                  selectBlock:(selectCell)selectBlock;
@end
