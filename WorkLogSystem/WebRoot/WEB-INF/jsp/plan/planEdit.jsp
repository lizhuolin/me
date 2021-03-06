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
<script src="<%=basePath %>js/plan/edit.js"></script>  
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
    
    <li>
    <input type="hidden" name="tblPlan.planId" value="${tblPlan.planId }"/>
    <input type="hidden" name="tblPlan.tblProject.projectId" value="${tblProject.projectId }"/>
    <input type="hidden" name="tblPlan.tblProjectChild.projectChildRealId" value="${tblProjectChild.projectChildRealId }"/>
    <input type="hidden" name="tblPlan.createTime" value="${tblPlan.createTime }"/>
    <input type="hidden" name="tblPlan.planCreateTime" value="${tblPlan.planCreateTime }"/>
    <input type="hidden" name="tblPlan.planCreater.userId" value="${tblPlan.planCreater.userId }"/>
    </li>
     <li>
        <span><i>名称</i><samp>:</samp>
        <input  type="text"  name="tblPlan.planName" value="${tblPlan.planName }"/><samp></samp>
          <div class="d_list"></div>
        </span>
        <span><i>目标</i><samp>:</samp>
        <input  type="text"  name="tblPlan.planTarget" value="${tblPlan.planTarget }"/><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
    
      <li>
        <span><i>内容</i><samp>:</samp>
        <input  type="text"  name="tblPlan.planMsg" value="${tblPlan.planMsg }"/><samp></samp>
          <div class="d_list"></div>
        </span>
        <span>
        <i>等级</i><samp>:</samp>
        <select name="tblPlan.planClass">
            
            <option value="0" <s:if test="tblPlan.planClass==0">selected="selected"</s:if>>低</option>
            <option value="1"<s:if test="tblPlan.planClass==1">selected="selected"</s:if>>一般</option>
            <option value="2"<s:if test="tblPlan.planClass==2">selected="selected"</s:if>>高</option>
            </select>
        </span>
       
      </li>
      <li>
      <span><i>状态</i><samp>:</samp>
      		<s:if test="tblPlan == null||tblPlan.projectProgress==0">
      		<select name="tblPlan.planStatus">
            <option value="0" <s:if test="tblPlan.planStatus==0">selected="selected"</s:if>>未开始</option>
            </select></s:if>
            <s:elseif test="tblPlan.projectProgress==100">
            	<select name="tblPlan.planStatus">
            <option value="2" <s:if test="tblPlan.planStatus==2">selected="selected"</s:if>>已结束</option>
            </select>
           	</s:elseif>
            <s:else>
            <select name="tblPlan.planStatus">
            <option value="1"<s:if test="tblPlan.planStatus==1">selected="selected"</s:if>>进行中</option>
            </select>
            </s:else>
        </span>
        <span>
			<i>进度</i><samp>:</samp>
				<s:if test="tblPlan == null"><select name="tblPlan.projectProgress">
            <option value="0" <s:if test="tblPlan.projectProgress==0">selected="selected"</s:if>>0%</option>
            </select></s:if>
            	<s:else>
            	<select name="tblPlan.projectProgress">
            	<option value="0" <s:if test="tblPlan.projectProgress==0">selected="selected"</s:if>>0%</option>
            	<option value="10"<s:if test="tblPlan.projectProgress==10">selected="selected"</s:if>>10%</option>
            	<option value="20"<s:if test="tblPlan.projectProgress==20">selected="selected"</s:if>>20%</option>
            	<option value="30"<s:if test="tblPlan.projectProgress==30">selected="selected"</s:if>>30%</option>
            	<option value="40"<s:if test="tblPlan.projectProgress==40">selected="selected"</s:if>>40%</option>
            	<option value="50"<s:if test="tblPlan.projectProgress==50">selected="selected"</s:if>>50%</option>
            	<option value="60"<s:if test="tblPlan.projectProgress==60">selected="selected"</s:if>>60%</option>
            	<option value="70"<s:if test="tblPlan.projectProgress==70">selected="selected"</s:if>>70%</option>
            	<option value="80"<s:if test="tblPlan.projectProgress==80">selected="selected"</s:if>>80%</option>
            	<option value="90"<s:if test="tblPlan.projectProgress==90">selected="selected"</s:if>>90%</option>
            	<option value="100"<s:if test="tblPlan.projectProgress==100">selected="selected"</s:if>>100%</option>
            </select></s:else><samp></samp>     	
      	</span>
        
      </li>
      <li>
      <span>
      	<i>负责人</i><samp>:</samp>
      	<s:select name="tblPlan.planManager.userId" list="userList" listKey="userId" listValue="name" />
      	</span>
      	 <span><i>工时</i><samp>:</samp>
        <select  name="tblPlan.planTime" >
        <option value="0" <s:if test="tblPlan.planTime==0">selected="selected"</s:if>>0工时</option>
        <option value="1"<s:if test="tblPlan.planTime==1">selected="selected"</s:if>>1工时</option>
        <option value="2"<s:if test="tblPlan.planTime==2">selected="selected"</s:if>>2工时</option>
        <option value="3"<s:if test="tblPlan.planTime==3">selected="selected"</s:if>>3工时</option>
        <option value="4"<s:if test="tblPlan.planTime==4">selected="selected"</s:if>>4工时</option>
        <option value="5"<s:if test="tblPlan.planTime==5">selected="selected"</s:if>>5工时</option>
        <option value="6"<s:if test="tblPlan.planTime==6">selected="selected"</s:if>>6工时</option>
        <option value="7"<s:if test="tblPlan.planTime==7">selected="selected"</s:if>>7工时</option>
        <option value="8"<s:if test="tblPlan.planTime==8">selected="selected"</s:if>>8工时</option>
        <option value="9"<s:if test="tblPlan.planTime==9">selected="selected"</s:if>>9工时</option>
        <option value="10"<s:if test="tblPlan.planTime==10">selected="selected"</s:if>>10工时</option>
        </select><samp></samp>
        </span>
      </li>
       <li>
        <span><i>开始时间</i><samp>:</samp>
        <input  id="startTime5"  type="text"  name="tblPlan.planStartTime" value="${tblPlan.planStartTime }"/><samp></samp>
        </span>
        <span><i>结束时间</i><samp>:</samp>
        <input  id="endTime5"  type="text"  name="tblPlan.planEndTime" value="${tblPlan.planEndTime  }"/><samp></samp>
        </span>
      </li>
      <li>
      	 <span><i>实际开始</i><samp>:</samp>
        <input  id="startTime4"  type="text"  name="tblPlan.planRealStartTime" value="${tblPlan.planRealStartTime }"/><samp></samp>
        </span>
        <span><i>实际结束</i><samp>:</samp>
        <input  id="endTime4"  type="text"  name="tblPlan.planRealEndTime" value="${tblPlan.planRealEndTime }"/><samp></samp>
        </span>	
      </li>
      <li>
      	<span>
      		<i>备注</i><samp>:</samp>
      		<textarea  type="text" name="tblPlan.planRemarks" ><s:property value="tblPlan.planRemarks"/></textarea>
        <label class="require_lab"></label>
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
