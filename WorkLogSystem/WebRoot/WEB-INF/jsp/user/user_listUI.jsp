<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/user/user.js"></script>
<script src="<%=basePath %>js/jquery.museum.js"></script>
<script>
 $(document).ready(function() {
    $.museum($('.con_disc img'));
});
</script>
<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/user/user_listUI.action">
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          <span>账号：<s:textfield name="user.username"/></span>
	         <span>用户姓名：<s:textfield name="user.name"/></span>
	         <span>手机号码：<s:textfield name="user.mobile"/></span> 
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
        <pb:pri privilege="add" module="user">
		   <a id="add">新增</a> 
		</pb:pri>
		<pb:pri privilege="edit" module="user">
		  <a id="edit">编辑</a>
		</pb:pri>
		<pb:pri privilege="delete" module="user">
		 <a id="delete">删除</a>
		</pb:pri>
        <a id="reset">重置密码</a>
        
      
      
      
     <!--     自定义操作按钮 end -->  
      
      </div>

      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
          <!--  第五步： 展示数据 start -->
          <tr>
            <th><input type="checkbox" class="autoChecked" id="checkedAll"></th>

            <!-- <td>用户ID</td> -->
            <td>所属部门</td>
            <s:if test="#session.USER.isUserPlatform">
            <td>所属公司</td>
            </s:if>
            <td>姓名</td>
            <td>头像</td>
            <td>账号</td>
           <!--  <td>密码</td> -->
            <td>手机号</td>
            <td>电子邮箱</td>
            <!-- <td>是否是平台用户</td> -->
            <td>创建时间</td>
            <td>最后登录时间</td>
            <td>微信</td>
            <td>性别</td>
            <!-- <td>身份证</td> -->
            <td>公司职位</td>
          </tr>
          <s:iterator value="pageList.dataList">
          <tr>
	          <td><input type="checkbox" class="autoChecked" value="<s:property value='userId'/>"></td>
	          <%-- <td><s:property value="userId"/></td> --%>
	          <td><s:property value="tblDept.deptName"/></td>
	           <s:if test="#session.USER.isUserPlatform">
		      <td><s:property value="tblCompany.companyName"/></td>
		      </s:if>
		      <td><s:property value="name"/></td>
		      
		      <td> 
		      <s:if test='image!=null && image!=""'>
                  <img id="showImg" src="<%=basePath %><s:property value='image'/>" width="50px" height="50px" >
		      </s:if>
		      <s:else>暂无图片</s:else>
		      </td>
		      
		      <td><s:property value="username"/></td>
		      <%-- <td><s:property value="password"/></td> --%>
		      <td><s:property value="mobile"/></td>
		      <td><s:property value="email"/></td>
		     <td> <s:date name="createTime" format="yyyy-MM-dd"/></td>
		       <td> <s:date name="lastLoginTime" format="yyyy-MM-dd HH:mm"/></td>
		      <td><s:property value="weichat"/></td>
		      <%-- <td><s:property value="sex"/></td> --%>
		      <th>
		       <s:if test="sex==0">男</s:if>
		       <s:if test="sex==1">女</s:if>
		      </th>
		      <%-- <td><s:property value="idcard"/></td> --%>
		      <td><s:iterator value="tblUserRoles">
		      <s:property value="id.tblRole.roleName"/></s:iterator></td>
          </tr>
          </s:iterator> 
          <!--   展示数据 end -->
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 