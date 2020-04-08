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
<script src="<%=basePath%>js/tease/edit.js"></script>

</head>
<body>
<body>
	<form id="editForm">
	 <input type="hidden" name="tease.teaseId" id="teaseId" value="<s:property value="tease.teaseId"/>">
		<div class="edit" style="margin: 20px">
			<ul>
				<s:hidden name="tease.createTime" />
				<s:hidden name="tease.tblUser.userId" />
				<s:hidden name="tease.tblCompany.companyId" />
				<s:hidden name="tease.dataStatus" />
				<li>
					<span>
						<i>吐槽标题</i> <samp>:</samp> <input  type="text" name="tease.teaseTitle" value="${tease.teaseTitle}" required="required"/> <samp></samp>
					</span> 
					
				<span>
					<i>吐槽模块</i> <samp>:</samp> <input type="text" name="tease.teasePart" value="${tease.teasePart}" /> <samp></samp>
					</span>
				</li>				
					
	
				<li>
				<span><i>吐槽内容</i> <samp>:</samp> 
				<textarea id="logMsg" name="tease.teaseContent" ><s:property value="tease.teaseContent" /> </textarea>
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
