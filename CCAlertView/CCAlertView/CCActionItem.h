//
//  CCActionItem.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAlertPickerItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCActionItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, copy) void(^handler)(void);
@property (nonatomic, copy) void(^handlerPicker)(NSArray<CCAlertPickerItem *> *pickItems);

#pragma mark - 回调点击响应

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler;
- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler;
- (instancetype)initWithTitle:(NSString *)title
                      handler:(void(^)(void))handler;

+ (instancetype)itemWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler;
+ (instancetype)itemWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler;
+ (instancetype)itemWithTitle:(NSString *)title
                      handler:(void(^)(void))handler;

#pragma mark - 回调Picker

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;
- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;
- (instancetype)initWithTitle:(NSString *)title
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;

+ (instancetype)itemWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;
+ (instancetype)itemWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;
+ (instancetype)itemWithTitle:(NSString *)title
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker;

@end

NS_ASSUME_NONNULL_END
