<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html >
<html>
<head lang = "en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>公告内容</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    ////返回上一页不刷新  
    function back(){
    	window.history.go(-1);//返回上一页并刷新  
    	window.location.reload(true); 
    }
    </script>
 </head>

<body style="background-color:#f0f0f0">

<div id="header_wrapper">
    <div class="title">
    	<div class="title_button"><a  href="javascript:back()" ><img src="<%=basePath%>images/back.png"></a></div>
 		 <div class="title_text">公告信息详情</div>
         </div>
 </div>

    <div id="body_wrapper">

        	<div class="notice_title">
        	<span><s:property value='notice.noticeTitle'/></span>
            </div>
            <div class="notice_content">
            
           <s:property value="notice.noticeMsg" escape="false"/>
           
            </div>
       
         
    	
        </div><!--body_wrapper结束-->
   
	<%@include file="/common/mobileBelow.jsp"%>
</body>
</html>


