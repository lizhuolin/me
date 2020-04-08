<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
  <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/changelog/changelog_listUI.action">
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          <span>操作类型:<s:select name="logs.changelogType" list="#{'0':'新增','1':'编辑','2':'删除','3':'导出'}" headerKey="" headerValue="全部"/></span>
	          <span>操作模块:<s:select name="logs.changelogmodel" list="#modelList"  headerKey="" headerValue="全部"></s:select></span>
	          <span>操作人:<input type="text" name="logs.tblUser.name" value='<s:property value="logs.tblUser.name"/>'></span>
	          <span>操作时间: <input id="startTime"  type="text" name="startTime" value='<s:date name="startTime" format="yyyy-MM-dd"/>'/> </span>
	          <span>- <input id="endTime"  type="text" name="endTime" value="<s:date name="endTime" format="yyyy-MM-dd"/>" /> </span>  
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
   
      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
          <!--  第五步： 展示数据 start -->
          <tr>
            <th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
            <s:if test="#session.USER.isUserPlatform">
            <td>所属公司</td></s:if>
            <td>操作人</td>
            <td>操作时间</td>
            <td>操作模块</td>
            <td>操作类型</td>
            <td>变更内容</td>
            
            
          </tr>
          <s:iterator value="pageList.dataList" var="it"  status="status">
          
          <tr>
	          <th class="checkedOne"><input type="checkbox" class="autoChecked" value="<s:property value="changelogId"/>"></th>
	          
	          <s:if test="#session.USER.isUserPlatform">
	         
            <td align="center"><s:property value="pageList.dataList[#status.index][1].tblCompany.companyName"/></td></s:if>
            <td align="center"><s:property value="pageList.dataList[#status.index][1].tblUser.name"/></td>
            <td align="center"><s:date name="pageList.dataList[#status.index][1].changelogTime" format="yyyy-MM-dd HH:mm:ss"/></td>
            <td align="center"><s:property value="pageList.dataList[#status.index][1].changelogmodel"/></td>
            <td><s:if test="pageList.dataList[#status.index][1].changelogType==0">新增</s:if>
                <s:if test="pageList.dataList[#status.index][1].changelogType==1">编辑</s:if>
                <s:if test="pageList.dataList[#status.index][1].changelogType==2">删除</s:if>
                <s:if test="pageList.dataList[#status.index][1].changelogType==3">导出</s:if>
                <s:if test="pageList.dataList[#status.index][1].changelogType==4">登陆</s:if></td>
            <td align="center"><s:property value="pageList.dataList[#status.index][1].changelogContent"/></td>
            
         
          </tr>
          </s:iterator> 
          <!--   展示数据 end -->
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 