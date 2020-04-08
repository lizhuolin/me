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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>任务</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
 </head>

<body>
<div class="forget_bg">
	<div id="header_wrapper">
    	<div class="user_text">忘记密码</div>
    	
    </div><!--header_wrapper结束-->
    <div id="body_wrapper">
    	
        	
        <section>
        	<div class="forget_form">
        	<form>
        	<input type="hidden" name="user.userId" value="<s:property value="user.userId"/>" />
		    <s:hidden name="user.createTime"/>
		    <s:hidden name="user.dataStatus"/>
		    <s:hidden name="user.isUserPlatform"/>
		    <s:hidden name="user.tblCompany.companyId"/>
		    <s:hidden name="user.tblDept.deptId"/>
		    
            	<p><span>公司名称：</span><input type="text"  value="<s:property value="user.tblCompany.companyName"/>"></p>
                <p><span>员工姓名：</span><input type="text" name="name" value="<s:property value="user.name"/>"></p>
                <p><span>身份证：</span><input type="number" name="idcard" value="<s:property value="user.idcard"/>"></p>
                <p><span>公司职位：</span><input type="text" name="deptName" value="<s:property value="user.tblDept.deptName"/>"></p>
                <p><span>电话：</span><input type="number" name="mobile" value="<s:property value="user.mobile"/>"></p>
                <p><span>公司邮箱：</span><input type="email"  name="email" value="<s:property value="user.email"/>"></p>
                
                
            </form>
            </div>
        </section>
        <section>
        	<div class="reset">
            	
            </div>
            <div class="function">
            	<p><input id="send"type="button" value="发送"><input id="cancel" type="button" value="取消"></p>
            </div>
           
        </section>
        </div><!--body_wrapper结束-->  
    
    </div>
</body>
</html>
