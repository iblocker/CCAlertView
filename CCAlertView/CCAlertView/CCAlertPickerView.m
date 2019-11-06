//
//  CCAlertPickerView.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCAlertPickerView.h"
#import "CCAlertPickerCell.h"

@interface CCAlertPickerView () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray<CCAlertPickerItem *> *pickerItems;
@end
@implementation CCAlertPickerView

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (instancetype)initWithPickerItems:(NSArray<CCAlertPickerItem *> *)pickerItems {
    if (self = [super initWithFrame:CGRectZero style:UITableViewStyleGrouped]) {
        self.pickerItems = pickerItems;
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.rowHeight = 30;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        self.allowsMultipleSelection = YES;
        
        [self registerClass:[CCAlertPickerCell class] forCellReuseIdentifier:cellReuseIdentifier];
    }
    return self;
}

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pickerItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCAlertPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    cell.item = self.pickerItems[indexPath.row];
    return cell;
}

#pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCAlertPickerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
    [self.pickItems addObject:self.pickerItems[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCAlertPickerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    CCAlertPickerItem *unpickItem = self.pickerItems[indexPath.row];
    [self.pickItems enumerateObjectsUsingBlock:^(CCAlertPickerItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([unpickItem.title isEqualToString:obj.title]) {
            [self.pickItems removeObject:obj];
            *stop = YES;
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - Getter

- (NSMutableArray<CCAlertPickerItem *> *)pickItems {
    if (!_pickItems) {
        _pickItems = @[].mutableCopy;
    }
    return _pickItems;
}

@end
