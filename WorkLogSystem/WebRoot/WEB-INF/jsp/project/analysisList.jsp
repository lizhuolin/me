<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
  <script type="text/javascript" src="${basePath}js/jquery/jquery-1.10.2.min.js"></script>
    <link href="${basePath}css/skin1.css" rel="stylesheet" type="text/css" />
        
<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/project/project.js"></script>

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>project/project_analysisList.action"/>
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          	<span>项目名：<s:textfield name="tblProject.projectName"/></span>
	            <span>项目负责人：<s:textfield name="tblProject.projectManager.name"/></span>
				<span>项目状态:<s:select  name="tblProject.projectStatus" list="#{0:'未开始',1:'进行中',2:'已结束'}" headerKey="" headerValue="全部"/> </span> 
				<span>项目预计开始时间: <input id="startTime"  type="text" name="tblProject.projectStartTime" value='<s:date name="tblProject.projectStartTime" format="yyyy-MM-dd"/>'/> </span> 
				<span>- <input id="endTime"  type="text" name="tblProject.projectEndTime" value="<s:date name="tblProject.projectEndTime" format="yyyy-MM-dd"/>" /> </span> 
	        </div>
	     	<!--  需要提交的查询表单数据 end -->

			<div class="search_btn" onclick="searchForm();">
				<a class="fr">查询</a>
			</div>
			<a class="toggle"><i class="iconfont icon-212102"></i></a>
		</div>
	</div> 
</form>  
     
<div class="content">
      <div class="con_btn">
   <!--  第四步：   自定义操作按钮 start -->
     <!--     自定义操作按钮 end -->  
     		 <a href="javaScript:loadNewPage('<%=basePath %>project/project_projectList.action');" onclick="changeHead('项目管理')" >返回</a>
     		 <!-- <a id="export" onclick="javascript:exportExcel()">导出</a> -->
      </div>
 		
      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
            <th><input type="checkbox" ></th>
            <s:if test="#session.USER.isUserPlatform">
            <th>公司名称</th>
            </s:if>
            <th>项目名称</th>
            <th>项目负责人</th>
            <th>项目创建人</th>
            <th>项目预计开始时间</th>
            <th>项目预计结束时间</th>
            <th>项目实际开始时间</th>
            <th>项目实际结束时间</th>
            <th>项目目标</th>
            <th>项目进度</th>
            <th>项目状态</th>
            <th>备注</th>
          </tr>
          
         <s:iterator value="pageList.dataList" >
          
	          <tr>
	            <td><input type="checkbox" value="<s:property value="projectId"/>"></td>
	            <s:if test="#session.USER.isUserPlatform">
	            <td align="center"><s:property value="tblCompany.companyName"/></td>
	            </s:if>
	            <td align="center"><s:property value="projectName"/></td>
	            <td align="center"><s:property value="projectManager.name"/></td>
	            <td align="center"><s:property value="projectCreater.name"/></td>
	           <td align="center"><s:date name="projectStartTime" format="yyyy-MM-dd"/></td>
	           <td align="center"><s:date name="projectEndTime" format="yyyy-MM-dd"/></td>
	           <td align="center"><s:date name="projectRealStartTime" format="yyyy-MM-dd"/></td>
	           <td align="center"><s:date name="projectRealEndTime" format="yyyy-MM-dd"/></td>
	           <td align="center"><s:property value="projectTarget"/></td>
	           <td align="center"><s:property value="projectProgress"/></td>
	           <td align="center"><s:if test="projectStatus==0" >未开始</s:if><s:elseif test="projectStatus==1">进行中</s:elseif><s:else>已结束</s:else></td>
	           <td align="center"><s:property value="projectRemaks"/></td>
	          </tr>
        
          
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 