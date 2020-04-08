<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

  $(function($){
	  
	   $(".box").click(function(){
			$.ajax({
				type: "POST",
				url: "json_mobile_mobileLogin.action",
				data: $("#form").serialize(),
				success: function(data){
					if(data.resultFlag){
						if(data.resultCode == "app"){
						 window.AndroidWebView.jsFunction(data.resultMsg);
					}else if(data.resultCode == "ios"){
						IOS.jsFunction(data.resultMsg);
					}
						window.location.href="<%=basePath%>appindex.jsp";
					}else{
						$(".loginResult").text(data.resultData);
					}
				}
			});
		   
	   });
	   
	   
  });


</script>
    <title>登录</title>
 </head>
<body >
<form id="form"  >
    <s:hidden name="user.openId" value="%{#request.openId}"/>
    <div class="login_div">
        <div class="login_box">
        		<p><img class="logo_text" src="<%=basePath %>images/logo.png"></p>
   				 <p class="lim"><img class="tubiao"src="<%=basePath %>images/user.png"><input type="text" name="user.username" placeholder="用户名" autofocus required/></p>
   				<p class="lim"><img class="tubiao"src="<%=basePath %>images/password.png"><input type="password"name="user.password" placeholder="密码" required/></p>
   				   <div class="loginResult"></div>
  			<input class="box" type="button" value="登&nbsp;&nbsp;&nbsp;录" />
            <div class="box_zc"><a href="<%=basePath%>mobile/company/mobile_register.action">注册</a></div><div class="box_wj"><a>忘记密码</a></div>
            </div>
        </div>
        
    
</form>
</body>
</html>
 