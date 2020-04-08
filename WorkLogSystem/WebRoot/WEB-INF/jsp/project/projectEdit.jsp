<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   

<html>
<head>

<jsp:include page="/common/common.jsp"></jsp:include>

<!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>js/project/edit.js"></script>  
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
        <input  type="hidden" id="projectId" name="tblProject.projectId" value="${tblProject.projectId }"/>
        <input type="hidden" name="tblProject.projectCreater.userId" value="${tblProject.projectCreater.userId }"/>
        <input type="hidden" name="tblProject.tblCompany.companyId" value="${tblProject.tblCompany.companyId }"/>
      	<s:hidden name="tblProject.createTime"/>
      <li>
        <span><i>名称</i><samp>:</samp>
        <input  type="text" name="tblProject.projectName" value="${tblProject.projectName }"/><samp></samp>
        </span>
         <span><i>负责人</i><samp>:</samp>
       		<s:select name="tblProject.projectManager.userId" list="userList" listKey="userId" listValue="name" />
        </span>
      </li>
     
      <li>
         <span><i>状态</i><samp>:</samp>
         	<s:if test="null == tblProject||tblProject.projectProgress==0">
            	<select name="tblProject.projectStatus">
            		<option value="0" <s:if test="tblProject.projectStatus==0">selected="selected"</s:if>>未开始</option>
            	</select>
            </s:if>
            <s:elseif test="tblProject.projectProgress==100">
            <select name="tblProject.projectStatus">
            	<option value="2"<s:if test="tblProject.projectStatus==2">selected="selected"</s:if>>已结束</option>
            </select>
            </s:elseif>
            <s:else>
            	<select name="tblProject.projectStatus">
            	<option value="1"<s:if test="tblProject.projectStatus==1">selected="selected"</s:if>>进行中</option>
            </select>
            </s:else>
        </span>
        <span><i>项目进度</i><samp>:</samp>
        <s:if test="null == tblProject">
            	<select name="tblProject.projectProgress">
            		<option value="0" <s:if test="tblProject.projectProgress==0">selected="selected"</s:if>>0%</option>
            	</select>
        </s:if>
        <s:else>
        <select  name="tblProject.projectProgress" >
        <option value="0" <s:if test="tblProject.projectProgress==0">selected="selected"</s:if>>0%</option>
        <option value="10"<s:if test="tblProject.projectProgress==10">selected="selected"</s:if>>10%</option>
        <option value="20"<s:if test="tblProject.projectProgress==20">selected="selected"</s:if>>20%</option>
        <option value="30"<s:if test="tblProject.projectProgress==30">selected="selected"</s:if>>30%</option>
        <option value="40"<s:if test="tblProject.projectProgress==40">selected="selected"</s:if>>40%</option>
        <option value="50"<s:if test="tblProject.projectProgress==50">selected="selected"</s:if>>50%</option>
        <option value="60"<s:if test="tblProject.projectProgress==60">selected="selected"</s:if>>60%</option>
        <option value="70"<s:if test="tblProject.projectProgress==70">selected="selected"</s:if>>70%</option>
        <option value="80"<s:if test="tblProject.projectProgress==80">selected="selected"</s:if>>80%</option>
        <option value="90"<s:if test="tblProject.projectProgress==90">selected="selected"</s:if>>90%</option>
        <option value="100"<s:if test="tblProject.projectProgress==100">selected="selected"</s:if>>100%</option>
        </select>
        </s:else>
        <samp></samp>
        </span>
        
      </li>
      <li>
        <span><i>开始时间</i><samp>:</samp>
        <input id="startTime5"  type="text" name="tblProject.projectStartTime" value="${tblProject.projectStartTime }"/><samp></samp>
        </span>
        <span><i>结束时间</i><samp>:</samp>
        <input id="endTime5" type="text" name="tblProject.projectEndTime" value="${tblProject.projectEndTime }"/><samp></samp>
        </span>
      </li>
       <li>
        <span><i>实际开始</i><samp>:</samp>
        <input id="startTime4"  type="text" name="tblProject.projectRealStartTime" value="${tblProject.projectRealStartTime }"/><samp></samp>
        </span>
        <span><i>实际结束</i><samp>:</samp>
        <input id="endTime4" type="text" name="tblProject.projectRealEndTime" value="${tblProject.projectRealEndTime }"/><samp></samp>
        </span>
      </li>
      <li>
        <span><i>备注</i><samp>:</samp>
        <textarea   name="tblProject.projectRemaks" ><s:property value="tblProject.projectRemaks"/></textarea>
        </span>
        <span><i>项目目标</i><samp>:</samp>
        <textarea   name="tblProject.projectTarget" ><s:property value="tblProject.projectTarget"/></textarea>
        </span>
      
      </li>
      
    </ul>
  </div>
</form>


  <div class="edit_btn"><a id="edit" >保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
