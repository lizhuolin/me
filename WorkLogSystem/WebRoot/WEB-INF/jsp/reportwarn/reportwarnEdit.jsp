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

<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/reportwarn/edit.js"></script>  
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
     <li>
        <span><i>任务名称</i><samp>:</samp>
        <input  type="text" name="tblTask.name" value="${tblTask.name }"/><samp></samp>
       	</span>
       	
       	<li>
       	<span><i>建表时间</i><samp>:</samp>
	    <input id="startTime4" class="middle" value="<s:date name="tblTask.createTime" format="yyyy-MM-dd HH:mm:ss"/>" name="tblTask.taskStartTime" type="text" />
       	</span>
		</li>
        <li>
        
	        <span><i>开始时间</i><samp>:</samp>
	        
	         <input id="startTime5" class="middle" value="<s:date name="tblTask.taskStartTime" format="yyyy-MM-dd HH:mm:ss"/>" name="tblTask.taskStartTime" type="text" />
	        </span>
	        
	        <span><i>结束时间</i><samp>:</samp>
	         <input id="endTime5" class="middle" value="<s:date name="tblTask.taskEndTime" format="yyyy-MM-dd HH:mm:ss"/>" name="tblTask.taskEndTime" type="text" />
	        </span>
        </li>       	
       	
       	<li>
       	<span><i>负责人</i><samp>:</samp>
       	<input type="text" name="tblTask.tblUser" value="${tblTask.tblUser}" /><samp></samp>
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
