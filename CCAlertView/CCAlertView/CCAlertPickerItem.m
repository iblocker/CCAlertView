//
//  CCAlertPickerItem.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCAlertPickerItem.h"

@implementation CCAlertPickerItem

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    return self;
}

+ (instancetype)pickerWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

@end
