<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/reportwarn/reportwarn.js"></script>


<form id="searchForm">
  <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/reportwarn/reportwarn_reportwarnList.action"> 
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          <%-- <span>条件：<input type="text" name=""></span> --%>
	           <input id="hiddenText" type="text" style="display:none" /><%--防止enter刷新当前页面 --%>
	         
	        </div>
	        <!--  需要提交的查询表单数据 end -->
	        
	        <div class="search_btn" onclick="searchForm();"><a class="fr">查询</a></div>
		 <a class="toggle"><i class="iconfont icon-212102"></i></a>
	      </div>
	</div> 
</form>  
     
<div class="content">
      <div class="con_btn">
   <!--  第四步：   自定义操作按钮 start -->
      <pb:pri privilege="delete" module="reportwarn"><a id="delete">删除</a></pb:pri>
      
     <!--     自定义操作按钮 end -->  
      
      </div>

      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
            <th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
            <th>提醒类型</th>
           	<th>名称</th>
            <th>目标</th>
            <th>提醒内容</th>
          </tr>
          
          <s:iterator value="pageList.dataList">
          <tr>
	          <td><input type="checkbox" class="autoChecked" value="<s:property value='reportwarnId'/>"></td>
	         <s:if test='type == "0"'>
            <td>任务 </td> 
          </s:if>
          <s:elseif test='type == "1"'>
          	<td>计划 </td>
          </s:elseif>
          <s:elseif test='type == "2"'>
          	<td>日志 </td>
          </s:elseif>
	      
          <s:if test='type == "0"'>
            <td><s:property value="tblTask.taskMsg" /> </td> 
          </s:if>
          <s:elseif test='type == "1"'>
          	<td><s:property value="tblPlan.planName" /> </td>
          </s:elseif>
          <s:elseif test='type == "2"'>
          	<td><s:property value="tblLog.tblUser.name" /><s:date name="createTime" format="yyyy-MM-dd"/>日志 </td>
          </s:elseif>
          <td><s:property value="tblUser.name"/> </td>
           <s:if test='type == "0"'>
            <td><s:property value="tblTask.taskDesc" /> </td> 
          </s:if>
          <s:elseif test='type == "1"'>
          	<td><s:property value="tblPlan.planRemarks" /> </td>
          </s:elseif>
          <s:elseif test='type == "2"'>
          	<td><s:property value="tblLog.logMsg" /> </td>
          </s:elseif>
          </tr>
         </s:iterator>
          <!--   展示数据 end -->
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 