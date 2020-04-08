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
<script src="<%=basePath%>js/role/edit.js"></script>

</head>
<body>
<body>
	<form id="editForm">
	 <input type="hidden" name="role.roleId" id="roleId" value="<s:property value="role.roleId"/>">
		<div class="edit" style="margin: 20px">
			<ul>
				<s:hidden name="role.createTime" />
				<s:hidden name="role.tblCompany.companyId" />
				<s:hidden name="role.dataStatus" />
				<li>
					<span>
						<i>角色名</i> <samp>:</samp> <input type="text" name="role.roleName" value="${role.roleName}" /> <samp></samp>
					</span> 
					<span><i>角色描述</i> <samp>:</samp>
						<input type="text" name="role.description" value="${role.description}" />
					</span>
				</li>

				<li>
			
				
				
				<span><i>角色状态</i> <samp>:</samp> 
				  <span class="prop_sp">
					<em><s:radio list="#{'1':'有效','0':'无效'}" name="role.isEffect" /></em>
				</span>
				</span> 
				
					<span><i>数据权限</i> <samp>:</samp> 
				  <span class="prop_sp">
					<em><s:radio list="#{'0':'自己','1':'全部'}" name="role.dataPrivilege" /></em>
				</span>
				</span> 
				</li>
  <li></li>
	      <li>
	        <span><i>功能权限</i><samp>:</samp>
	             <div class="d_list1">
	                <div class="edit">
				       <div id="roleTree"  class="ztree" style="overflow:auto;">
				       </div>
				  </div>
	             </div>
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
