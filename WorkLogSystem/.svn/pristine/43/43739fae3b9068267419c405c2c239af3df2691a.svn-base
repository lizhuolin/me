package com.poobo.wechat.core;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.poobo.wechat.WechatProperty;
import com.poobo.wechat.WechatUrl;
import com.poobo.wechat.bean.OAuthToken;
import com.poobo.wechat.bean.User;

public class WechatRequest {
    private static Logger log = Logger.getLogger(WechatRequest.class);

    public static OAuthToken getLoginUserAccessToken(String code) {

	String appID = WechatProperty.getWechatAppId();
	String appsecret = WechatProperty.getWechatAppsecret();
	// 请求access_token接口获取access_token
	String apiUrl = WechatUrl.accessTokenUrl(appID, appsecret, code);

	try {
	    CloseableHttpClient httpclient = HttpClients.createDefault();
	    HttpGet httpGet = new HttpGet(apiUrl);
	    CloseableHttpResponse response1 = httpclient.execute(httpGet);
	    if (response1.getStatusLine().getStatusCode() == 200) {
		String result = EntityUtils.toString(response1.getEntity());
		log.info("use code " + code + " get result:" + result);
		try {
		    JSONObject json = JSONObject.parseObject(result);
		    String access_token = json.getString("access_token");
		    String expires_in = json.getString("expires_in");
		    String refresh_token = json.getString("refresh_token");
		    String scope = json.getString("scope");
		    String openid = json.getString("openid");

		    OAuthToken oAuthToken = new OAuthToken();
		    oAuthToken.setAccessToken(access_token);
		    oAuthToken.setExpires_in(expires_in);
		    oAuthToken.setOpenid(openid);
		    oAuthToken.setRefresh_token(refresh_token);
		    oAuthToken.setScope(scope);
		    return oAuthToken;

		} catch (JSONException e) {
		    log.error("get token error");
		    e.printStackTrace();
		}
	    }

	    response1.close();

	} catch (ClientProtocolException e1) {
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	} catch (IOException e1) {
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}

	return null;
    }

    public static User getWechatUserInfo(String code) {
	
	OAuthToken oAuthToken = WechatRequest
		.getLoginUserAccessToken(code);
	String openId=oAuthToken.getOpenid();
       //http://mp.weixin.qq.com/wiki/1/8a5ce6257f1d3b2afb20f83e72b72ce9.html
	// 请求access_token接口获取access_token
	String apiUrl = WechatUrl.getUserInfoUrl(openId, oAuthToken.getAccessToken());

	try {
	    CloseableHttpClient httpclient = HttpClients.createDefault();
	    HttpGet httpGet = new HttpGet(apiUrl);
	    CloseableHttpResponse response1 = httpclient.execute(httpGet);
	    if (response1.getStatusLine().getStatusCode() == 200) {
		String result = EntityUtils.toString(response1.getEntity(),"UTF-8");
		log.info("use openId " + openId + " get result:" + result);
		try {
		    JSONObject json = JSONObject.parseObject(result);
		    String nickname = json.getString("nickname");
		    int sex = json.getIntValue("sex");
		    String province = json.getString("province");
		    String city = json.getString("city");
		    String country = json.getString("country");
		    String headimgurl = json.getString("headimgurl");
		    int subscribe = json.getIntValue("subscribe");
		    
		    User user = new User();
		    user.setCity(city);
		    user.setCountry(country);
		    user.setHeadimgurl(headimgurl);
		    user.setNickname(nickname);
		    user.setSubscribe(subscribe);
		    user.setProvince(province);
		    user.setSex(sex);
		    user.setOpenId(openId);
		    user.setCode(code);
		    return user;

		} catch (JSONException e) {
		    log.error("get user info error");
		    e.printStackTrace();
		}
	    }

	    response1.close();

	} catch (ClientProtocolException e1) {
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	} catch (IOException e1) {
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}

	return null;
    }

}
