<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String aPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%-- <script src="<%=aPath %>/js/jquery/jquery-1.8.3.min.js"></script> --%>
<script src="<%=aPath %>js/layer/layer.js"></script>
<script type="text/javascript">

	function noPrivilege(){
		layer.msg("您没有该权限！");
	}
$(function($){
var url = window.location.href;
if(url.indexOf("notice")>-1 || url.indexOf("remind")>-1){
	$(".message>a:first").attr("class","select");
}
if(url.indexOf("project")>-1){
	$(".project>a:first").attr("class","select");
}
if(url.indexOf("log")>-1){
	$(".log>a:first").attr("class","select");
}
if(url.indexOf("task")>-1){
	$(".task>a:first").attr("class","select");
}
 if(url.indexOf("user")>-1){
	$(".user>a:first").attr("class","select");
} 
});
</script>

        <div id="footer_wrapper">
    	<footer>
  			<div class="message"><a href="<%=aPath%>mobile/notice/mobile_noticeList.action">消息</a></div>
  			<div class="project">
  				<a href="<%=aPath%>mobile/project/mobile_projectList4mobile.action">项目</a>
  				<a href="javascript:noPrivilege()">项目</a>
  			</div>
  			
  			<div class="log">
  			 <pb:pri privilege="show" module="log"><a href="<%=aPath%>mobile/log/mobile_log.action">日志</a></pb:pri>
  			<a href="javascript:noPrivilege()">日志</a>
  			</div>
  			<div class="task">
	  		<pb:pri privilege="show" module="task">	<a href="<%=aPath%>mobile/task/mobile_taskList4Mobile.action">任务</a></pb:pri>
	  			<a href="javascript:noPrivilege()">任务</a>
  			</div>
  			<div class="user">
  				<a href="<%=aPath%>mobile/user/mobile_userList.action">个人</a>
  			</div>
  			<div class="clear"></div>
		</footer>

    </div><!--footer_wrapper结束-->
    
