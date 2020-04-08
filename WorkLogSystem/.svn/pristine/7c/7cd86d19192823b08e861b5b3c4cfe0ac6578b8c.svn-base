package com.poobo.wechat;

import com.poobo.core.util.PropertyUtil;


public class WechatProperty {

    /**
     * 微信appid
     */
   private static String wechatAppId;
    /**
     * 微信appsecret
     */
   private static String wechatAppsecret;
   /**
    * 微信商铺id
    */
   private static String wechatStoreId;
   /**
    * 微信商铺key
    */
   private static String wechatStorekey;
   private static String wechatNotifyUrl;

    
    static {
	
	wechatAppId=PropertyUtil.wechatProperty.getProperty("wechat.appID");
	wechatAppsecret=PropertyUtil.wechatProperty.getProperty("wechat.appsecret");
	 wechatStoreId=PropertyUtil.wechatProperty.getProperty("wechat.storeId");
	 wechatStorekey=PropertyUtil.wechatProperty.getProperty("wechat.storekey");
	 wechatNotifyUrl=PropertyUtil.wechatProperty.getProperty("wechat.notifyUrl");
}


    public static String getWechatAppId() {
        return wechatAppId;
    }


    public static String getWechatAppsecret() {
        return wechatAppsecret;
    }


    public static String getWechatStoreId() {
        return wechatStoreId;
    }


    public static String getWechatStorekey() {
        return wechatStorekey;
    }


	public static String getWechatNotifyUrl() {
		return wechatNotifyUrl;
	}

    
}
