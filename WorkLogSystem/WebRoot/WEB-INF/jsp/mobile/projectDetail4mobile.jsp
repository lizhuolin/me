<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html >
<html>
<head lang = "en">
<%@include file="/common/mobileCommon.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>项目详细信息</title>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
 </head>

<body style="background-color:#e6e6e6">

<div id="header_wrapper">
   <div class="title">
    	<div class="title_button"><a href="<%=basePath%>mobile/project/mobile_projectList4mobile.action"><img src="<%=basePath%>images/back.png"></a></div>
 		 <div class="title_text">项目详细信息</div>
         </div>
  <div class="explain">
  		<div class="explain_name">
        <div class="dt_dian">●<span><s:property value="tblProject.projectName" /></span></div>
        
        </div>
        <div class="explain_content"> 
         <p>负责人：<span><s:property value="tblProject.projectManager.name" /></span></p>
		 <p>项目状态：<span><s:if test="tblProject.projectStatus==0" >未开始</s:if><s:elseif test="tblProject.projectStatus==1">进行中</s:elseif><s:else>已结束</s:else></span></p>
         <p>创建时间：<span><s:property value="tblProject.createTime" /></span></p>
         <p>项目目标：<span><s:property value="tblProject.projectTarget" /></span></p>
         <p>计划开始－结束时间：</p><p><span><s:date name="tblProject.projectStartTime" format="yyyy-MM-dd"/>—<s:date name="tblProject.projectEndTime" format="yyyy-MM-dd"/></span></p>
         <p>实际开始－结束时间：</p><p><span><s:date name="tblProject.projectRealStartTime" format="yyyy-MM-dd"/>—<s:date name="tblProject.projectRealEndTime" format="yyyy-MM-dd"/></span></p>
		 <p>备注：</p><p><textarea><s:property value="tblProject.projectRemaks"/></textarea></p>
    	</div>
        </div>
</div><!--header_wrapper结束-->

