//
//  CCAlertPickerCell.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "CCAlertPickerCell.h"
#import "CCAlertPickerItem.h"

@interface CCAlertPickerCell ()
@property (nonatomic, strong) UIImageView *circleView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation CCAlertPickerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.circleView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.circleView.bounds = CGRectMake(0, 0, 16, 16);
    self.circleView.center = CGPointMake(10, CGRectGetMidY(self.contentView.frame));
    
    self.titleLabel.bounds = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) - 25, CGRectGetHeight(self.contentView.frame));
    self.titleLabel.center = CGPointMake((CGRectGetWidth(self.contentView.frame) - 25) / 2.0 + 25, CGRectGetMidY(self.contentView.frame));
}

#pragma mark - Setter

- (void)setItem:(CCAlertPickerItem *)item {
    _item = item;
    self.titleLabel.text = item.title;
}

- (void)setSelected:(BOOL)selected {
    UIImage *selectedImage = [UIImage imageNamed:@"alert_picker"];
    UIImage *unselectedImage = [UIImage imageNamed:@"alert_unpicker"];
    self.circleView.image = selected ? selectedImage : unselectedImage;
}

#pragma mark - Getter

- (UIImageView *)circleView {
    if (!_circleView) {
        _circleView = UIImageView.new;
    }
    return _circleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.new;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.f];
    }
    return _titleLabel;
}

@end
