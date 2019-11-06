//
//  CCAlertPickerItem.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCAlertPickerItem : NSObject
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;
+ (instancetype)pickerWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
