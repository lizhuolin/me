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
    <title>提醒信息详情</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
 </head>

<body>

<div id="header_wrapper">
<div class ="title">
    <div class="title_button"><a href="<%=basePath%>mobile/notice/mobile_noticeList.action"><img src="<%=basePath%>images/back.png"></a></div>
 		 <div class="title_text">提醒信息详情</div>
         </div>
 </div><!--header_wrapper结束-->
    <div id="body_wrapper">
    <s:if test='reportwarn.type == "0"'>
        <section>
        	<div class="msg_list">
        	<form>
            	<div class="kongxi">
            <p><span>任务名称：</span><input type="text" value='<s:property value="reportwarn.tblTask.taskMsg"/>' readonly></p></div>
            <p><span>负责人：</span><input type="text" value='<s:property value="reportwarn.tblTask.taskResponsible.name"/>' readonly></p>
            <p><span>创建时间：</span><input type="text" value='<s:property value="reportwarn.tblTask.createTime"/>' readonly></p>
          <p><span>开始时间-结束时间：</span><span class="remindTime"><s:date format="yyyy-MM-dd" name="reportwarn.tblTask.taskStartTime"/>—<s:date format="yyyy-MM-dd" name="reportwarn.tblTask.taskEndTime"/></span></p>
            <p><span>任务描述：</span></p><textarea type="text" rows="10" cols="50" readonly><s:property value="reportwarn.tblTask.taskDesc"/></textarea>
            </form>
            </div>
        </section>
      </s:if>  
       <s:elseif test='reportwarn.type == "1"'>
        <section>
        	<div class="msg_list">
        	<form>
            	<div class="kongxi">
            <p><span>计划名称：</span><input type="text" value='<s:property value="reportwarn.tblPlan.planMsg"/>' readonly></p></div>
            <p><span>负责人：</span><input type="text" value='<s:property value="reportwarn.tblPlan.planManager.name"/>' readonly></p>
            <p><span>创建时间：</span><input type="text" value='<s:property value="reportwarn.tblPlan.createTime"/>' readonly></p>
            <p><span>开始时间-结束时间：</span><span class="remindTime"><s:date format="yyyy-MM-dd" name="reportwarn.tblPlan.planStartTime"/>—<s:date format="yyyy-MM-dd" name="reportwarn.tblPlan.planEndTime"/></span></p>       
            
            </form>
            </div>
        </section>
        </s:elseif>
        
       <s:if test="log != null">	
        <section>
        	<div class="msg_list">
        	<form>
            	<div class="kongxi">
            <p><span>日志时间：</span><input type="text" format="yyyy-MM-dd"value="<s:property value="log.logTime"/>" readonly></p></div>
            <p id="logP"><span>日志图片：</span><s:if test='log.logPicture != null && log.logPicture!=""'><img id="logImg" src='<%=basePath%><s:property value="log.logPicture"/>'/></s:if><s:else>暂无图片</s:else>
            <p><span>日志内容：</span></p><textarea type="text" rows="10" cols="50" readonly ><s:property value="log.logMsg"/></textarea>
            </form>
            </div>
        </section>
        </s:if>  
    	
        </div><!--body_wrapper结束-->
      <%@include file="/common/mobileBelow.jsp"%>
   
</body>
</html>


