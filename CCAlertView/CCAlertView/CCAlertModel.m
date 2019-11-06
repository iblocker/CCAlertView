//
//  CCAlertModel.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCAlertModel.h"

@implementation CCAlertModel

- (instancetype)initWithTitle:(NSString *)title
                    titleFont:(UIFont *)titleFont
                   titleColor:(UIColor *)titleColor
                      message:(NSString *)message
                  messageFont:(UIFont *)messageFont
                 messageColor:(UIColor *)messageColor
             messageAlignment:(NSTextAlignment)messageAlignment {
    if (self = [super init]) {
        self.title = title;
        self.titleFont = titleFont;
        self.titleColor = titleColor;
        self.message = message;
        self.messageFont = messageFont;
        self.messageColor = messageColor;
        self.messageAlignment = messageAlignment;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    titleFont:(UIFont *)titleFont
                   titleColor:(UIColor *)titleColor
                      message:(NSString *)message
                  messageFont:(UIFont *)messageFont
                 messageColor:(UIColor *)messageColor {
    return [self initWithTitle:title
                     titleFont:titleFont
                    titleColor:titleColor
                       message:message
                   messageFont:messageFont
                  messageColor:messageColor
              messageAlignment:NSTextAlignmentCenter];
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message {
    return [self initWithTitle:title
                     titleFont:[UIFont boldSystemFontOfSize:17]
                    titleColor:[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.f]
                       message:message messageFont:[UIFont systemFontOfSize:14]
                  messageColor:[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.f]
              messageAlignment:NSTextAlignmentCenter];
}

+ (instancetype)modelWithTitle:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
                       message:(NSString *)message
                   messageFont:(UIFont *)messageFont
                  messageColor:(UIColor *)messageColor
              messageAlignment:(NSTextAlignment)messageAlignment {
    return [[self alloc] initWithTitle:title
                             titleFont:titleFont
                            titleColor:titleColor
                               message:message
                           messageFont:messageFont
                          messageColor:messageColor
                      messageAlignment:messageAlignment];
}

+ (instancetype)modelWithTitle:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
                       message:(NSString *)message
                   messageFont:(UIFont *)messageFont
                  messageColor:(UIColor *)messageColor {
    return [[self alloc] initWithTitle:title
                             titleFont:titleFont
                            titleColor:titleColor
                               message:message
                           messageFont:messageFont
                          messageColor:messageColor];
}

+ (instancetype)modelWithTitle:(NSString *)title
                       message:(NSString *)message {
    return [[self alloc] initWithTitle:title
                               message:message];
}

@end
