//
//  DBWebScheme.h
//  DiaoBao
//
//  Created by lisongtao on 2017/7/20.
//  Copyright © 2017年 lst. All rights reserved.
//

#define kTaoBaoPrefix            @"taobao://"

/*************** 双十一活动 ***************/
#define kFullcutGoodslist       @"diaoyu123://fullcut_goodslist?"
/*************** 优惠券 ***************/
#define kCouponDetail           @"diaoyu123://coupon?"
#define kCoupons                @"diaoyu123://user_coupons"
#define KCoupon_center          @"diaoyu123://coupon_center"
/*************** 邀请钓友, 分享 ***************/
#define kShare                  @"diaoyu123://share?"
/** 邀请好友，h5界面 */
#define kInvitedFriends         @"diaoyu123://invitedfriends"
#define KCopyOrderNumber        @"diaoyu123://copy?"
#define KInviteRule             @"diaoyu123://inviteRule"
/** 邀请好友，RediaoInviteFriendWebVC界面 */
#define KInviteuser             @"diaoyu123://inviteuser"

/*************** 我的订单 ***************/
/** 呼起客服(400电话) */
#define kCustomerService        @"diaoyu123://customerservice?"
/** 取消订单(代付款取消) */
#define kCancelOrder            @"diaoyu123://cancelorder?"
/** 取消订单(退款) */
#define kRefund                 @"diaoyu123://refund?"
/** 去支付 */
#define kPayment                @"diaoyu123://payment?"
/** 再次购买 */
#define kBuyagain               @"diaoyu123://buyagain?"
/** 评价晒单 */
#define kCommentOrder           @"diaoyu123://commentorder?"
/** 确认收货 */
#define kReceiveGoods           @"diaoyu123://receivegoods?"
/** 查看物流 */
#define kLookLogistics          @"diaoyu123://logistics?"
/** 退款详情 */
#define kRefundShow             @"diaoyu123://refundshow?"
/** 在线客服(商城客服) */
#define kOnlineService          @"diaoyu123://onlineservice?"
/** 售后客服(商城售后客服) */
#define kAfterService           @"diaoyu123://afterService"
/** 钓宝客服 */
#define kSnatchService          @"diaoyu123://snatchservice?"

/*************** 一元钓宝 ***************/
/** 钓宝首页 */
#define kSnatchs                @"diaoyu123://snatchs"
/** 钓宝详情页 */
#define kSnatchshow             @"diaoyu123://snatchshow?"
/** 钓宝详情页，调用钓宝确认订单接口获取信息 */
#define kSnatchbuy              @"diaoyu123://snatchbuy?"
/** 钓宝记录 **/
#define kSnatchorders           @"diaoyu123://snatchorders?"
/** 钓宝的订单详情 **/
#define kSnatchorder            @"diaoyu123://snatchorder?"
/** 钓宝帮助 */
#define kSnatchhelp             @"diaoyu123://snatchhelp"


/** 邀请好友 */
#define kInviteUser             @"diaoyu123://inviteuser?"
/** 呼起登录框( 2-刷新/ 1-不处理) */
#define kUserLogin              @"diaoyu123://userlogin?refresh="
/** H5页面 */
#define kH5                     @"diaoyu123://h5?"
/** store-H5页面 */
#define kStoreH5                     @"diaoyu123://store_h5?"
/** 呼起意见反馈 */
#define kFeedback               @"diaoyu123://feedback"
/** 生成请求 */
#define kGenRequest             @"diaoyu123://genrequest?"
/** 添加钓场 */
#define kAddFishing             @"diaoyu123://addfishing"
/** 添加渔具店 */
#define kAddShop                @"diaoyu123://addshop"
/** 发帖 */
#define kAddThread              @"diaoyu123://addthread?fid="
/** 用户主页 */
#define kUserPrefix             @"diaoyu123://user?id="
/** 帖子详情页 */
#define kThreadPrefix           @"diaoyu123://thread?"
/** 钓场详情页 */
#define kFishingPrefix          @"diaoyu123://fishing?id="
/** 渔具店详情页 */
#define kShopPrefix             @"diaoyu123://shop?id="
/** 文章详情页 */
#define kArticlePrefix          @"diaoyu123://article?"
/** 视频详情页 */
#define kVideoPrefix            @"diaoyu123://video?"
/** 新版视频详情页 */
#define kVideoShowPrefix        @"diaoyu123://videoshow?"
/** 新版视频频道页 */
#define kVideoChannelPrefix     @"diaoyu123://videochannel?"
/** 新版视频列表页 */
#define kVideoListPrefix        @"diaoyu123://videolist?"
/** 百科详情页 */
#define kWikiPrefix             @"diaoyu123://wiki?"
/** 投票 */
#define kVotePrefix             @"diaoyu123://vote?"
/** 小视频页面 */
#define KMedias                 @"diaoyu123://medias"
/** 原生视频详情页 */
#define KMediaDetail            @"diaoyu123://media?"
/** 直播页面(四海/快了垂钓) */
#define kWebRotate              @"diaoyu123://webview_rotate?"
/** 标签短视频列表页 */
#define KMediaTag               @"diaoyu123://media_tag?"
/** 花椒详情页 */
#define kHJDetail               @"diaoyu123://huajiaoshow?"


/*************** 会员 ***************/
/** 会员中心 */
#define KVipcenter              @"diaoyu123://vipcenter"
/** 会员权益详情 */
#define KShowprivilege          @"diaoyu123://showprivilege?"
/** 权益规则 */
#define KViprule                @"diaoyu123://viprule"
/** 个人信息 */
#define KBirthday               @"diaoyu123://birthday_modify"

/*************** 专题 ***************/
/** 专题html */
#define kTopicHtmlPrefix              @"diaoyu123://topic?"
/** 专题XAuth */
#define kTopicXAuthPrefix              @"diaoyu123://topic_xauth?"
/** 评论列表 */
#define kTopicReplysPrefix              @"diaoyu123://replys?"
/** 分享 */
#define kTopicSharePrefix               @"diaoyu123://videoshare?"
/** 添加评论 */
#define kTopicReplyAddPrefix            @"diaoyu123://reply_add?"
/** 添加回复 */
#define kTopicCommentReplyPrefix            @"diaoyu123://commentReply?"
/** 赞 */
#define kTopicLikeAddPrefix             @"diaoyu123://like_add?"
/** 顶 */
#define kTopicCommentDingPrefix             @"diaoyu123://commentDing?"

/*************** 商城 ***************/
/** 商城首页 */
#define kMallHome               @"diaoyu123://store"
/** 商城列表页 */
#define kGoodsListPrefix        @"diaoyu123://goodslist?"
/** 商品详情页 */
#define kGoodDetailPrefix       @"diaoyu123://goods?"
/** 限时抢购 */
#define kLimitBuy               @"diaoyu123://limit_buy"

