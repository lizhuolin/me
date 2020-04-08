package com.poobo.wechat.bean;

public class User {
    
  /*  正常情况下，微信会返回下述JSON数据包给公众号：

    {
        "subscribe": 1, 
        "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M", 
        "nickname": "Band", 
        "sex": 1, 
        "language": "zh_CN", 
        "city": "广州", 
        "province": "广东", 
        "country": "中国", 
        "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0", 
       "subscribe_time": 1382694957,
       "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
       "remark": "",
       "groupid": 0
    }
    参数说明

    参数	说明
    subscribe	用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。
    openid	用户的标识，对当前公众号唯一
    nickname	用户的昵称
    sex	用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
    city	用户所在城市
    country	用户所在国家
    province	用户所在省份
    language	用户的语言，简体中文为zh_CN
    headimgurl	用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。
    subscribe_time	用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
    unionid	只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。详见：获取用户个人信息（UnionID机制）
    remark	公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注
    groupid	用户所在的分组ID
    错误时微信会返回错误码等信息，JSON数据包示例如下（该示例为AppID无效错误）:

    {"errcode":40013,"errmsg":"invalid appid"}*/
	
	private String nickname;//
	private int sex;//
	private String province;//
	private String city;//
	private String country;//
	private String headimgurl;//
	private int subscribe;//
	private String subscribeTime;
	private String unionid;
	private String remark;
	private String groupid;
	private String code;
	private String openId;
	
	private OAuthToken oAuthToken;
	
	public String getNickname() {
	    return nickname;
	}
	public void setNickname(String nickname) {
	    this.nickname = nickname;
	}
	public int getSex() {
	    return sex;
	}
	public void setSex(int sex) {
	    this.sex = sex;
	}
	public String getProvince() {
	    return province;
	}
	public void setProvince(String province) {
	    this.province = province;
	}
	public String getCity() {
	    return city;
	}
	public void setCity(String city) {
	    this.city = city;
	}
	public String getCountry() {
	    return country;
	}
	public void setCountry(String country) {
	    this.country = country;
	}
	public String getHeadimgurl() {
	    return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
	    this.headimgurl = headimgurl;
	}
	public int getSubscribe() {
	    return subscribe;
	}
	public void setSubscribe(int subscribe) {
	    this.subscribe = subscribe;
	}
	public String getSubscribeTime() {
	    return subscribeTime;
	}
	public void setSubscribeTime(String subscribeTime) {
	    this.subscribeTime = subscribeTime;
	}
	public String getUnionid() {
	    return unionid;
	}
	public void setUnionid(String unionid) {
	    this.unionid = unionid;
	}
	public String getRemark() {
	    return remark;
	}
	public void setRemark(String remark) {
	    this.remark = remark;
	}
	public String getGroupid() {
	    return groupid;
	}
	public void setGroupid(String groupid) {
	    this.groupid = groupid;
	}
	public String getCode() {
	    return code;
	}
	public void setCode(String code) {
	    this.code = code;
	}
	public String getOpenId() {
	    return openId;
	}
	public void setOpenId(String openId) {
	    this.openId = openId;
	}
	public OAuthToken getoAuthToken() {
		return oAuthToken;
	}
	public void setoAuthToken(OAuthToken oAuthToken) {
		this.oAuthToken = oAuthToken;
	}
	
	
	

}
