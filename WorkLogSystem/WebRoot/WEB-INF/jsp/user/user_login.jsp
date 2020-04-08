<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
<link href="<%=basePath%>css/loginUIstyle.css" rel="stylesheet" />

<script type="text/javascript">

 if ($("aside").size() != 0 ){
	 location.assign(location.href); 
 }

   $(function($){
	  
	   $(".lg_btn").click(function(){
		   $("#form").submit();
	   });
	   
	 $(".zc_btn").click(function() {
		 location.assign("<%=basePath%>company/company_companyRegiste.action");
      });
	   
	 $("#download").click(function() {
		 location.assign("<%=basePath%>user/user_download.action");
      });
	 
	 
	   $(window).keydown(function(event){
		   switch(event.keyCode) {
		   case 13:
			   $("#form").submit();
		   }
		 });
	   
   });

</script>
<title>登录</title>
</head>



<body>
  <form id="form" action="<%=basePath %>user/user_login.action" method="post" >
	<div class="lg_bg">
		<div class="lg_disc">
		
        <img id="date" src="../images/logo.png">
			<ul>
				<li><span class="span"><img src="../images/yonghu.png"></span><span><input
					type="text" name="user.username" placeholder="请输入用户名" /></span></li>
				<li><span class="span"><img src="../images/mima.png"></span><span><input
					type="password" name="user.password" placeholder="请输入密码" /></span></li>
				   <label><s:property value="loginResult"/></label>
			</ul>
		

			<div class="zc_btn">
				<a>注册</a>

                </div>
             

            <div class="lg_btn">   
                <a>登录</a>

			</div>
			</div>
            <div class="yytu">
                 <img id="touying" src="../images/bgyy.png"/>
             
              <div id="download"  ><p><img src="../images/mobileDownload.png" ></p>
              <span>APP下载</span></div>
              
               <div id="weixin" ><p><img  src="../images/weichatLogin.png"></p>
               <span>微信登录</span></div>
            </div>
            
        	<div class="copyright">
        		<span id="c1">工信部网站 （<a href="http://www.miitbeian.gov.cn">www.miitbeian.gov.cn</a>）</span>
       	 		<span id="c2">Copyright©2012深圳市普波科技有限公司</span>
        		<span id="c3">版权所有深圳市普波科技有限公司|<a href="http://www.miitbeian.gov.cn">粤ICP备15003958号-2</a></span>
        </div>
        
    	</div>	
</form>

</body>
 
</html>
</body>
</html>
