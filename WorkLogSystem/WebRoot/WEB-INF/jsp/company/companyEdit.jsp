
 <%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 



<html>
<head>

<jsp:include page="/common/common.jsp"></jsp:include>
<script src="<%=basePath %>common/ajaxfileupload.js"></script>
<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/company/edit.js"></script> 



 
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
    <s:hidden id="companyId" name="tblcompany.companyId"/>
    <s:hidden name="tblcompany.dataStatus"/>
    <s:hidden name="tblcompany.isVerification"/>
    <s:hidden name="tblcompany.createTime"/>
    <s:hidden name="tblcompany.isFreeze"/>
    <s:hidden name="tblcompany.gsAdmin.userId"/>
     <li>
        <span><i>公司名称</i><samp>:</samp>
        <input  type="text" name="tblcompany.companyName" value="${tblcompany.companyName }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
     
        <span><i>电话</i><samp>:</samp>
        <input  type="text" name="tblcompany.companyMobile" value="${tblcompany.companyMobile }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
      
      <li>
       
      
        
         <span><i>管理员</i><samp>:</samp>
        <input  type="text" name="tblcompany.companyAdmin" value="${tblcompany.companyAdmin }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
        <span><i>地址</i><samp>:</samp>
        <input  type="text" name="tblcompany.companyAdress" value="${tblcompany.companyAdress }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
      
      </li>
      
      <li>
      <span><i>管理员邮箱</i><samp>:</samp>
        <input  type="text" name="tblcompany.email" value="${tblcompany.email }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
     
    <span>
      <i>公司类型</i>
      <samp>:</samp>
      <input  type="text" name="tblcompany.companyType" value="${tblcompany.companyType }"/><samp></samp>
          <div class="d_list"></div>
      </span>
      </li>

   	      
        




      <li>
      <span><i>管理员身份证</i><samp>:</samp>
        <input  type="text" name="tblcompany.idcard" value="${tblcompany.idcard }"/><label class="require_lab"></label><samp></samp>
          <div class="d_list"></div>
        </span>
	      <span>
      <i>公司简介</i>
      <samp>:</samp>
      <input  type="text" name="tblcompany.companyIntroduction" value="${tblcompany.companyIntroduction }"/><samp></samp>
          <div class="d_list"></div>
      </span>
    
    <li>
      
      <span><i>营业执照</i><samp>:</samp>
	            <a class="upload_btn">选择文件</a>
		        <input type="file" name="image" id="image1" onchange="ajaxFileUpload()"/>
	           <input type="hidden" id="charter" name="tblcompany.charter"  value="<s:property value='tblcompany.charter'/>"/>
	        </span>
	       
        
	        <span><i>公司logo</i><samp>:</samp>
	            <a class="upload_btn">选择文件</a>
		        <input type="file" name="image" id="image2" onchange="ajaxFileUpload2()"/>
	           <input type="hidden" id="companyLogo" name="tblcompany.companyLogo"  value="<s:property value='tblcompany.companyLogo'/>"/>
	        </span>
	       
        </li> 
         <li>
         	<span id="showImg">
        	 <s:if test='tblcompany.charter!=null&&tblcompany.charter!=""'>
	          <img id="showImg" src="<%=basePath %><s:property value='tblcompany.charter'/>" >
	         </s:if>
	         <s:else></s:else>
	        </span>
	        <span id="showImg2">
  			<s:if test='tblcompany.companyLogo!=null&&tblcompany.companyLogo!=""'>
	          <img  src="<%=basePath %><s:property value='tblcompany.companyLogo'/>" >
	         </s:if>
	         <s:else></s:else>
	         </span>
	        </li>
	        
</form>
 


  <div class="edit_btn"><a id="edit">保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
