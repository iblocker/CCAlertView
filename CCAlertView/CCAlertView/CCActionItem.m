//
//  CCActionItem.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCActionItem.h"

@implementation CCActionItem

#pragma mark - 回调点击响应

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler {
    if (self = [super init]) {
        self.title = title;
        self.font = font;
        self.titleColor = titleColor;
        self.handler = handler;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler {
    return [self initWithTitle:title
                          font:[UIFont systemFontOfSize:14]
                    titleColor:titleColor
                       handler:handler];
}

- (instancetype)initWithTitle:(NSString *)title
                      handler:(void(^)(void))handler {
    return [self initWithTitle:title
                    titleColor:[UIColor blueColor]
                       handler:handler];
}

+ (instancetype)itemWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler {
    return [[self alloc] initWithTitle:title
                                  font:font
                            titleColor:titleColor
                               handler:handler];
}

+ (instancetype)itemWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                      handler:(void(^)(void))handler {
    return [[self alloc] initWithTitle:title
                            titleColor:titleColor
                               handler:handler];
}

+ (instancetype)itemWithTitle:(NSString *)title
                      handler:(void(^)(void))handler {
    return [[self alloc] initWithTitle:title
                               handler:handler];
}

#pragma mark - 回调Picker

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    if (self = [super init]) {
        self.title = title;
        self.font = font;
        self.titleColor = titleColor;
        self.handlerPicker = handlerPicker;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    return [self initWithTitle:title
                          font:[UIFont systemFontOfSize:14]
                    titleColor:titleColor
                 handlerPicker:handlerPicker];
}

- (instancetype)initWithTitle:(NSString *)title
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    return [self initWithTitle:title
                    titleColor:[UIColor blueColor]
                 handlerPicker:handlerPicker];
}

+ (instancetype)itemWithTitle:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    return [[self alloc] initWithTitle:title
                                  font:font
                            titleColor:titleColor
                         handlerPicker:handlerPicker];
}

+ (instancetype)itemWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    return [[self alloc] initWithTitle:title
                            titleColor:titleColor
                         handlerPicker:handlerPicker];
}

+ (instancetype)itemWithTitle:(NSString *)title
                handlerPicker:(void (^)(NSArray<CCAlertPickerItem *> *pickItems))handlerPicker {
    return [[self alloc] initWithTitle:title
                         handlerPicker:handlerPicker];
}

@end