<div id="body_wrapper">
	<s:iterator value="projectChildList"  status="s">
    	<section>
        	<div class="dt_name">
          <div class="xuhao"><s:property value="#s.index"/></div><input type="text"  value="<s:property value="projectName"/>"  readonly/>
            </div>                     
            <a href="<%=basePath%>mobile/projectChild/mobile_projectChild4mobile.action?tblProjectChild.projectChildRealId=<s:property value="projectChildRealId"/>"><div class="dt_other">
            <div class="dt_other_left">
           			<p>责任人：<input type="text" value="<s:property value="responsible.name"/>" readonly/></p>
               	 <p>任务优先级：<input type="text" value="<s:elseif test="projectLevel==1">一般</s:elseif><s:else>高</s:else>" readonly/></p>
                 <p>子项目目标:<input type="text" value="<s:property value="projectChildTarget"/>" readonly/></p>
                <p>子项目状态：<input type="text" value="<s:if test="projectChildStatus==0" >未开始</s:if><s:elseif test="projectChildStatus==1">进行中</s:elseif><s:else>已结束</s:else>" readonly/></p>
                <p>子项目计划工时:<input type="text" value="<s:property value="planTime"/>" readonly/></p>
				<p>计划开始－结束时间：</p><p><span><s:date name="projectChildStarttime" format="yyyy-MM-dd"/>—<s:date name="projectChildEndtime" format="yyyy-MM-dd"/></span></p>
         		</div>
                  <div class="dt_other_right" >
                 <div class="splash-inner">
        		 <div class="loading-circle" >
        		 
            		<p><span id="loadedNum" class="loadedNum"><s:property value="projectProgress"/>%</span></p>
            		<s:if test="#s.odd">
            			<canvas class="mask" id="loadingProgress" ></canvas>
            		</s:if>
            		<s:else>
            		<canvas class="mask1" id="loadingProgress1" width="100" height="100"></canvas>
            		</s:else>
           			
        			</div>
    			</div>
			</div>               
            </div></a>
      </section>
	  </s:iterator>
	  </div>
	  <!-- 
	  <s:iterator value="planList" status="s">
      <section>
        	<div class="dt_name">
           <div class="xuhao"><s:property value="#s.index"/></div><input type="text"  value="<s:property value="planName"/>"  readonly/>
            </div>                     
            <a href="<%=basePath%>mobile/project/mobile_planDetail4mobile.action?tblPlan.planId=<s:property value="planId"/>"><div class="dt_other">
            <div class="dt_other_left">
           			<p>责任人：<input type="text" value="<s:property value="planManager.name"/>" readonly/></p>
               	 <p>计划优先级：<input type="text" value="<s:if test="planClass==0" >低</s:if><s:elseif test="planClass==1">一般</s:elseif><s:else>高</s:else>" readonly/></p>
                 <p>计划工时:<input type="text" value="<s:property value="planTime"/>" readonly/></p>
				 <p>计划状态:<input type="text" value="<s:elseif test="planStatus==1">进行中</s:elseif><s:else>已结束</s:else>" readonly/></p>
				 <p>计划简介:<input type="text" value="<s:property value="planMsg"/>" readonly/></p>
                <p>计划预计开始－预计结束时间：<input type="text" value="<s:date name="planStartTime" format="yyyy-MM-dd HH:mm:00"/>——<s:date name="planEndTime" format="yyyy-MM-dd HH:mm:00"/>" readonly/></p>
         		</div>
                 <div class="dt_other_right" >
                 <div class="splash-inner">
        		 <div class="loading-circle" >
        		 
            		<p><span id="loadedNum" class="loadedNum"><s:property value="projectProgress"/></span>%</p>
            		<s:if test="#s.odd">
            			<canvas class="mask" id="loadingProgress" ></canvas>
            		</s:if>
            		<s:else>
            		<canvas class="mask1" id="loadingProgress1" width="100" height="100"></canvas>
            		</s:else>
           			
        			</div>
    			</div>
			</div>               
            </div></a>
      </section>
    </s:iterator>  
       
</div>
 -->
 <%@include file="/common/mobileBelow.jsp"%>
   <script>
   var slots={},c=document.getElementById('loadingProgress');

 //window.hasLoaded = 0;
 //window.loading = false;
 window.ulp = ulp;

 function setLoadingProgress(){
 	var progresses = $(".loadingProgress");
 	var nums = $(".loadedNum");
 	var percents =  $(".taskProgress");
 	//循环设置每一个进度
 	for(var i=0; i<progresses.length;i++ ){
 		slots={};
 		ctx=progresses[i].getContext('2d');
 		var value = percents[i].defaultValue;
 		var num = value.split('%')[0];
 		ulp(num,nums[i],ctx);
 	}
 	
 }



 function ulp(percent,loadedNum,ctx){
 	var loading = true;
 	var hasLoaded = 0;
     var i = 0, draw = null;
     draw = setInterval(function(){
     	
         if (hasLoaded > 100) {
             loading = false;
             clearInterval(draw);
             draw = null;
             return true;
         }

         if (i<=percent) {
             d(loadedNum,ctx,hasLoaded);
             i++;
             hasLoaded += 1;
         } else {
             clearInterval(draw);
             draw = null;
         }
     }, 20);
 }

 function d(lp,ctx,hasLoaded){
     /*var lp = document.getElementById('loadedNum');*/
     lp.innerHTML = hasLoaded+"%";
     var loaded = hasLoaded * 2 / 100 * Math.PI, cw = 102, hcw = 51;
     ctx.clearRect (0,0,cw,cw);
     ctx.beginPath();
     ctx.arc(hcw,hcw,hcw-4, 0, loaded, false);
     ctx.lineWidth = 8;
     ctx.strokeStyle = '#ff6000';
     ctx.stroke();
 }

</script>
</body>
</html>


