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
    <title>任务</title>
    <script src="<%=basePath %>/js/jquery/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath %>common/ajaxfileupload.js"></script>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath %>common/comm.js"></script>
    <script src="<%=basePath %>js/user/edit.js"></script>  
 </head>
<script type="text/javascript">
function ajaxFileUpload() {
 
    	}  	
    </script>
<body>
<div class="user_bg">
    

	<div id="header_wrapper">
    	<div class="index_text">个人</div>
    	
    </div><!--header_wrapper结束-->
    <div id="body_wrapper">
   
    	<section>
        	<div class="user_img">
            <p><img alt="" src="<%=basePath %><s:property value="user.image"/>"></p>
            <input type="text" value="<s:property value='username'/>" >
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
        		 <p>
                <span>图像：</span>
                 <img id="showImg" src="<%=basePath %><s:property value='user.image'/>" width="50px" height="50px">
               <%--  <a class="file">选择文件<input type="file" name="image" id="image" onchange="ajaxFileUpload()"/></a>
                <img src="<%=basePath %>images/loading.gif" id="loading" style="display: none;">
                <input type="hidden" id="headImg" name="user.image" value="<s:property value='user.image'/>">
                <s:if test='user.image!=null&&user.image!=""'>
	            </s:if> --%>
                </p>  
                
            	<p><span>公司名称：</span><input type="text" name="user.tblCompany.companyName"  value="<s:property value="user.tblCompany.companyName"/>" readonly></p>
                <p><span>所属角色：</span><input type="text" name="user.name" value="${user.name }" / readonly></p>
                <p><span>登录账号：</span><input class="middle" type="text" name="user.username" value="${user.username }" readonly/></p>
                <p><span>密码：</span><input class="middle" type="password" name="user.password" value="${user.password }" readonly/></p>
                <p><span>身份证：</span><input type="number" name="user.idcard" value="<s:property value="user.idcard"/>" readonly></p>
            	<p><span>性别：</span><s:radio list="#{'0':'男','1':'女'}" name="user.sex" /></p>
                <p><span>所属部门：</span><input type="text" name="user.tblDept.deptName" value="<s:property value="user.tblDept.deptName"/>" readonly></p>
                <%-- <p><span>所属角色：</span><input type="text" value="<s:property value="idcard"/>"></p> --%>
                <%-- <p><span>公司职位：</span><input type="text" value="<s:property value="idcard"/>"></p> --%>
                <p><span>电话：</span><input type="number" name="user.mobile" value="<s:property value="user.mobile"/>" readonly></p>
                <p><span>公司邮箱：</span><input type="email"  name="user.email" value="<s:property value="user.email"/>" readonly></p>
                
              
                 
                     
                 
                 
                 
            </form>
            </div>
            
        </section>
        
        <section>
        	
            
        </section>
        </div><!--body_wrapper结束-->  
    <div id="footer_wrapper">
    	<footer>
  			<footer>
  			<div class="message"><a href="<%=basePath%>mobile/notice/mobile_noticeList.action">消息</a></div>
  			<div class="project"><a href="<%=basePath%>mobile/project/mobile_projectList4mobile.action">项目</a></div>
  			<div class="log"><a href="<%=basePath%>mobile/log/mobile_log.action">日志</a></div>
  			<div class="task"><a href="<%=basePath%>mobile/task/mobile_taskList4Mobile.action">任务</a></div>
  			<div class="user"><a href="<%=basePath%>mobile/user/mobile_userList.action">个人</a></div>
  			<div class="clear"></div>
		</footer>
		</footer>

    </div><!--footer_wrapper结束-->
    </div>
</body>
</html>
