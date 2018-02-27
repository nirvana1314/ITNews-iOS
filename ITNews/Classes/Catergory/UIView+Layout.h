//
//  UIView+Layout.h

#import <UIKit/UIKit.h>
@interface UIView (Layout)

// 为方便设置或获取控件大小位置而做的扩展
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat right;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGSize size;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@end
