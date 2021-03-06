<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<html> 
<head>
<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<jsp:include page="/common/common.jsp"></jsp:include>
<script src="<%=basePath %>common/ajaxfileupload.js"></script>
<script src="<%=basePath %>/js/log/edit.js?v1.0.3"></script>
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
      	<s:iterator value="logDetailList" status="s">
      	<s:if test="null != tblProject">
			<li>
				<span><i>项目名称</i><samp>:</samp>
					<input  type="text" value="<s:property value='tblProject.projectName'/>" readonly/>
				</span>
				<span><i>项目工时</i><samp>:</samp>
					<select name="logTime" readOnly >
					<option value="0" <s:if test="logTime==0">selected="selected"</s:if>>0工时</option>
        			<option value="1"<s:if test="logTime==1">selected="selected"</s:if>>1工时</option>
        			<option value="2"<s:if test="logTime==2">selected="selected"</s:if>>2工时</option>
        			<option value="3"<s:if test="logTime==3">selected="selected"</s:if>>3工时</option>
        			<option value="4"<s:if test="logTime==4">selected="selected"</s:if>>4工时</option>
        			<option value="5"<s:if test="logTime==5">selected="selected"</s:if>>5工时</option>
        			<option value="6"<s:if test="logTime==6">selected="selected"</s:if>>6工时</option>
        			<option value="7"<s:if test="logTime==7">selected="selected"</s:if>>7工时</option>
        			<option value="8"<s:if test="logTime==8">selected="selected"</s:if>>8工时</option>
        			<option value="9"<s:if test="logTime==9">selected="selected"</s:if>>9工时</option>
        			<option value="10"<s:if test="logTime==10">selected="selected"</s:if>>10工时</option>
        			<option value="11"<s:if test="logTime==11">selected="selected"</s:if>>11工时</option>
        			<option value="12"<s:if test="logTime==12">selected="selected"</s:if>>12工时</option>
        			<option value="13"<s:if test="logTime==13">selected="selected"</s:if>>13工时</option>
        			<option value="14"<s:if test="logTime==14">selected="selected"</s:if>>14工时</option>
        			<option value="15"<s:if test="logTime==15">selected="selected"</s:if>>15工时</option>
        			<option value="16"<s:if test="logTime==16">selected="selected"</s:if>>16工时</option>
        			<option value="17"<s:if test="logTime==17">selected="selected"</s:if>>17工时</option>
        			<option value="18"<s:if test="logTime==18">selected="selected"</s:if>>18工时</option>
        			<option value="19"<s:if test="logTime==19">selected="selected"</s:if>>19工时</option>
        			<option value="20"<s:if test="logTime==20">selected="selected"</s:if>>20工时</option>
        			<option value="21"<s:if test="logTime==21">selected="selected"</s:if>>21工时</option>
        			<option value="22"<s:if test="logTime==22">selected="selected"</s:if>>22工时</option>
        			<option value="23"<s:if test="logTime==23">selected="selected"</s:if>>23工时</option>
        			<option value="24"<s:if test="logTime==24">selected="selected"</s:if>>24工时</option>
					</select>
				</span>
			</li>
			</s:if>
			<s:elseif test="tblTask!=null">
			<li>
				<span><i>任务名称</i><samp>:</samp>
				<input  type="text" value="<s:property value='tblTask.taskMsg'/>" readonly/>	
				</span>
				<span><i>任务工时</i><samp>:</samp>
					<select name="logTime" >
					<option value="0" <s:if test="logTime==0">selected="selected"</s:if>>0工时</option>
        			<option value="1"<s:if test="logTime==1">selected="selected"</s:if>>1工时</option>
        			<option value="2"<s:if test="logTime==2">selected="selected"</s:if>>2工时</option>
        			<option value="3"<s:if test="logTime==3">selected="selected"</s:if>>3工时</option>
        			<option value="4"<s:if test="logTime==4">selected="selected"</s:if>>4工时</option>
        			<option value="5"<s:if test="logTime==5">selected="selected"</s:if>>5工时</option>
        			<option value="6"<s:if test="logTime==6">selected="selected"</s:if>>6工时</option>
        			<option value="7"<s:if test="logTime==7">selected="selected"</s:if>>7工时</option>
        			<option value="8"<s:if test="logTime==8">selected="selected"</s:if>>8工时</option>
        			<option value="9"<s:if test="logTime==9">selected="selected"</s:if>>9工时</option>
        			<option value="10"<s:if test="logTime==10">selected="selected"</s:if>>10工时</option>
        			<option value="11"<s:if test="logTime==11">selected="selected"</s:if>>11工时</option>
        			<option value="12"<s:if test="logTime==12">selected="selected"</s:if>>12工时</option>
        			<option value="13"<s:if test="logTime==13">selected="selected"</s:if>>13工时</option>
        			<option value="14"<s:if test="logTime==14">selected="selected"</s:if>>14工时</option>
        			<option value="15"<s:if test="logTime==15">selected="selected"</s:if>>15工时</option>
        			<option value="16"<s:if test="logTime==16">selected="selected"</s:if>>16工时</option>
        			<option value="17"<s:if test="logTime==17">selected="selected"</s:if>>17工时</option>
        			<option value="18"<s:if test="logTime==18">selected="selected"</s:if>>18工时</option>
        			<option value="19"<s:if test="logTime==19">selected="selected"</s:if>>19工时</option>
        			<option value="20"<s:if test="logTime==20">selected="selected"</s:if>>20工时</option>
        			<option value="21"<s:if test="logTime==21">selected="selected"</s:if>>21工时</option>
        			<option value="22"<s:if test="logTime==22">selected="selected"</s:if>>22工时</option>
        			<option value="23"<s:if test="logTime==23">selected="selected"</s:if>>23工时</option>
        			<option value="24"<s:if test="logTime==24">selected="selected"</s:if>>24工时</option>
					</select>
				</span>
			</li>
			</s:elseif>
			<s:else>
				<li>
				<span><i>其他</i><samp>:</samp>	
				</span>
				<span><i>工时</i><samp>:</samp>
					<select name="logTime" >
					<option value="0" <s:if test="logTime==0">selected="selected"</s:if>>0工时</option>
        			<option value="1"<s:if test="logTime==1">selected="selected"</s:if>>1工时</option>
        			<option value="2"<s:if test="logTime==2">selected="selected"</s:if>>2工时</option>
        			<option value="3"<s:if test="logTime==3">selected="selected"</s:if>>3工时</option>
        			<option value="4"<s:if test="logTime==4">selected="selected"</s:if>>4工时</option>
        			<option value="5"<s:if test="logTime==5">selected="selected"</s:if>>5工时</option>
        			<option value="6"<s:if test="logTime==6">selected="selected"</s:if>>6工时</option>
        			<option value="7"<s:if test="logTime==7">selected="selected"</s:if>>7工时</option>
        			<option value="8"<s:if test="logTime==8">selected="selected"</s:if>>8工时</option>
        			<option value="9"<s:if test="logTime==9">selected="selected"</s:if>>9工时</option>
        			<option value="10"<s:if test="logTime==10">selected="selected"</s:if>>10工时</option>
        			<option value="11"<s:if test="logTime==11">selected="selected"</s:if>>11工时</option>
        			<option value="12"<s:if test="logTime==12">selected="selected"</s:if>>12工时</option>
        			<option value="13"<s:if test="logTime==13">selected="selected"</s:if>>13工时</option>
        			<option value="14"<s:if test="logTime==14">selected="selected"</s:if>>14工时</option>
        			<option value="15"<s:if test="logTime==15">selected="selected"</s:if>>15工时</option>
        			<option value="16"<s:if test="logTime==16">selected="selected"</s:if>>16工时</option>
        			<option value="17"<s:if test="logTime==17">selected="selected"</s:if>>17工时</option>
        			<option value="18"<s:if test="logTime==18">selected="selected"</s:if>>18工时</option>
        			<option value="19"<s:if test="logTime==19">selected="selected"</s:if>>19工时</option>
        			<option value="20"<s:if test="logTime==20">selected="selected"</s:if>>20工时</option>
        			<option value="21"<s:if test="logTime==21">selected="selected"</s:if>>21工时</option>
        			<option value="22"<s:if test="logTime==22">selected="selected"</s:if>>22工时</option>
        			<option value="23"<s:if test="logTime==23">selected="selected"</s:if>>23工时</option>
        			<option value="24"<s:if test="logTime==24">selected="selected"</s:if>>24工时</option>
					</select>
				</span>
			</li>			
			</s:else>
		</s:iterator>
		<li >
        <span><i>日志内容</i><samp>:</samp>
        	<textarea id="logMsg"  type="text" name="tblLog.logMsg" readOnly><s:property value="tblLog.logMsg"/></textarea>      	
      </span></li>
      <li >	
      <span><i>日志附件</i><samp>:</samp></span>
      <div id="showFile"><img src="<s:property value='logPicture'/>"></div>  
	    </li>
    </ul>
  </div>
</form>


<div class="edit_btn"><a id="close" class="btn_cancel" >返回</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
