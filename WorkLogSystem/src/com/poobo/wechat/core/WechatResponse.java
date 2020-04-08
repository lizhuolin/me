package com.poobo.wechat.core;

import java.util.LinkedList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.poobo.wechat.XmlUtil;

public class WechatResponse {

	/**
     * 获取应答微信通知的字符串
     * @param flag true表示商户接收通知成功并校验成功
     * @return
     */
    public static String getNotifyBackString(boolean flag){
    	List<NameValuePair> returnResult= new LinkedList<NameValuePair>();
    	if(flag){
    		returnResult.add(new BasicNameValuePair("return_code", "SUCCESS"));
    	}else{
    		returnResult.add(new BasicNameValuePair("return_code", "FAIL"));
    	}
    	
    	return XmlUtil.toXml(returnResult);
    }
}
