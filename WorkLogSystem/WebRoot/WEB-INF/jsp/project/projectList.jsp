<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
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
   <input type="hidden" id="actionUrl" value="<%=basePath %>/project/project_projectList.action"/>
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          <span>项目名：<s:textfield name="tblProject.projectName"/></span>
	        <s:if test="#session.USER.isUserPlatform">
            <span>公司名称:<s:textfield name="tblProject.tblCompany.companyName" /></span>
            </s:if>
            <span>负责人:<s:textfield name="tblProject.projectManager.name"/></span>
            <span>项目状态:<s:select  name="tblProject.projectStatus" list="#{0:'未开始',1:'进行中',2:'已结束'}" headerKey="" headerValue="全部"/> </span> 
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
   <pb:pri privilege="add" module="project">
      <a id="add">添加项目</a>
    </pb:pri>  
    <pb:pri privilege="edit" module="project">
      <a id="edit">编辑项目</a>
      </pb:pri>  
      <pb:pri privilege="manager" module="project">
      <a id="manager">项目成员</a>
      </pb:pri>  
      <pb:pri privilege="delete" module="project">
      <a id="delete" >删除项目</a>
      </pb:pri>  
      <pb:pri privilege="getplan" module="project">
      <a id="getplan">项目计划</a>
      </pb:pri>  
      <pb:pri privilege="timeReport" module="project">
      <a id="timeReport" >定时报告</a>
      </pb:pri>  
      <pb:pri privilege="analysis" module="project">
      <a id="analysis" >统计分析</a>
      </pb:pri>  
      <a id="addplan">添加计划</a>
     <!--     自定义操作按钮 end -->  
      
      </div>
      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
          	<th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
            <s:if test="#session.USER.isUserPlatform">
            <th>公司名称</th>
            </s:if>
            <th>项目名称</th>
            <th>负责人</th>
            <th>创建人</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>实际开始</th>
            <th>实际结束</th>
            <th>创建时间</th>
            <th>目标</th>
            <th>进度</th>
            <th>状态</th>
            <th>备注</th>
            <th>子项目操作</th>
          </tr>
          
         <s:iterator value="pageList.dataList" >
          
          <tr>
          	<s:if test='projectProgress == "100" '><td></td></s:if>
            <s:else><td class="checkedOne"><input type="checkbox" class="autoChecked" value="<s:property value="projectId"/>"></td></s:else>
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
           <td align="center"><s:date name="createTime" format="yyyy-MM-dd HH:mm:00"/></td>
           <td align="center"><s:property value="projectTarget"/></td>
           <td align="center"><s:property value="projectProgress"/>%</td>
           <td align="center"><s:if test="projectStatus==0" >未开始</s:if><s:elseif test="projectStatus==1">进行中</s:elseif><s:else>已结束</s:else></td>
           <td align="center"><s:property value="projectRemaks"/></td>
           <td align="center">
              <a id="addChild" onclick="doAddchild('<s:property value='projectId'/>')">添加</a>
              <a id="checkout" onclick="doCheckout('<s:property value='projectId'/>')">查看</a>
           </td>
          </tr>
        
          
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 