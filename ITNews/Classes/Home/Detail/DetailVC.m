//
//  DetailVC.m
//  ITNews
//
//  Created by lisongtao on 2018/2/9.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "DetailVC.h"
#import <WebKit/WebKit.h>
#import <DTCoreText.h>
#import <DTWebVideoView.h>
@interface DetailVC ()<DTAttributedTextContentViewDelegate>
@property (nonatomic, weak) DTAttributedTextView *textView;
@property (nonatomic, weak) UIWebView *webView;
@end

@implementation DetailVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    
    self.view.backgroundColor = kColorF3F3F3;
    
    [self loadData];
}

- (void)loadData {
    NSString *str = [NSString stringWithFormat:@"%@?cid=%@", MAKE_REQUEST_URL(@"contents/show"), self.cid];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
//    [dict setValue:self.cid forKey:@"cid"];
//    [[INNetworkMgr manager] requestWithUrl:MAKE_REQUEST_URL(@"contents/show") httpMethod:(INHttpMethodGet) params:dict success:^(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code) {
////        NSURL *source = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"README" ofType:@"html"]];
////        NSData *htmlData = [NSData dataWithContentsOfURL:source];
//        // Set our builder to use the default native font face and size
//        NSDictionary *builderOptions = @{
//                                         DTDefaultFontFamily: @"Helvetica"
//                                         };
//        DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:originalData
//                                                                                                   options:builderOptions
//                                                                                        documentAttributes:nil];
//
//        self.textView.attributedString = [stringBuilder generatedAttributedString];
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//
//    }];
}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame
{
    if ([attachment isKindOfClass:[DTImageTextAttachment class]])
    {
        // if the attachment has a hyperlinkURL then this is currently ignored
        DTLazyImageView *imageView = [[DTLazyImageView alloc] initWithFrame:frame];
        imageView.delegate = self;
        
        // sets the image if there is one
        imageView.image = [(DTImageTextAttachment *)attachment image];
        
        // url for deferred loading
//        imageView.url = attachment.contentURL;
        imageView.url = [NSURL URLWithString:@"https://www.cocoanetics.com/files/Cocoanetics_Square.jpg"];
        
        // if there is a hyperlink then add a link button on top of this image
        if (attachment.hyperLinkURL)
        {
            // NOTE: this is a hack, you probably want to use your own image view and touch handling
            // also, this treats an image with a hyperlink by itself because we don't have the GUID of the link parts
            imageView.userInteractionEnabled = YES;
            
            DTLinkButton *button = [[DTLinkButton alloc] initWithFrame:imageView.bounds];
            button.URL = attachment.hyperLinkURL;
            button.minimumHitSize = CGSizeMake(25, 25); // adjusts it's bounds so that button is always large enough
            button.GUID = attachment.hyperLinkGUID;
            
            // use normal push action for opening URL
            [button addTarget:self action:@selector(linkPushed:) forControlEvents:UIControlEventTouchUpInside];
            
            // demonstrate combination with long press
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(linkLongPressed:)];
            [button addGestureRecognizer:longPress];
            
            [imageView addSubview:button];
        }
        
        return imageView;
    }
    else if ([attachment isKindOfClass:[DTIframeTextAttachment class]])
    {
        DTWebVideoView *videoView = [[DTWebVideoView alloc] initWithFrame:frame];
        videoView.attachment = attachment;
        
        return videoView;
    }
    else if ([attachment isKindOfClass:[DTObjectTextAttachment class]])
    {
        // somecolorparameter has a HTML color
        NSString *colorName = [attachment.attributes objectForKey:@"somecolorparameter"];
        UIColor *someColor = DTColorCreateWithHTMLName(colorName);
        
        UIView *someView = [[UIView alloc] initWithFrame:frame];
        someView.backgroundColor = someColor;
        someView.layer.borderWidth = 1;
        someView.layer.borderColor = [UIColor blackColor].CGColor;
        
        someView.accessibilityLabel = colorName;
        someView.isAccessibilityElement = YES;
        
        return someView;
    }
    
    return nil;
}

// 实现图片下载
//- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame{
//
//    if([attachment isKindOfClass:[DTImageTextAttachment class]]){
//
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
//        [imageView sd_setImageWithURL:attachment.contentURL placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRetryFailed];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        imageView.backgroundColor = [UIColor whiteColor];
//
//        return (UIView *)imageView;
//    }
//    return nil;
//}

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

- (UIWebView *)webView {
    if (_webView == nil) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _webView = webView;
        [self.view addSubview:_webView];
    }
    return _webView;
}

@end
