<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html >
<html>
<head lang = "en">
<%@include file="/common/mobileCommon.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;">
    <title>任务</title>
   <link href="<%=basePath %>css/mobileStyle.css" rel="stylesheet" type="text/css">
   
   <script type="text/javascript">
    	//提交表单
    	function doSubmit(){
	    		//提交表单
	    	//	document.write("运行了？");
	    		//$("#form").submit();
	    		document.forms[0].submit();
	    		/* alert("保存成功"); */
    	}
    </script>
 </head>

<body style="background-color:#e6e6e6">

	<div id="header_wrapper">
    	<div class="title">
  		
    	<div class="title_button"><a href="mobile/task/mobile_taskList4Mobile.action"><img src="<%=basePath %>images/back.png"></a></div>
 		 <div class="title_text">任务详细信息</div>
         </div>
 	</div><!--header_wrapper结束-->
    <div id="body_wrapper">
    	
    	
    	<form id="form" name="form" action="<%=basePath %>mobile/task/mobile_mobileEdit.action" method="post" enctype="multipart/form-data">
        	<!-- <input type="hidden" name="tblTask.taskMsg value="<s:property value="tblTask.taskMsg"/>" /> -->
			<s:hidden name="tblTask.taskId" />
			<s:hidden name="tblTask.createrUser.userId" />
			<s:hidden name="tblTask.taskResponsible.userId" />
			<s:hidden name="tblTask.createTime" />
			<s:hidden name="tblTask.taskStartTime" />
			<s:hidden name="tblTask.taskEndTime" />
			<s:hidden name="tblTask.dataStatus" />
			<s:hidden name="tblTask.taskLevel" />
			<s:hidden name="tblTask.taskTime" />
			<s:hidden name="tblTask.tblCompany.companyId" />
			<s:hidden name="tblTask.isPush" />


			<section >
 			<div class="plan_box">

            	<div class="plan_name">
            	 <div class="task_dian"></div><input type="text" name="tblTask.taskMsg" value="<s:property value="tblTask.taskMsg"/>" readonly/>
                 </div>
                 

               <div class="plan_other">
             	<p><span>创建人:</span><input type="text" name="tblTask.createrUser.name" value='<s:property value="tblTask.createrUser.name"/>'   readonly></p>
            	<p><span>负责人:</span><input type="text" name="tblTask.taskResponsible.name" value='<s:property value="tblTask.taskResponsible.name"/>'  readonly></p>
                <p><span>任务目标：</span><span class = "taskTarget"><s:property value="tblTask.taskTarget"/></span></p>            
                <p><span>任务进度:</span> <s:select list="#progressList"  name="tblTask.taskProgress">
            </s:select></p>
            	<p><span>创建时间：</span><input type="text" name="tblTask.createTime"  value="<s:date name="tblTask.createTime" format="yyyy-MM-dd"/>" readonly></p>
                <p><span>计划开始－结束时间:</span><input type="text" name="tblTask.taskStartTime"  value="<s:date name="tblTask.taskStartTime" format="yyyy-MM-dd"/>" readonly>-<input  type="text" name="tblTask.taskEndTime"  value="<s:date name="tblTask.taskEndTime" format="yyyy-MM-dd"/>" readonly></p>
        		<p><span>实际开始－结束时间:</span><input type="date" name="tblTask.taskRealStartTime" value="<s:date name="tblTask.taskRealStartTime" format="yyyy-MM-dd"/>" >-<input  type="date" name="tblTask.taskRealEndTime" value="<s:date name="tblTask.taskRealEndTime" format="yyyy-MM-dd"/>" ></p>

                </div>
                </div>
         </section>
        
         <section>
         	<div class="task_remark">
            	<div class="remark_title">备注:</div>
                <p><textarea  name="tblTask.taskRemaks"  type="text" rows="5" cols="60" ><s:property value="tblTask.taskRemaks"/></textarea></p>
                <input type="button" value="提交" onclick="doSubmit()" />
            </div>
         </section>
         
         <section>  
         	<div class="task_text">     
                <div class="content_dl">任务内容:</div>
                <p><textarea name="tblTask.taskDesc"  type="text" rows="10" cols="60" readonly><s:property value="tblTask.taskDesc" /></textarea></p>
		 </div>
        </section>
        </form>
        </div>
        
       <%@include file="/common/mobileBelow.jsp"%>
   
</body>
</html>
