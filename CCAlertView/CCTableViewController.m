//
//  CCTableViewController.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/6.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCTableViewController.h"
#import "CCAlertView.h"

@interface CCTableViewController ()
@property (nonatomic, strong) NSArray<NSArray<NSDictionary<NSString *, NSString *> *> *> *dataArray;
@end

@implementation CCTableViewController

- (NSArray<NSArray<NSDictionary<NSString *, NSString *> *> *> *)dataArray {
    return @[
        @[
            @{@"One Item" : @"oneItemAlert"},
            @{@"Two Item" : @"twoItemAlert"},
            @{@"Three Item" : @"threeItemAlert"}
        ],
        @[
            @{@"One Item Picker" : @"oneItemAlertPicker"},
            @{@"Two Item Picker" : @"twoItemAlertPicker"},
            @{@"Three Item Picker" : @"threeItemAlertPicker"}
        ]
    ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.estimatedSectionHeaderHeight = 10;
    self.tableView.tableFooterView = UIView.new;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *param = self.dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = param.allKeys.firstObject;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *param = self.dataArray[indexPath.section][indexPath.row];
    NSString *selString = param.allValues.firstObject;
    if (selString.length) {
        SEL selector = NSSelectorFromString(selString);
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self, selector);
//        [self performSelector:selector];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

#pragma mark - Selectors

- (void)oneItemAlert {
    CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"有新的更新"];
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    CCActionItem *cancelItem = [CCActionItem itemWithTitle:@"更新" titleColor:UIColor.blueColor handler:^{
        NSLog(@"点击了更新");
    }];
    [alertView addItem:cancelItem];
    [alertView show];
}

- (void)twoItemAlert {
    CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"有新的更新"];
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    
    CCActionItem *cancelItem = [CCActionItem itemWithTitle:@"暂不更新" titleColor:UIColor.redColor handler:^{
        NSLog(@"点击了暂不更新");
    }];
    [alertView addItem:cancelItem];
    CCActionItem *confirmItem = [CCActionItem itemWithTitle:@"现在更新" titleColor:UIColor.blueColor  handler:^{
        NSLog(@"点击了现在更新");
    }];
    [alertView addItem:confirmItem];
    [alertView show];
}

- (void)threeItemAlert {
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
}

- (void)oneItemAlertPicker {
    CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"您需要勾选下面的选项"];
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    
    CCAlertPickerItem *firstPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPhone 12"];
    [alertView addPicker:firstPicker];
    
    CCAlertPickerItem *secondPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPad Pro Max"];
    [alertView addPicker:secondPicker];
    
    CCActionItem *confirmItem = [CCActionItem itemWithTitle:@"确定" titleColor:UIColor.orangeColor handlerPicker:^(NSArray<CCAlertPickerItem *> * _Nonnull pickItems) {
        NSLog(@"点击了确定 --- %@", pickItems);
    }];
    [alertView addItem:confirmItem];
    [alertView show];
}

- (void)twoItemAlertPicker {
    CCAlertModel *model = [CCAlertModel modelWithTitle:@"温馨提示" message:@"您需要勾选下面的选项"];
    CCAlertView *alertView = [[CCAlertView alloc] initWithModel:model];
    
    CCAlertPickerItem *firstPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPhone 12"];
    [alertView addPicker:firstPicker];
    
    CCAlertPickerItem *secondPicker = [CCAlertPickerItem pickerWithTitle:@"iBlocker的iPad Pro Max"];
    [alertView addPicker:secondPicker];
    
    CCActionItem *cancelItem = [CCActionItem itemWithTitle:@"取消" titleColor:UIColor.magentaColor handler:^{
        NSLog(@"点击了取消");
    }];
    [alertView addItem:cancelItem];
    CCActionItem *confirmItem = [CCActionItem itemWithTitle:@"确定" titleColor:UIColor.brownColor handlerPicker:^(NSArray<CCAlertPickerItem *> * _Nonnull pickItems) {
        NSLog(@"点击了确定 --- %@", pickItems);
    }];
    [alertView addItem:confirmItem];
    [alertView show];
}

- (void)threeItemAlertPicker {
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
}

@end
