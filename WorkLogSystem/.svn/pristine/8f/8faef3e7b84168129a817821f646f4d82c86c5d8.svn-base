<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>

<jsp:include page="/common/common.jsp"></jsp:include>

<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath%>js/privilege/edit.js"></script>

</head>
<body>
<body>
	<form id="editForm">
	 <input type="hidden" name="privilege.privilegeId" id="privilegeId" value="<s:property value="privilege.privilegeId"/>">
		<div class="edit" style="margin: 20px">
			<ul>
				<li>
					<span>
						<i>权限名</i> <samp>:</samp> <input type="text" name="privilege.privilegeName" value="${privilege.privilegeName}" /> <samp></samp>
					</span> 
					</li>
				<li>
					<span><i>权限描述</i> <samp>:</samp>
						<s:textarea name="privilege.privilegeDescription"></s:textarea>
						<%-- <input type="text" style="width:400px;height:200px" name="privilege.privilegeDescription" value="${privilege.privilegeDescription}" /> --%>
					</span>
				</li>


			</ul>
		</div>
	</form>


	<div class="edit_btn">
		<a id="edit">保存</a><a id="close" class="btn_cancel">取消</a>
	</div>

	<!--  保存遮罩层
	<div class="edit_cover"><p><img src="images/loading.gif"></p></div> -->
</body>

</html>
