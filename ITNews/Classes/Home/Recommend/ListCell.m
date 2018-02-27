//
//  ListCell.m
//  ITNews
//
//  Created by lisongtao on 2018/2/9.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "ListCell.h"
@interface ListCell()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *descLabel;
@property (nonatomic, weak) UIImageView *imageV;
@end

@implementation ListCell

- (void)setModel:(ListModel *)model {
    _model = model;
    
    self.titleLabel.text = model.title;
    self.descLabel.text = model.cate_name;
    self.imageV.backgroundColor = kRandomColor;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImageView *imageV = [UIImageView new];
    self.imageV = imageV;
    imageV.frame = CGRectMake(10, 10, 100, 75);
    imageV.image = [UIImage imageNamed:@"1"];
    [self.contentView addSubview:imageV];
    
    UILabel *titleLabel = [UILabel new];
    self.titleLabel = titleLabel;
    self.titleLabel.width = kScreenWidth - 10 - self.imageV.right - 14;
    titleLabel.numberOfLines = 2;
    titleLabel.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1.0];
    titleLabel.text = @"美国国家队的2018年冬奥会开幕式夹克采用导电墨水技术";
    titleLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:titleLabel];
    
    UILabel *descLabel = [UILabel new];
    self.descLabel = descLabel;
    descLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    descLabel.text = @"网易新闻科技频道";
    descLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:descLabel];
}

- (void)layoutSubviews {
    [self.titleLabel sizeToFit];
    self.titleLabel.width = kScreenWidth - 10 - self.imageV.right - 14;
    self.titleLabel.x = self.imageV.right + 10;
    self.titleLabel.y = 12;
    
    [self.descLabel sizeToFit];
    self.descLabel.x = self.titleLabel.x;
    self.descLabel.bottom = self.contentView.height - 10;
}

@end
