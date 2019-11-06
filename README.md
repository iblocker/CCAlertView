### CCAlertView

------

包含多选的自定义弹窗，高仿系统弹窗，使用Window加载，不需要获取顶层viewController

普通弹窗初始化代码如下：

```objective-c
CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"您的账户存在异地登录的情况。为确保账户安全，请及时修改密码"];
    model.messageAlignment = NSTextAlignmentLeft;
    model.messageColor = UIColor.redColor;
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    
    CCActionItem *cancelItem = [CCActionItem itemWithTitle:@"我已了解" titleColor:UIColor.redColor handler:^{
        NSLog(@"点击了我已了解");
    }];
    [alertView addItem:cancelItem];
    CCActionItem *confirmItem = [CCActionItem itemWithTitle:@"修改密码" titleColor:UIColor.blueColor  handler:^{
        NSLog(@"点击了修改密码");
    }];
    [alertView addItem:confirmItem];
    CCActionItem *lockAction = [CCActionItem itemWithTitle:@"锁定账户" handler:^{
        NSLog(@"点击了锁定账户");
    }];
    [alertView addItem:lockAction];
    [alertView show];
```

选项弹窗初始化代码如下：

```objective-c
CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"您需要勾选下面的选项"];
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    
    CCAlertPickerItem *firstPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPhone 12"];
    [alertView addPicker:firstPicker];
    
    CCAlertPickerItem *secondPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPad Pro Max"];
    [alertView addPicker:secondPicker];
    
    CCActionItem *cancelItem = [CCActionItem itemWithTitle:@"取消" titleColor:UIColor.cyanColor handler:^{
        NSLog(@"点击了取消");
    }];
    [alertView addItem:cancelItem];
    CCActionItem *confirmItem = [CCActionItem itemWithTitle:@"确定" titleColor:UIColor.grayColor handlerPicker:^(NSArray<CCAlertPickerItem *> * _Nonnull pickItems) {
        NSLog(@"点击了确定 --- %@", pickItems);
    }];
    [alertView addItem:confirmItem];
    CCActionItem *otherItem = [CCActionItem itemWithTitle:@"其它" titleColor:UIColor.purpleColor handler:^{
        NSLog(@"点击了其它");
    }];
    [alertView addItem:otherItem];
    [alertView show];
```

