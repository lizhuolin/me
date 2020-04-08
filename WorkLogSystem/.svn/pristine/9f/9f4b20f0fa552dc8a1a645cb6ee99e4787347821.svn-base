<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   


<html>
<head>

<jsp:include page="/common/common.jsp"></jsp:include>
 <script src="<%=basePath %>common/ajaxfileupload.js"></script>
<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/user/edit.js"></script>  
<script type="text/javascript">


function ajaxFileUpload() {
    $.ajaxFileUpload({
            url:rooPath + '/fileoperate/fileoperate_imageUpload.action',//用于文件上传的服务器端请求地址
            secureuri:false,//一般设置为false
            fileElementId:'image',//文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType: 'json',//返回值类型 一般设置为json
            data : {"childPath" : "user"},
            success: function (data, status){  //服务器成功响应处理函数
            	 if (typeof(data.error) != 'undefined') {
                     if (data.error != '') {
                    	 opFail(data.error);
                     } else {
                    	 $("#headImg").val(data.imagePath);
                    	 $("#showImg img").remove();
                    	 $("#showImg").append("<img  src='"+rooPath + '/' + data.imagePath + "'/>");
                      	opSuccess(data.message);
                     }
                 }
             	
            },
            error: function (data, status, e){//服务器响应失败处理函数
            	opFail(data.message);
            }
        });
    return false;
}



function picBig() {
var v = document.getElementById('divCenter');
	v.style.display = "block";
}

function picClose() {
	var v = document.getElementById('divCenter');
	v.style.display = "none";
}

</script>

</head>
<body>

  <form id="editForm">
    <div class="edit">
    
    
  
    <s:hidden name="user.userId"/>
    <s:hidden name="user.tblCompany.companyId"/>
     <s:hidden name="user.createTime"/>
    <s:hidden name="user.dataStatus"/>
    <s:hidden name="user.isUserPlatform"/>
    <s:hidden name="user.tblDept.deptId"/>
    <s:hidden name="user.userType"/>
    <s:hidden name="user.password"/>
    <s:hidden name="user.openId"/>
    <s:hidden name="user.token"/>
    <s:hidden name="user.lastLoginTime"/>
    <s:hidden name="user.idcard"/>
    <ul>
     	
     	

     	
     	<li>
     	<span>
        <i>姓名</i><samp>:</samp>
            <input type="text" name="user.name" value="${user.name }"readonly="readonly"/><samp></samp>
        </span>
     	    <span>
        <i>微信</i><samp>:</samp>
            <input class="middle" type="text" name="user.weichat" value="${user.weichat }" />
        </span>
       </li>
     	
     	
     <%--  <li>
        <span>
        <i>图像</i><samp>:</samp>
            <input class="middle" type="text" name="user.image" value="${user.image }" />
        </span>
        </li> --%>
  
        
   	      <li>
   	      	<span>
        <i>账号</i><samp>:</samp>
            <input  type="text" name="user.username" value="${user.username }" readonly="readonly"/>
        </span>
	      
	       <span>
        <i>手机号</i><samp>:</samp>
            <input class="middle" type="text" name="user.mobile" value="${user.mobile }" />
        </span>
	      </li> 
	      
	      <li>
	      	<span><i>性别</i> <samp>:</samp> 
		<span class="prop_sp">
			
		<em><s:radio list="#{'0':'男','1':'女'}" name="user.sex" />
		</em>
				</span>
				</span>
	    
	         <span>
        <i>电子邮箱</i><samp>:</samp>
            <input class="middle" type="text" name="user.email" value="${user.email }" />
        </span>
	       </li>
        
     	
     
     
        
        
	   
       
       <%-- <li>
	        <span>
        <i>性别</i><samp>:</samp>
            <input class="middle" type="text" name="user.sex" value="${user.sex }" /></label>
        </span> --%>
	   
	   <li>  <span><i>头像</i><samp>:</samp>
	            <a class="upload_btn">选择文件</a>
		        <input type="file" name="image" id="image" onchange="ajaxFileUpload()"/>
	           <input type="hidden" id="headImg" name="user.image"  value="<s:property value='user.image'/>" />
	        </span>
	  
	       <span><i>角色</i> <samp>:</samp> 
		<span class="prop_sp" >	
		
		<em>  
	     <s:iterator value="user.tblUserRoles">
		      <s:property value="id.tblRole.roleName"/>
		 </s:iterator>
		</em>
		
		</span>
		</span>
	    
	    </li>
        <li>
      <span id="showImg">
        	 <s:if test='user.image!=null&&user.image!=""'>
	          <img  src="<%=basePath %><s:property value='user.image'/>" />
	         </s:if>
	         <s:else></s:else>
	       </span>
        </li>
    </ul>
  </div>
</form>


  <div class="edit_btn"><a id="doEditUserInfo">保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
