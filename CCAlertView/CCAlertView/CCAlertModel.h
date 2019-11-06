//
//  CCAlertModel.h
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCAlertModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *messageFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, assign) NSTextAlignment messageAlignment;

- (instancetype)initWithTitle:(NSString *)title
                    titleFont:(UIFont *)titleFont
                   titleColor:(UIColor *)titleColor
                      message:(NSString *)message
                  messageFont:(UIFont *)messageFont
                 messageColor:(UIColor *)messageColor
             messageAlignment:(NSTextAlignment)messageAlignment;
- (instancetype)initWithTitle:(NSString *)title
                    titleFont:(UIFont *)titleFont
                   titleColor:(UIColor *)titleColor
                      message:(NSString *)message
                  messageFont:(UIFont *)messageFont
                 messageColor:(UIColor *)messageColor;
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message;

+ (instancetype)modelWithTitle:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
                       message:(NSString *)message
                   messageFont:(UIFont *)messageFont
                  messageColor:(UIColor *)messageColor
              messageAlignment:(NSTextAlignment)messageAlignment;
+ (instancetype)modelWithTitle:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
                       message:(NSString *)message
                   messageFont:(UIFont *)messageFont
                  messageColor:(UIColor *)messageColor;
+ (instancetype)modelWithTitle:(NSString *)title
                       message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
