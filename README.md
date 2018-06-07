在日常开发中经常会用到UIViewController和UITableView，一般都把UITableView代理的代码写在控制器中，但是控制器中代码量一般都不会少，这样无疑会增加控制器的代码量。

在Demo中就通过“代理对象”的方式，将控制器中UITableView的代理交给一个对象去实现，并且将dataSource设置为这个代理对象。这种方式减少了控制器的代码量，而且更符合面向对象的设计原则，将UITableView的数据操作交给一个单独的对象去处理。

#### 原文地址

* [你真的了解iOS代理设计模式吗？](http://www.jianshu.com/p/2113ffe54b30)