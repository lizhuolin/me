package com.poobo.wechat;


public class WechatUrl {
    
    private static String accessTokenUrl="https://api.weixin.qq.com/sns/oauth2/access_token";
    private static String weChatOpenUrl="https://open.weixin.qq.com/connect/oauth2/authorize";
   private static String userInfoUrl="https://api.weixin.qq.com/sns/userinfo";
//   private static String userInfoUrl="https://api.weixin.qq.com/cgi-bin/user/info";
    
    /**
     * token获取地址
     * @author malei 2016年3月20日 上午10:28:06
     * @param appID
     * @param appsecret
     * @param code
     * @return
     */
    public static String accessTokenUrl(String appID,String appsecret,String code){
	 return WechatUrl.accessTokenUrl+"?appid=" + appID + "&secret=" + appsecret + "&code=" + code +  "&grant_type=authorization_code";
    }
   
    /**
     * 微信页面重定向
     * @author malei 2016年3月20日 上午11:20:23
     * @param appID
     * @param url
     * @return
     */
    public static String redirectUrl(String appID,String url){
	return weChatOpenUrl+"?appid="
		+ appID
		+ "&redirect_uri="
		+ url
		+ "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
    }
    
    public static String getUserInfoUrl(String openId,String accessToken){
	return userInfoUrl+"?access_token=" + accessToken + "&openid=" + openId + "&lang=zh_CN";
    }
	
    
    

}
