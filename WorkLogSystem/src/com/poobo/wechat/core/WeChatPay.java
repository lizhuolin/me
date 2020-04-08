package com.poobo.wechat.core;

import java.io.UnsupportedEncodingException;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.poobo.wechat.GetWxOrderno;
import com.poobo.wechat.RequestHandler;
import com.poobo.wechat.Sha1Util;
import com.poobo.wechat.TenpayUtil;
import com.poobo.wechat.WechatProperty;
import com.poobo.wechat.bean.JsPayBean;

/**
 * 微信支付
 * 
 * @author malei 2016年3月20日 下午4:44:05
 *
 */
public class WeChatPay {
    private static Logger log = Logger.getLogger(WeChatPay.class);
    
    
    
    /**
     * 
     * @author malei 2016年3月20日 下午6:24:33
     * @param orderNo 单号
     * @param totlal_fee 金额
     * @param code 授权码
     * @param device_info 支付设备号
     * @param body 商品描述
     * @param attach 附加数据
     * @param notify_url 异步通知地址
     * @param spbill_create_ip 终端IP
     * @return
     * @throws UnsupportedEncodingException 
     */
    public static JsPayBean WechatJsPayInfo(String orderNo,
	    Double totlal_fee, String openId,String device_info
	    ,String body,String attach,String notify_url,String spbill_create_ip) throws UnsupportedEncodingException {

	// 金额转化为分为单位
	float sessionmoney = Float.parseFloat(totlal_fee + "");
	String finalmoney = String.format("%.2f", sessionmoney);
	finalmoney = finalmoney.replace(".", "");

	Integer evnetMoney = Integer.parseInt(finalmoney);

	// 商户相关资料
	String appid = WechatProperty.getWechatAppId();
	String appsecret = WechatProperty.getWechatAppsecret();
	String partner = WechatProperty.getWechatStoreId();
	String partnerkey = WechatProperty.getWechatStorekey();


	if (StringUtils.isNotEmpty(openId)) {
	    // 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
	    String currTime = TenpayUtil.getCurrTime();
	    // 8位日期
	    String strTime = currTime.substring(8, currTime.length());
	    // 四位随机数
	    String strRandom = TenpayUtil.buildRandom(4) + "";
	    // 10位序列号,可以自行调整。
	    String strReq = strTime + strRandom;

	    // 商户号
	    String mch_id = partner;
	    // 子商户号 非必输
	    // String sub_mch_id="";
	    // 设备号 非必输
//	    String device_info = "";
	    // 随机数
	    String nonce_str = strReq;
	    // 商品描述
	    // String body = describe;

	    // 商品描述根据情况修改
//	    String body = "";
	    // 附加数据
//	    String attach = ;
	    // 商户订单号
	    String out_trade_no = orderNo;

	    // 订单生成的机器 IP
//	    String spbill_create_ip = getRequest().getRemoteAddr();
	    // 订 单 生 成 时 间 非必输
	    // String time_start ="";
	    // 订单失效时间 非必输
	    // String time_expire = "";
	    // 商品标记 非必输
	    // String goods_tag = "";

	    // 这里notify_url是 支付完成后微信发给该链接信息。
//	    String notify_url = "";

	    String trade_type = "JSAPI";
	    // 非必输
	    SortedMap<String, String> packageParams = new TreeMap<String, String>();
	    packageParams.put("appid", appid);
	    packageParams.put("mch_id", mch_id);
	    packageParams.put("nonce_str", nonce_str);
	    packageParams.put("body", body);
//	    packageParams.put("attach", attach);
	    packageParams.put("out_trade_no", out_trade_no);

	    // 这里写的金额为1 分到时修改
	    packageParams.put("total_fee", evnetMoney + "");
//	    packageParams.put("spbill_create_ip", spbill_create_ip);
	    packageParams.put("notify_url", notify_url);

	    packageParams.put("trade_type", trade_type);
	    packageParams.put("openid", openId);

	    RequestHandler reqHandler = new RequestHandler();
	    reqHandler.init(appid, appsecret, partnerkey);
	    String sign = reqHandler.createSign(packageParams);
	    
	    String xml="<xml>"+
			"<appid>"+appid+"</appid>"+
			"<mch_id>"+mch_id+"</mch_id>"+
			"<nonce_str>"+nonce_str+"</nonce_str>"+
			"<sign>"+sign+"</sign>"+
			"<body><![CDATA["+body+"]]></body>"+
//			"<attach>"+attach+"</attach>"+
			"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
			"<total_fee>"+evnetMoney+"</total_fee>"+
//			"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
			"<notify_url>"+notify_url+"</notify_url>"+
			"<trade_type>"+trade_type+"</trade_type>"+
			"<openid>"+openId+"</openid>"+
			"</xml>";
	    log.info("get pay info xml:"+xml);
	    String allParameters = "";
	     
	    allParameters = reqHandler.genPackage(packageParams);
	    // 获取预支付prepay_id
	    String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	    String prepay_id = "";
	     prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
	     if (prepay_id.equals("")) {
		   log.error("统一支付接口获取预支付订单出错");
		}else{
		    SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		    String  timestamp = Sha1Util.getTimeStamp();
		    String prepay_id2 = "prepay_id=" + prepay_id;
		    finalpackage.put("appId", appid);
		    finalpackage.put("timeStamp", timestamp);
		    finalpackage.put("nonceStr", nonce_str);
		    finalpackage.put("package", prepay_id2);
		    finalpackage.put("signType", "MD5");
		    String finalsign = reqHandler.createSign(finalpackage);
		    return new JsPayBean(appid, timestamp, nonce_str, prepay_id2, "MD5", finalsign);
		}
	  
	}
	return null;
    }
}
