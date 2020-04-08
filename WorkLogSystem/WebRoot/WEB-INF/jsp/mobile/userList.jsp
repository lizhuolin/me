<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html >
<html>
<head lang = "en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>任务</title> 
    <%@include file="/common/mobileCommon.jsp"%>
    <script src="<%=basePath %>common/ajaxfileupload.js"></script>
    <script src="<%=basePath %>js/layer/layer.js"></script>
     <script src="<%=basePath %>common/comm.js"></script>
   
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
                     	$("#showHeadImg").attr("src",rooPath + "/" +data.imagePath);
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

function doSubmit(){
	//提交表单
	
	$("#form").submit();
	  opSuccess("修改成功");
}
function loginOut(){
	layer.confirm('是否退出', {
		btn : [ '是', '否' ]
	// 按钮
	},function() {
		location.assign("mobile_mobileLoginOut.action"); 
	
	});
	
}
 </script>
 </head>

<body style="background-color:#f0f0f0">

	<div id="header_wrapper">
    	<div class="index_text">个人</div>
    	
    </div><!--header_wrapper结束-->
    <div id="body_wrapper">
    	<section>

        	<div class="user_img">
        	<a href="<%=basePath %>mobile/tease/mobile_toMobileTease.action"><span id="tease"><img id="teaseImg" src="<%=basePath %>images/tease2.png"></span></a>
            <p>
            <s:if test='user.image!=null&&user.image!=""'>
	          <img id="showHeadImg" src="<%=basePath %><s:property value='user.image'/>" >
	          </s:if><s:else> <img  src="<%=basePath %>images/photo.jpg"></s:else>
            </p><span><s:property value='user.username'/></span>
            <%-- <input type="text"  name="user.username" value="<s:property value='user.username'/>" readonly> --%>
            </div>
        </section>
        <section>
        	<div class="user_form">
        <form id="form" name="form" action="<%=basePath %>mobile/user/mobile_mobileEdit.action" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="user.userId" value="<s:property value="user.userId"/>" />
		    <s:hidden name="user.createTime"/>
		    <s:hidden name="user.dataStatus"/>
		    <s:hidden name="user.userType"/>
		    <s:hidden name="user.isUserPlatform"/>
		    <s:hidden name="user.tblCompany.companyId"/>
		    <s:hidden name="user.tblDept.deptId"/>
        <s:hidden name="user.password"/>
        <s:hidden name="user.token"/>
        <s:hidden name="user.openId"/>
        
            	<p><span>公司名称：</span><input type="text" name="user.tblCompany.companyName"  value="<s:property value="user.tblCompany.companyName"/>" readonly></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                 <p><span>用户名称：</span><input type="text" name="user.name" value="${user.name }" readonly/></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>身份证：</span><input type="number" name="user.idcard" value="<s:property value="user.idcard" />" readonly></p>
            	<hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>登录账号：</span><input class="middle" type="text" name="user.username" value="${user.username }" readonly/></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
              <%--   <p><span>密码：</span><input class="middle" type="password" name="user.password" value="${user.password }" /></p>
                <hr size="1" width="100%" color="#cacaca" noshade="noshade" /> --%>
            	<p><span>性别：</span><s:radio list="#{'0':'男','1':'女'}" name="user.sex" /></p>
                </p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                 <p><span>公司职位：</span><s:iterator value="#session.ROLES">
                <input type="text" name="roleName" value="<s:property value="roleName"/>" readonly>
                </s:iterator>
                </p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>电话：</span><input type="number" name="user.mobile" value="<s:property value="user.mobile"/>"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                 <p><span>个人邮箱：</span><input type="email"  name="user.email" value="<s:property value="user.email"/>"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                 <p>
                <span>头像：</span>
                 <a class="file">选择文件<input type="file" name="image" id="image" onchange="ajaxFileUpload()"/></a>
                <input type="hidden" id="headImg" name="user.image" value="<s:property value='user.image'/>">
                
                </p>
             
                </form>
            </div>
        </section>
        <section>
        	<div class="alter">
            	<input id="btnB2" type="button" value="修改"  onClick="doSubmit()">
                <input id="loginOut" type="button" value="退出登录" onclick="loginOut()"/>
            </div>
        </section>
        </div><!--body_wrapper结束-->  
<%@include file="/common/mobileBelow.jsp"%>
    <script src="<%=basePath %>js/user/edit.js"></script> 
</body>
</html>
