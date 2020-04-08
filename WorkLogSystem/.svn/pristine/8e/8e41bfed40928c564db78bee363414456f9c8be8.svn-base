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
<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/user/edit.js?v1.0.2"></script>  
<script type="text/javascript">


</script>

</head>
<body>
  <form id="password">
    <div class="edit">
    <ul>
     	<li>
     	<span class="pwd">
        <i>旧密码</i><samp>:</samp>
            <input type="password" class="middle"name="oldPwd" /><samp></samp>
        </span>
        </li>
        <li>
     	    <span class="pwd">
        <i>新密码</i><samp>:</samp>
            <input class="middle" type="password" name="newPwd"  />
        </span>
       </li>
       
         <li>
     	    <span class="pwd">
        <i>确认密码</i><samp>:</samp>
            <input class="middle" type="password" name="conPwd" />
        </span>
       </li>
    </ul>
    </div>
</form>


  <div class="edit_btn"><a id="changePwd">确认</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
