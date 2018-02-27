//
//  DetailVC.m
//  ITNews
//
//  Created by lisongtao on 2018/2/9.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "DetailVC.h"
#import <WebKit/WebKit.h>
#import <DTAttributedTextView.h>
#import <DTHTMLAttributedStringBuilder.h>
#import <DTImageTextAttachment.h>
@interface DetailVC ()<DTAttributedTextContentViewDelegate>
@property (nonatomic, weak) DTAttributedTextView *textView;
@end

@implementation DetailVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    
    self.view.backgroundColor = kColorF3F3F3;
    
    [self loadData];
}

- (void)loadData {
    [[INNetworkMgr manager] requestWithUrl:MAKE_REQUEST_URL(@"contents/show") httpMethod:(INHttpMethodGet) params:nil success:^(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code) {
        NSURL *source = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"README" ofType:@"html"]];
        NSData *htmlData = [NSData dataWithContentsOfURL:source];
        // Set our builder to use the default native font face and size
        NSDictionary *builderOptions = @{
                                         DTDefaultFontFamily: @"Helvetica"
                                         };
        DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:originalData
                                                                                                   options:builderOptions
                                                                                        documentAttributes:nil];

        self.textView.attributedString = [stringBuilder generatedAttributedString];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];
}

// 实现图片下载
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame{
    
    if([attachment isKindOfClass:[DTImageTextAttachment class]]){
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        [imageView sd_setImageWithURL:attachment.contentURL placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRetryFailed];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor whiteColor];
        
        return (UIView *)imageView;
    }
    return nil;
}

- (DTAttributedTextView *)textView {
    if (_textView == nil) {
        // Create text view
        DTAttributedTextView *textView = [[DTAttributedTextView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.width, self.view.height-kNavigationBarHeight)];
        _textView = textView;
        // Assign our delegate, this is required to handle link events
        _textView.textDelegate = self;
        
        [self.view addSubview:_textView];
    }
    return _textView;
}

@end
