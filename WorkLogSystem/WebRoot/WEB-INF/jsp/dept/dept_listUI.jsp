<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/dept/dept.js"></script>

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>dept/dept_listUI.action">
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	         <span>部门名称：<s:textfield name="dept.deptName"/></span>
	         
	        </div>
	        <!--  需要提交的查询表单数据 end -->
	        
	        <div class="search_btn" onclick="searchForm();"><a class="fr">查询</a></div>
	        <input id="hiddenText" type="text" style="display:none" /><%--防止enter刷新当前页面 --%>
	        <a class="toggle"><i class="iconfont icon-212102"></i></a>
	      </div>
	</div> 
</form>  
     
<div class="content">
      <div class="con_btn">
   <!--  第四步：   自定义操作按钮 start -->
      <!-- <a id="out">导出</a> -->
      <pb:pri privilege="add" module="dept">
		  <a id="add">新增</a>
		</pb:pri>
		 <pb:pri privilege="edit" module="dept">
		  <a id="edit">编辑</a>
		</pb:pri>
		 <pb:pri privilege="delete" module="dept">
		  <a id="delete">删除</a>
		</pb:pri>
      
      
      
     
      
      
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
            <th>部门名称</th>
            <th>部门介绍</th>
            <th>部门主管</th>
            <th>创建时间</th>
          </tr>
          
          <s:iterator value="pageList.dataList" >
          <s:if test="dataStatus==1">
          <tr>
            <th class="checkedOne"><input type="checkbox" class="autoChecked" value="<s:property value="deptId"/>"></th>
             <s:if test="#session.USER.isUserPlatform">
            <td><s:property value="tblCompany.companyName"/></td>
            </s:if>
            <td><s:property value="deptName"/></td>
            <td><s:property value="deptDecription"/></td>
            <td><s:property value="manager.name"/></td>
            
            <td>
            <s:date name="createTime" format="yyyy-MM-dd"/>
            </td>
          </tr>
        
          </s:if>
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 