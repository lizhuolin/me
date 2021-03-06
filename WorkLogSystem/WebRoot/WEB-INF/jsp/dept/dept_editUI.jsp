<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
<script src="<%=basePath %>js/dept/edit.js"></script>
</head>
<body>
	<form id="editForm">
		<div class="edit">
			<input type="hidden" name="dept.deptId"
				value="<s:property value="dept.deptId"/>" />
		<s:hidden name="dept.createTime"/>
	    <s:hidden name="dept.dataStatus"/>
	    <s:hidden name="dept.tblCompany.companyId"/>
			<ul>

			<li>
			<span><i>部门名称</i><samp>:</samp>
        	<input  type="text" name="dept.deptName" value="${dept.deptName }"/><label class="require_lab"></label><samp></samp>
          	<div class="d_list"></div>
            </span> 
			
           <span><i>部门主管</i>
			<samp>:</samp> <s:select name="dept.manager.userId" list="userList" listKey="userId" listValue="name" /><label class="require_lab"></label><samp></samp>
            </span></li> 
 		
      
      <li >
        <span><i>部门介绍</i><samp>:</samp>
        	<textarea id="deptDecription"  type="text" name="dept.deptDecription" ><s:property value="dept.deptDecription"/></textarea>
      </span></li>
			

			</ul>
		</div>
	</form>


	<div class="edit_btn">
		<a id="edit">保存</a><a id="close" class="btn_cancel">取消</a>
	</div>

	<!-- 保存遮罩层-->
	<!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
