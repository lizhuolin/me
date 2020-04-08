<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

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
<script src="<%=basePath %>js/jquery.museum.js"></script>
<script>
$(document).ready(function(){
	$.museum($('.con_disc img'));
});
</script>
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
                      	$("#showImg").append("<img  src="+ rooPath + "/" +data.imagePath + " width='40px' height='30px'/>");
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

</script>
</head>
<body>
  <form id="editForm">
    <div class="edit">
    
    <input type="hidden" id="userId" name="user.userId" value="<s:property value="user.userId"/>" />
    
    <s:hidden name="user.createTime"/>
    <s:hidden name="user.dataStatus"/>
    <s:hidden name="user.isUserPlatform"/>
    <s:hidden name="user.tblCompany.companyId"/>
    <ul>
     	
     	 <li>
     	
     	<li>
     	<span>
        <i>部门名称</i><samp>:</samp>
       		 <s:select list="deptList" listKey="deptId" listValue="deptName" name="user.tblDept.deptId">  
       		 </s:select>
        </span>
     	
     	<span>
        <i>姓名</i><samp>:</samp>
            <input type="text" class="middle" name="user.name" value="${user.name }" /><label class="require_lab"></label><samp></samp>
        </span>
     	</li>
  
        
   	      <li>
	        <span><i>图像</i><samp>:</samp>
	            <a class="upload_btn">选择文件</a>
		        <input type="file" name="image" id="image" onchange="ajaxFileUpload()"/>
	           <input type="hidden" id="headImg" name="user.image"  value="<s:property value='user.image'/>"/>
	        </span>
	       
	       
	       
	       
	      <span id="showImg">
        	 <s:if test='user.image!=null&&user.image!=""'>
	          <img id="showImg" src="<%=basePath %><s:property value='user.image'/>" >
	         </s:if>
	         <s:else></s:else>
	         </span>
	       </li>
        
        <li>
     	<span>
        <i>账号</i><samp>:</samp>
            <input  class="middle" type="text" name="user.username" value="${user.username }" /><label class="require_lab"></label>
        </span>
        
     	<span>
        <i>手机号</i><samp>:</samp>
            <input  class="middle" type="text" name="user.mobile" value="${user.mobile }" /><label class="require_lab"></label>
        </span>
     </li>
     
     <li>
        <span>
        <i>邮箱</i><samp>:</samp>
            <input  class="middle" type="text" name="user.email" value="${user.email }" /><label class="require_lab"></label>
        </span>
       
	    <span>
        <i>微信</i><samp>:</samp>
            <input class="middle"  type="text" name="user.weichat" value="${user.weichat }" />
        </span>
        </li>
        
	    <li>
	   
	    
	    <span><i>性别</i> <samp>:</samp> 
		<span class="prop_sp">
		<em1><s:radio list="#{'0':'男','1':'女'}" name="user.sex" /></em1>
				</span>
				</span>
       
		
		<span>
        <i>身份证</i><samp>:</samp>
            <input class="middle" type="text" name="user.idcard" value="${user.idcard }" />
        </span>
		
		
		
        
        </li>
        
        <li>
       
        
        
         <span><i>角色</i> <samp>:</samp> 
		<span class="prop_sp" >	
		<s:iterator value="roleList" >
		<em><s:checkboxlist  theme="simple" list="roleName" listKey="roleId" listValue="roleName" name="roleIds" class="check" /> </em><em></em>
		</s:iterator>
		</span>
		</span>
		 
		  <s:if test='user==null'>
        <span>
        <i>密码</i><samp>:</samp>
            <input  class="middle" type="password" name="user.password" value="${user.password }" /><label class="require_lab"></label>
        </span> 
        </s:if><s:else> <s:hidden name="user.password"/></s:else>
		</span>
        </li>
        
    </ul>
  </div>
</form>


  <div class="edit_btn"><a id="edit">保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
