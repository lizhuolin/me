<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;"> -->
     <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath %>js/jquery/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath %>common/comm.js"></script>
 <script>
 var rooPath;
 $(function($) {
		rooPath = getRootPath();});
 
 function getRootPath() {
		// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// 获取主机地址，如： http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		// 获取带"/"的项目名，如：/uimcardprj
		var projectName = pathName
				.substring(0, pathName.substr(1).indexOf('/') + 1);
		return (localhostPaht + projectName);
	}

 </script>