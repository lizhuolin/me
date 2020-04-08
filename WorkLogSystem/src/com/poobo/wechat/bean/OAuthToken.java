package com.poobo.wechat.bean;

public class OAuthToken {

    private String accessToken;
    private String expires_in;
    private String refresh_token;
    private String scope;
    private String openid;

    public String getAccessToken() {
	return accessToken;
    }

    public void setAccessToken(String accessToken) {
	this.accessToken = accessToken;
    }

    public String getExpires_in() {
	return expires_in;
    }

    public void setExpires_in(String expires_in) {
	this.expires_in = expires_in;
    }

    public String getRefresh_token() {
	return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
	this.refresh_token = refresh_token;
    }

    public String getScope() {
	return scope;
    }

    public void setScope(String scope) {
	this.scope = scope;
    }

    public String getOpenid() {
	return openid;
    }

    public void setOpenid(String openid) {
	this.openid = openid;
    }

}
