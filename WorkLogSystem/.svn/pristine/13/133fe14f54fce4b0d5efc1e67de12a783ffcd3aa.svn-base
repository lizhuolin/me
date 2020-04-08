<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="<%=basePath %>/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function($){   
	 $("#A_bc").click(function(){
		 location.assign("<%=basePath%>apk/WorkLogSystem.apk");
      });
	 $("#i_bc").click(function(){
		 location.assign("<%=basePath%>apk/WorkLogSystem.ipa");
      });
});
</script>
<html>
<head lang = "en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>下载</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="download_bg">
    <div class="downloadUp">
        <p><img id="heap" src="<%=basePath%>images/logo.png"></p>
        <span>让工作更轻松!</span>
    </div><!--header_wrapper结束-->
    <div class="downloadDown">

        <div id="Android" ><p><img id="A_bc" src="<%=basePath%>images/androidApp.png"></p>
           <p> <img id="AndroidBq" src="<%=basePath%>images/Android.png"><span>Android下载</span></p></div>

        <div id="iOS" ><p><img id="i_bc" src="<%=basePath%>images/iosApp.png"></p>
            <p><img id="iOSBq" src="<%=basePath%>images/ios.png"><span>iphone下载</span></p></div>
    </div><!--body_wrapper结束-->
</div>
</body>
</html>
<!--方正喵呜体 Regular-->
