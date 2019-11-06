//
//  CCAlertPickerCell.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CCAlertPickerItem;
@interface CCAlertPickerCell : UITableViewCell
@property (nonatomic, strong) CCAlertPickerItem *item;
@end

NS_ASSUME_NONNULL_END
