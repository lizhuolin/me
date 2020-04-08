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
<script src="<%=basePath%>js/tease/tease.js"></script>

<form id="searchForm">
	<input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>"> 
	<input type="hidden" id="actionUrl" value="<%=basePath%>tease/tease_listUI.action">
	<div class="main_top">
		<!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
		<div class="con_top">
			<div class="con_search">
				<%--<span>角色名：<s:textfield name="role.roleName"/></span>
				<span> 状态:<s:select  name="role.isEffect" list="#{'1':'有效','0':'无效'}" headerKey="" headerValue="全部"/> </span>--%>
				 <input id="hiddenText" type="text" style="display:none" /><%--防止enter刷新当前页面 
			--%></div>
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
		<%--<pb:pri privilege="add" module="role">
		  	--%><a id="add">新建</a> 
			<a id="edit">编辑</a> 
		<a id="delete">删除</a>

		<!--     自定义操作按钮 end -->

	</div>

	<div class="con_disc">
		<table border="1" bordercolor="#ccc">


			<!--  第五步： 展示数据 start -->


			<tr>
				<th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
			<s:if test="#session.USER.isUserPlatform">
					<th>所属公司</th>
					<th>用户姓名</th>
				</s:if>
				<th>吐槽标题</th>
				<th>吐槽模块</th>
				<th>吐槽内容</th>
				<!-- <th>操作</th> -->


			</tr>
			<s:iterator value="pageList.dataList">
				<tr class="checkedOne">
				<td><input type="checkbox" class="autoChecked" value="<s:property value='teaseId' />"></td>
				<s:if test="#session.USER.isUserPlatform">
						<td><s:property value="tblCompany.companyName" /></td>
						<td><s:property value="tblUser.name" /></td>
					</s:if>
					<td><s:property value="teaseTitle" /></td>
					<td><s:property value="teasePart" /></td>
					<td><s:property value="teaseContent" /></td>
					<%-- <td><a id="reply" onclick="doReply('<s:property value='teaseId'/>')">回复</a></td> --%>
				</tr>
			</s:iterator>
			<!--   展示数据 end -->

		</table>
	</div>
</div>

<jsp:include page="/common/page.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>
<script src="<%=basePath%>common/comm.js" type="text/javascript"></script>
