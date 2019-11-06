//
//  CCAlertView.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCAlertView.h"
#import "CCAlertPickerView.h"

@interface CCAlertView () {
    CGFloat _viewHeight;
}
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) CCAlertPickerView *pickerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) CCAlertModel *alertModel;
@property (nonatomic, strong) NSArray<CCAlertPickerItem *> *pickerItems;
@property (nonatomic, strong) NSArray<CCActionItem *> *actionItems;

@property (nonatomic, assign) CGFloat popupWidth;
@end
@implementation CCAlertView

static CGFloat left_margin = 60;

- (instancetype)initWithModel:(CCAlertModel *)alertModel {
    if (self = [super init]) {
        self.frame = UIScreen.mainScreen.bounds;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
        self.alertModel = alertModel;
    }
    return self;
}

- (void)addPicker:(CCAlertPickerItem *)pickerItem {
    NSMutableArray<CCAlertPickerItem *> *items = @[].mutableCopy;
    if (self.pickerItems.count > 0) {
        [items addObjectsFromArray:self.pickerItems];
    }
    if (pickerItem != nil) {
        [items addObject:pickerItem];
    }
    self.pickerItems = items;
}

- (void)addItem:(CCActionItem *)actionItem {
    NSMutableArray<CCActionItem *> *items = @[].mutableCopy;
    if (self.actionItems.count > 0 && self.actionItems.count < 3) {
        //  限制添加的按钮数量最多为3个
        [items addObjectsFromArray:self.actionItems];
    }
    if (actionItem != nil) {
        [items addObject:actionItem];
    }
    self.actionItems = items;
}

- (void)show {
    [self setupSubviews];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
#pragma clang diagnostic pop
    [keyWindow addSubview:self];
    [keyWindow bringSubviewToFront:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}

#pragma mark - Private

- (void)setupSubviews {
    [self layoutSubviews:self.alertModel];
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.messageLabel];
    [self setupPicker];
    [self setupActionItems];
}

- (void)setupActionItems {
    NSAssert(self.actionItems.count, @"请初始化一个按钮");
    
    UIView *horizontalLine = UIView.new;
    horizontalLine.center = CGPointMake(self.popupWidth / 2.0, _viewHeight - 41);
    horizontalLine.bounds = CGRectMake(0, 0, self.popupWidth, 1);
    horizontalLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.f];
    [self.bgView addSubview:horizontalLine];
    
    for (int i = 0; i < self.actionItems.count; i ++) {
        CCActionItem *item = self.actionItems[i];
        
        UIButton *action = [UIButton buttonWithType:UIButtonTypeCustom];
        action.tag = 10086 + i;
        action.titleLabel.font = item.font ? : [UIFont systemFontOfSize:14];
        CGFloat width = CGRectGetWidth(self.bgView.frame);
        CGFloat w = (width - self.actionItems.count + 1) / self.actionItems.count;
        CGFloat h = 40;
        CGFloat x = (w + 1) * i;
        CGFloat y = _viewHeight - 40;
        action.frame = CGRectMake(x, y, w, h);
        [action setTitle:item.title
                forState:UIControlStateNormal];
        UIColor *titleColor = item.titleColor ? : [UIColor lightGrayColor];
        [action setTitleColor:titleColor
                     forState:UIControlStateNormal];
        [action setBackgroundImage:[self imageWithColor:UIColor.whiteColor]
                          forState:UIControlStateNormal];
        [action setBackgroundImage:[self imageWithColor:[UIColor colorWithWhite:0.7 alpha:0.7]]
                          forState:UIControlStateHighlighted];
        [action addTarget:self
                   action:@selector(actionTouchUpInside:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:action];
        
        if (i > 0) {    //  i 为0时 不需要分割线
            UIView *verticalLine = UIView.new;
            verticalLine.frame = CGRectMake((w + 1) * i - 1, y, 1, h);
            verticalLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.f];
            [self.bgView addSubview:verticalLine];
        }
    }
}

- (void)setupPicker {
    if (self.pickerItems.count) {
        CCAlertPickerView *pickerView = [[CCAlertPickerView alloc] initWithPickerItems:self.pickerItems];
        pickerView.frame = CGRectMake(20, CGRectGetMaxY(self.messageLabel.frame) + 10, self.popupWidth - 20, 30 * self.pickerItems.count);
        _pickerView = pickerView;
        [self.bgView addSubview:pickerView];
    }
}

- (void)layoutSubviews:(CCAlertModel *)alertModel {
    _alertModel = alertModel;
    CGRect rect = [self getHeightOfText:alertModel.message
                                  width:self.popupWidth - 40
                                   font:alertModel.messageFont ? : [UIFont systemFontOfSize:14]];
    //  设置最大高度
    if (rect.size.height > 300) {
        rect.size.height = 300;
    }
    _viewHeight = rect.size.height + 39 + 15 + 40 + 22 + 30 * self.pickerItems.count;
    self.messageLabel.text = alertModel.message;
    self.messageLabel.font = alertModel.messageFont;
    self.messageLabel.textColor = alertModel.messageColor;
    self.messageLabel.textAlignment = alertModel.messageAlignment;
    self.messageLabel.frame = CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame) + 15, self.popupWidth - 40, rect.size.height);
        
    self.titleLabel.text = alertModel.title;
    self.titleLabel.font = alertModel.titleFont;
    self.titleLabel.textColor = alertModel.titleColor;
}


#pragma mark - Method

/**
 *  根据颜色生成图片
 */
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (CGRect)getHeightOfText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 0)
                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect;
}

#pragma mark - Action

- (void)actionTouchUpInside:(UIButton *)sender {
    [self dismiss];
    CCActionItem *item = self.actionItems[sender.tag - 10086];
    if (item.handler) {
        item.handler();
    }
    if (item.handlerPicker) {
        item.handlerPicker(self.pickerView.pickItems);
    }
}

#pragma mark - Subviews

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.center = self.center;
        _bgView.bounds = (CGRect){0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - left_margin * 2, _viewHeight};
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 8;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (CCAlertPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[CCAlertPickerView alloc] initWithPickerItems:self.pickerItems];
    }
    return _pickerView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.center = CGPointMake(CGRectGetWidth(self.bgView.frame) / 2.0, 29);
        _titleLabel.bounds = CGRectMake(0, 0, CGRectGetWidth(self.bgView.frame) - 40, 24);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _messageLabel;
}

- (CGFloat)popupWidth {
    return CGRectGetWidth(self.frame) - 2 * left_margin;
}

@end
