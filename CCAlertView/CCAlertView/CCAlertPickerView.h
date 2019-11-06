//
//  CCAlertPickerView.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAlertPickerItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCAlertPickerView : UITableView

@property (nonatomic, strong) NSMutableArray<CCAlertPickerItem *> *pickItems;

- (instancetype)initWithPickerItems:(NSArray<CCAlertPickerItem *> *)pickerItems;

@end

NS_ASSUME_NONNULL_END
