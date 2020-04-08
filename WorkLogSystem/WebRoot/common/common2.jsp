<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<link href="<%=basePath %>css/style.css" rel="stylesheet"  />
<link rel="stylesheet" href="<%=basePath %>/css/jquery/jquery-ui-1.8.5.custom.css" />
<script src="<%=basePath %>js/jquery/jquery-1.8.3.min.js"></script>
<script src="<%=basePath %>js/layer/layer.js"></script>
<script src="<%=basePath %>js/jquery/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=basePath %>js/common.validate.js" type="text/javascript"></script>
<script src="<%=basePath %>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath %>/common/comm2.js" type="text/javascript"></script>


