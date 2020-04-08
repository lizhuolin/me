package com.poobo.wechat.bean;

public class AccessToken {
   
      private String accessToken;
      private int expiresIn;
      
      public AccessToken() {}
      
      public String getAccessToken()
      {
       return this.accessToken;
      }
      
      public void setAccessToken(String accessToken) {
       this.accessToken = accessToken;
      }
      
      public int getExpiresIn() {
        return this.expiresIn;
      }
      
      public void setExpiresIn(int expiresIn) {
        this.expiresIn = expiresIn;
      }

}
