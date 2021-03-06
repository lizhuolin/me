<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>

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
<script src="<%=basePath %>js/project/editChild.js?v1.0.5"></script>  
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
    
    <li>
    <input type="hidden" name="tblProjectChild.tblProject.projectId" value="${tblProject.projectId }"/>
    <input type="hidden" name="tblProjectChild.projectChildRealId" value="${tblProjectChild.projectChildRealId }"/>
    <input type="hidden" name="tblProjectChild.creater.userId" value="${tblProjectChild.creater.userId }"/>
    <input type="hidden" name="tblProjectChild.creteTime" value="${tblProjectChild.creteTime }"/>
    </li>
     <li>
        <span><i>名称</i><samp>:</samp>
        <input  type="text"  name="tblProjectChild.projectName" value="${tblProjectChild.projectName }"/><samp></samp>
          <div class="d_list"></div>
        </span>
        <span><i>目标</i><samp>:</samp>
        <input  type="text"  name="tblProjectChild.projectChildTarget" value="${tblProjectChild.projectChildTarget }"/><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
     
      <li>
         <span><i>状态</i><samp>:</samp>
      		<s:if test="null == tblProjectChild||tblProjectChild.projectProgress==0">
      			<select name="tblProjectChild.projectChildStatus">
            		<option value="0" <s:if test="tblProjectChild.projectChildStatus==0">selected="selected"</s:if>>未开始</option>
            	</select></s:if>
            	<s:elseif test="tblProjectChild.projectProgress==100">
            <select name="tblProjectChild.projectChildStatus">
            <option value="2"<s:if test="tblProjectChild.projectChildStatus==2">selected="selected"</s:if>>已结束</option>
            </select>
            </s:elseif>
            <s:else>
            <select name="tblProjectChild.projectChildStatus">
           	<option value="1"<s:if test="tblProjectChild.projectChildStatus==1">selected="selected"</s:if>>进行中</option>
           	</select>
            </s:else>
        </span>
        <span><i>工时</i><samp>:</samp>
        <select name="tblProjectChild.planTime" >
        <option value="0" <s:if test="tblProjectChild.planTime==0">selected="selected"</s:if>>0工时</option>
        <option value="1"<s:if test="tblProjectChild.planTime==1">selected="selected"</s:if>>1工时</option>
        <option value="2"<s:if test="tblProjectChild.planTime==2">selected="selected"</s:if>>2工时</option>
        <option value="3"<s:if test="tblProjectChild.planTime==3">selected="selected"</s:if>>3工时</option>
        <option value="4"<s:if test="tblProjectChild.planTime==4">selected="selected"</s:if>>4工时</option>
        <option value="5"<s:if test="tblProjectChild.planTime==5">selected="selected"</s:if>>5工时</option>
        <option value="6"<s:if test="tblProjectChild.planTime==6">selected="selected"</s:if>>6工时</option>
        <option value="7"<s:if test="tblProjectChild.planTime==7">selected="selected"</s:if>>7工时</option>
        <option value="8"<s:if test="tblProjectChild.planTime==8">selected="selected"</s:if>>8工时</option>
        <option value="9"<s:if test="tblProjectChild.planTime==9">selected="selected"</s:if>>9工时</option>
        <option value="10"<s:if test="tblProjectChild.planTime==10">selected="selected"</s:if>>10工时</option>
        </select>
        <samp></samp>
        </span>
      </li>
      <li>
        <span>
        <i>等级</i><samp>:</samp>
        <select name="tblProjectChild.projectLevel">
            
            <option value="0" <s:if test="tblProjectChild.projectLevel==0">selected="selected"</s:if>>低</option>
            <option value="1"<s:if test="tblProjectChild.projectLevel==1">selected="selected"</s:if>>一般</option>
            <option value="2"<s:if test="tblProjectChild.projectLevel==2">selected="selected"</s:if>>高</option>
            </select>
        </span>
      	<span>
			<i>进度</i><samp>:</samp>
			<s:if test="null == tblProjectChild"><select name="tblProjectChild.projectProgress">
            		<option value="0" <s:if test="tblProjectChild.projectProgress==0">selected="selected"</s:if>>0%</option>
            	</select></s:if>
            <s:else>
			<select name="tblProjectChild.projectProgress">
			<option value="0" <s:if test="tblProjectChild.projectProgress==0">selected="selected"</s:if>>0%</option>
            <option value="10"<s:if test="tblProjectChild.projectProgress==10">selected="selected"</s:if>>10%</option>
            <option value="20"<s:if test="tblProjectChild.projectProgress==20">selected="selected"</s:if>>20%</option>
            <option value="30"<s:if test="tblProjectChild.projectProgress==30">selected="selected"</s:if>>30%</option>
            <option value="40"<s:if test="tblProjectChild.projectProgress==40">selected="selected"</s:if>>40%</option>
            <option value="50"<s:if test="tblProjectChild.projectProgress==50">selected="selected"</s:if>>50%</option>
            <option value="60"<s:if test="tblProjectChild.projectProgress==60">selected="selected"</s:if>>60%</option>
            <option value="70"<s:if test="tblProjectChild.projectProgress==70">selected="selected"</s:if>>70%</option>
            <option value="80"<s:if test="tblProjectChild.projectProgress==80">selected="selected"</s:if>>80%</option>
            <option value="90"<s:if test="tblProjectChild.projectProgress==90">selected="selected"</s:if>>90%</option>
            <option value="100"<s:if test="tblProjectChild.projectProgress==100">selected="selected"</s:if>>100%</option>
			</select>
			</s:else>
			<samp></samp>
          <div class="d_list"></div>      	
      	</span>
      </li>
     
      <li>
        <span><i>开始时间</i><samp>:</samp>
        <input  id="startTime5"  type="text"  name="tblProjectChild.projectChildStarttime" value="${tblProjectChild.projectChildStarttime }"/><samp></samp>
          <div class="d_list"></div>
        </span>
        <span><i>结束时间</i><samp>:</samp>
        <input  id="endTime5"  type="text"  name="tblProjectChild.projectChildEndtime" value="${tblProjectChild.projectChildEndtime  }"/><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
       <li>
        <span><i>实际开始</i><samp>:</samp>
        <input  id="startTime4"  type="text"  name="tblProjectChild.projectChildRealstarttime" value="${tblProjectChild.projectChildRealstarttime }"/><samp></samp>
          <div class="d_list"></div>
        </span>
        <span><i>实际结束</i><samp>:</samp>
        <input  id="endTime4"  type="text"  name="tblProjectChild.projectChildRealendtime" value="${tblProjectChild.projectChildRealendtime  }"/><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
     <li>
      <span>
      	<i>负责人</i><samp>:</samp>
      	<s:select name="tblProjectChild.responsible.userId" list="userList" listKey="userId" listValue="name" />
      	<div class="d_list"></div>
      	</span>
      </li>
    </ul>
  </div>
</form>


  <div class="edit_btn"><a id="edit">保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
