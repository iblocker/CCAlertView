//
//  CCAlertView.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAlertModel.h"
#import "CCAlertPickerItem.h"
#import "CCActionItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCAlertView : UIView

- (instancetype)initWithModel:(CCAlertModel *)alertModel;

- (void)addPicker:(CCAlertPickerItem *)pickerItem;

- (void)addItem:(CCActionItem *)alertItem;

- (void)show;

@end

NS_ASSUME_NONNULL_END
