<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<link href="<%=basePath %>/css/style.css" rel="stylesheet"  /> 


<!-- 引入ztree必需的 js 和 css 文件，必须先引入jQuery--> 
<%-- <script src="<%=basePath %>/js/jquery/jquery-1.8.3.min.js"></script>  --%>
<%-- <script src="<%=basePath %>js/ztree/jquery.ztree.all-3.5.min.js"></script> --%>

<html>
<head>


<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/user/edit.js"></script>  
<jsp:include page="/common/common.jsp"></jsp:include>
<script src="<%=basePath %>common/ajaxfileupload.js"></script>
<script src="<%=basePath %>js/jquery.museum.js"></script>
<script>
$(document).ready(function(){
	$.museum($("#showImg"));
});
</script>
<style type="text/css"> 
#showImg{ 
margin-left:124px; 
margin-top:-40px;
}
</style> 
</head>
<body>
  <form id="editForm">
    <div class="edit">
     <s:hidden id="companyId" name="tblcompany.companyId"/>
    <s:hidden name="tblcompany.dataStatus"/>
    <s:hidden name="tblcompany.isVerification"/>
    <s:hidden name="tblcompany.createTime"/>
    <s:hidden name="tblcompany.gsAdmin.userId"/>
    <ul>
     	<li>
     	<%-- <span>
        <i>姓名</i><samp>:</samp>
            <s:property value="tblUser.name " />
             <input type="text" name="tblUser.name" value="${tblUser.name }" readonly/>
        </span> --%>
        
        <span><i>姓名</i><samp>:</samp>
        <input type="text" name="tblUser.name" value="${tblUser.name }" readonly/><samp></samp>
        <div class="d_list"></div>
        </span>
         
     	<span>
        <i>账号</i><samp>:</samp>
             <input type="text" name="tblUser.username" value="${tblUser.username }" readonly/><samp></samp>
        <div class="d_list"></div>
        </span>
        </li>
        
        
        <li>
     	<span>
        <i>手机</i><samp>:</samp>
            <input type="text" name="tblUser.mobile" value="${tblUser.mobile }" readonly/><samp></samp>
        <div class="d_list"></div>
        </span>
       
        
        
        <span>
        <i>邮箱</i><samp>:</samp>
            <input type="text" name="tblUser.email" value="${tblUser.email }" readonly/><samp></samp>
            <div class="d_list"></div>
        </span>
       </li>
       
       
       <li>
	        <span>
        <i>微信</i><samp>:</samp>
             <input  type="text" name="tblUser.weichat" value="${tblUser.weichat }" readonly/><samp></samp>
            <div class="d_list"></div>
        </span>
	    
	        <span>
        <i>身份证</i><samp>:</samp>
             <input type="text" name="tblUser.idcard" value="${tblUser.idcard }" readonly/><samp></samp>
            <div class="d_list"></div>
        </span>
	    </li>
	    
	    
	    
	   
	   
	   
       
       <li>
	        <span><i>图像</i><samp>:</samp>
	           
	           <input type="hidden" id="headImg" name="tblUser.image"  value="<s:property value='tblUser.image'/>"/>
	        </span>
	   	<span><i>性别</i> <samp>:</samp> 
		<span class="prop_sp">
		<em1><s:radio list="#{'0':'男','1':'女'}" name="tblUser.sex"/></em1>
				</span>
				</span>
	   </li> 
	        <li>
        	 <s:if test='tblUser.image!=null&&tblUser.image!=""'>
	          <img id="showImg" src="<%=basePath %><s:property value='tblUser.image'/>" width="100px" height="100px">
	         </s:if>
	         <s:else></s:else>
	       </li>
       
    </ul>
  </div>
</form>

  <div class="edit_btn"><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
