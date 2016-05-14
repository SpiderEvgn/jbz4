class Wechat::Jbzlocal::Order < ActiveRecord::Base

##
# t.string   "orderId",           limit: 255 # 订单号
# t.string   "offerId",           limit: 255 # 订座院线ID
# t.string   "confirmId",         limit: 255 # 兑换码
# t.string   "offerOrderId",      limit: 255 # 兑票订单号
# t.string   "thirdConfirmId",    limit: 255 # 第三方前台兑换码 (经3DES加密)//订座票独有 金逸 订座院线特殊取票凭证,金逸自助机和前台的系统是两 家公司做的,取票码不同步,前台兑票码和自助器的兑 票码不一样
# t.string   "takeTicketPostion", limit: 255 # 取票位置提示
# t.text     "smTemplate",       limit: 255 # 短信模版
# t.string   "isCheckGround",     limit: 255 # 落地状态 0:无需要落地,可以认为订单成功; 1:正在影院确认中,这种状态下需要十分钟内来查询三次以上直到落地成功
# t.string   "mobile",            limit: 255 # 手机号
# t.string   "seatType",          limit: 255 # 取票类型-1 为电子票 
                                             # 当 seatType=6 时,thirdConfirmId 有值
                                             # confirmId =12345678 offerOrderId=12345645 thirdConfirmId=123456123
                                             # * 1.请凭订单号12345645和取票码12345678至XX取 票机取票,如遇机器故障凭影院订单号12345645和取 票码12345678至柜台取票
                                             # * 2.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院订单号12345645和取票码12345678至柜 台取票
                                             # * 3.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院取票码12345678至柜台取票
                                             # * 4.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院取票码12345678至柜台取票
                                             # * 5.请凭取票码12345678及手机号至XX取票机取票, 如遇机器故障凭影院取票码12345678及手机号至柜 台取票
                                             # * 6.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院订单号12345645和取票码123456123至柜 台取票
                                             # * 7.请凭取票码12345678至XX取票机取票,如遇机器 故障凭取票码12345678至柜台取票
# t.string   "card",              limit: 255 # 浦发银行卡号
# t.string   "payMethod",         limit: 255 # 支付方式 1: 信用卡；2: 积分
# t.string   "platformId",        limit: 255 # 平台 1: 卖座网； 2: 蜘蛛网

end
