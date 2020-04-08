<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html >
<html>
<head lang = "en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>吐槽</title>
   <%@include file="/common/mobileCommon.jsp"%>
    <script type="text/javascript">
    function teaseAdd(){
    	//提交表单
    	$("#form").submit();
    	  alert("吐槽成功");
    }
    </script>
</head>

<body style="background-color:#f0f0f0">

<div id="header_wrapper">
    <div class="index_text">吐槽</div>

</div><!--header_wrapper结束-->
<div id="body_wrapper">
    	<section>
        	<div class="user_img">
            <p>
             <s:if test='#session.USER.image!=null&&#session.USER.image!=""'>
	         <img src="<%=basePath %><s:property value='#session.USER.image'/>">
         </s:if> 
         <s:else>           
            <img src="<%=basePath %>images/photo.jpg">
         </s:else>
            </p><span><s:property value='#session.USER.name'/></span>
            </div>
        </section>
    <section>
        <div class="teaseForm">
            <span>吐槽标题:</span>
        <form id="form"  action="<%=basePath %>mobile/tease/mobile_mobileTeaseAdd.action" method="post" enctype="multipart/form-data">
            <input type="text" name="tease.teaseTitle" >
            <span>吐槽模块:</span>
            <input type="text" name="tease.teasePart">
            <span>吐槽内容:</span>
            <textarea rows="10" name="tease.teaseContent"></textarea>
		</form>
        </div>
    </section>
    <section>
        <div class="teaseAlter">
            <input type="button" value="保存" onclick="teaseAdd()">
            <input type="button" value="取消" onclick="history.go(-1)">
        </div>
    </section>
</div><!--body_wrapper结束-->
<%@include file="/common/mobileBelow.jsp"%>

</body>
</html>
