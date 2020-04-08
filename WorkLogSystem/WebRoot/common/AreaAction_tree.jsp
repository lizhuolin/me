<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<link href="<%=basePath %>css/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
<%-- <script src="<%=basePath %>js/jquery-1.10.2.min.js"></script> --%>
<!-- 引入ztree必需的 js 和 css 文件，必须先引入jQuery-->  
<script src="<%=basePath %>js/ztree/jquery.ztree.all-3.5.min.js"></script>  

<input type="hidden" id="treeUrl" value="tree_common_AreaAction_queryAreaTreeAsync">
<ul id="treeDiv" class="ztree"></ul>

<script src="<%=basePath %>common/treeSync.js"></script>