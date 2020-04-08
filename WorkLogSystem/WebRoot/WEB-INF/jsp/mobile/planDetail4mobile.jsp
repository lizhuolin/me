<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head lang = "en">
<%@include file="/common/mobileCommon.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>项目计划</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
	 <script type="text/javascript">
    	//提交表单
    	function doSubmit(){
	    		//提交表单
	    	//	document.write("运行了？");
	    		//$("#form").submit();
	    		document.forms[0].submit();
	    		opSuccess("保存成功");
    	}
    </script>
 </head>

<body style="background-color:#e6e6e6">

<div id="header_wrapper">
    <div class="title">
    	<span class="title_button"><a href="<%=basePath%>mobile/projectChild/mobile_projectChild4mobile.action?tblProjectChild.projectChildRealId=<s:property value="tblPlan.tblProjectChild.projectChildRealId"/>"><img src="<%=basePath%>images/back.png"></a></span>
 		 <span class="title_text"><div class="text">项目计划详细信息</div></span>
  </div>
 </div><!--header_wrapper结束-->
    <div id="body_wrapper">
			<form id="form" name="form" action="<%=basePath %>mobile/project/mobile_mobileEdit.action" method="post" enctype="multipart/form-data">
            <div class="pj_plan">
			
            <s:hidden name="tblPlan.planId"/>
			<s:hidden name="tblPlan.planCreater.userId"/>
			<s:hidden name="tblPlan.planManager.userId"/>
			<s:hidden name="tblPlan.planCreateTime"/> 
			<s:hidden name="tblPlan.planStartTime"/> 
			<s:hidden name="tblPlan.planEndTime"/> 
			<s:hidden name="tblPlan.planRealTime"/> 
			<s:hidden name="tblPlan.createTime"/>
			<s:hidden name="tblPlan.planTarget"/>
			<s:hidden name="tblPlan.dataStatus"/> 
			<s:hidden name="tblPlan.tblProject.projectId"/> 
			<s:hidden name="tblPlan.tblProjectChild.projectChildRealId"/> 
			<s:hidden name="tblPlan.planStatus"/>
			<div class="plan_dian"></div><input type="text" name="tblPlan.planName" value="${tblPlan.planName }"  readonly/>
            </div>
            
            <div class="plan_content">
            	<p><span>创建人:</span><input type="text" name="tblPlan.planCreater.name" value="${tblPlan.planCreater.name }"readonly></p>
            	<p><span>负责人:</span><input type="text" name="tblPlan.planManager.name" value="${tblPlan.planManager.name }" readonly/></p>
                <p><span>计划工时:</span><input type="text" name="tblPlan.planTime" value="${tblPlan.planTime }" readonly/></p>
                <p><span>计划进度:</span><select name="tblPlan.projectProgress">
            	<option value="0" <s:if test="tblPlan.projectProgress==0">selected="selected"</s:if>>0%</option>
            	<option value="10"<s:if test="tblPlan.projectProgress==10">selected="selected"</s:if>>10%</option>
            	<option value="20"<s:if test="tblPlan.projectProgress==20">selected="selected"</s:if>>20%</option>
            	<option value="30"<s:if test="tblPlan.projectProgress==30">selected="selected"</s:if>>30%</option>
            	<option value="40"<s:if test="tblPlan.projectProgress==40">selected="selected"</s:if>>40%</option>
            	<option value="50"<s:if test="tblPlan.projectProgress==50">selected="selected"</s:if>>50%</option>
            	<option value="60"<s:if test="tblPlan.projectProgress==60">selected="selected"</s:if>>60%</option>
            	<option value="70"<s:if test="tblPlan.projectProgress==70">selected="selected"</s:if>>70%</option>
            	<option value="80"<s:if test="tblPlan.projectProgress==80">selected="selected"</s:if>>80%</option>
            	<option value="90"<s:if test="tblPlan.projectProgress==90">selected="selected"</s:if>>90%</option>
            	<option value="100"<s:if test="tblPlan.projectProgress==100">selected="selected"</s:if>>100%</option>
            </select></p>
			<p><span>计划等级：</span><select name="tblPlan.planClass">
            <option value="0" <s:if test="tblPlan.planClass==0">selected="selected"</s:if>>低</option>
            <option value="1"<s:if test="tblPlan.planClass==1">selected="selected"</s:if>>一般</option>
            <option value="2"<s:if test="tblPlan.planClass==2">selected="selected"</s:if>>高</option>
            </select></p>
                <p>计划预计开始－预计结束时间：</p><p><s:date name="tblPlan.planStartTime" format="yyyy-MM-dd"/>--<s:date name="tblPlan.planEndTime" format="yyyy-MM-dd"/></p>
        		 <p>实际开始－结束时间：</p><p><input type="date" name="tblPlan.planRealStartTime" value="<s:date name="tblPlan.planRealStartTime " format="yyyy-MM-dd"/>">--<input type="date" name="tblPlan.planRealEndTime" value="<s:date name="tblPlan.planRealEndTime" format="yyyy-MM-dd"/>"></p>
                </div>
             <div class="plan_intro">
             <div class="intro_text">
                <input type="text" value="计划简介:"readonly>
                </div>
                <textarea  type="text" name="tblPlan.planMsg"  rows="5" cols="80" ><s:property  value="tblPlan.planMsg" /></textarea>
                </div>
              <div class="plan_remark">
              <div class="remark_text">
              <input type="text" value="备注:"readonly>
               </div>
              <textarea  type="text" name="tblPlan.planRemarks"  rows="5" cols="80" ><s:property  value="tblPlan.planRemarks" /></textarea>
                </div>
			 </form>
		 </div>
         <div class="saving"><p><input id="save" type="button" value="保存" onclick="doSubmit()"/><!-- <input id="cancel" type="button" value="取消">--></p></div> 
     </div><!--body_wrapper结束-->
       <%@include file="/common/mobileBelow.jsp"%>
   
</body>
</html>
