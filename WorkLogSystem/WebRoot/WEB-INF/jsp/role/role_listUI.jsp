<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath%>js/role/role.js"></script>

<form id="searchForm">
	<input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>"> 
	<input type="hidden" id="actionUrl" value="<%=basePath%>role/role_listUI.action">
	<div class="main_top">
		<!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
		<div class="con_top">
			<div class="con_search">
				<span>角色名：<s:textfield name="role.roleName"/></span>
				<span> 状态:<s:select  name="role.isEffect" list="#{'1':'有效','0':'无效'}" headerKey="" headerValue="全部"/> </span>
				 <input id="hiddenText" type="text" style="display:none" /><%--防止enter刷新当前页面 --%>
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
		<pb:pri privilege="add" module="role">
		  	<a id="add">新建</a> 
		 </pb:pri>
		 <pb:pri privilege="edit" module="role">
			<a id="edit">编辑</a> 
		</pb:pri>
			<pb:pri privilege="delete" module="role">
		<a id="delete">删除</a>
		</pb:pri>

		<!--     自定义操作按钮 end -->

	</div>

	<div class="con_disc">
		<table border="1" bordercolor="#ccc">


			<!--  第五步： 展示数据 start -->


			<tr>
				<th><input type="checkbox" class="autoChecked" id="checkedAll"></th>

				<th>名字</th>
				<th>描述</th>
				<s:if test="#session.USER.isUserPlatform">
					<th>所属公司</th>
				</s:if>
				<th>角色状态</th>
				<th>数据权限</th>


			</tr>
			<s:iterator value="pageList.dataList">
				<tr class="checkedOne">
				<s:if test='roleId == "0" || roleId == "1"|| roleId == "2" ' >
					<td></td>
				</s:if><s:else><td><input type="checkbox" class="autoChecked" value="<s:property value='roleId' />"></td></s:else>
					<td><s:property value="roleName" /></td>
					<td><s:property value="description" /></td>
					<s:if test="#session.USER.isUserPlatform">
						<td><s:property value="tblCompany.companyName" /></td>
					</s:if>
					<td><s:if test='isEffect=="1"'>有效</s:if><s:elseif test='isEffect=="0"'>无效</s:elseif></td>
					<td><s:if test='dataPrivilege=="0"'>查看自己</s:if><s:elseif test='dataPrivilege=="1"'>查看全部</s:elseif>
					
					</td>
				</tr>
			</s:iterator>
			<!--   展示数据 end -->

		</table>
	</div>
</div>

<jsp:include page="/common/page.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>
<script src="<%=basePath%>common/comm.js" type="text/javascript"></script>
