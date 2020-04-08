<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("USER")==null){
	response.sendRedirect(basePath + "user/user_loginUI.action");
}
%>   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>时间堆</title>
<link rel="shortcut icon" type="image/ico" href="/favicon.ico">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<jsp:include page="/common/sys_common.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>
<script src="<%=basePath %>js/bg.js" type="text/javascript"></script>

<script type="text/javascript">
 function loadNewPage(actionName){
	 addCover2();
	 $("#mainDiv").load(actionName, function(responseText, textStatus, jqXHR){
		    // responseText 是响应(返回)的原始文本数据
		    // textStatus 可能是 "success"、 "notmodified"、 "error"、 "timeout"、 "abort"或"parsererror"中的一个
		    // jqXHR 是经过jQuery封装的XMLHttpRequest对象(保留其本身的所有属性和方法)
		    if(textStatus == "success" || textStatus == "notmodified"){
		    	try 
		    	{ 
		    		var data= JSON.parse(responseText);
					 if(!data.resultFlag&&data.resultCode=="NOTLOGIN"){
						 reloadWindowUrl();
					 }
		    	} 
		    	catch (e) 
		    	{ 
		    	} 
		    	removeCover2();
		    }
		});
 }
 
 function changeHead(name){
	 $(".head_sp2").html(name);
 }
 
	
 $(window).keydown(function(event){
	   switch(event.keyCode) {
	   case 13:
		   if($('.search_btn')){
		   $('.search_btn').click();
	  }
	}
});

 
 var t = null;
 t = setTimeout(time,1000);//开始执行
 function time()
 {
   // clearTimeout(t);//清除定时器
    dt = new Date();
    var h=getFormat(dt.getHours());
    var m=getFormat(dt.getMinutes());
    var s=getFormat(dt.getSeconds());
    var y=dt.getFullYear();
    var d=getFormat(dt.getDate());
    var month=getFormat(dt.getMonth()+1);
    $("#dateSpan").html(y+"-"+month+"-"+d);
    $("#timeSpan").html(h+":"+m+":"+s);
    console.log(1);
    t = setTimeout(time,1000); //设定定时器，循环执行             
 } 
 
 function getFormat(num){
	 if(num<10){
		 return "0"+num;
	 }
	 return num;
 }
 
 $(function(){
	 $("#loginOut").click(function(){
	    	
	    	// 询问框
			layer.confirm('确定退出？', {
				btn : [ '确定', '取消' ]
			// 按钮
			}, function() {
				window.location.href="user/user_loginOut.action";
			});
	    	
	    });
	 $("#changePassword").click(function(){
		 var url="user/user_changePwdUI.action";
		 var title="修改密码";
		 var index= layer.open({
			  type: 2,
			  area: ['500px', '400px'],//弹出层宽高
			  title: [title, 'font-size:16px;'],
			  fix: false, //不固定
			  maxmin: true,
			  content: url//加载页面
		  });
	    });
	 
	if($("#simplePwd").val()=='true'){
		editUserInfo();
	}
	 
	if($("#mianDiv").val() == null ){
		$("#home").click();
		loadNewPage("notice/notice_toHome.action");
	}
 }); 
 
 //编辑个人信息
 function editUserInfo(){
	 var url="user/user_editUserInfo.action";
	 var title="编辑个人信息";
	 //iframe层-父子操作
	 $.ajax({
			type: "POST",
			url: "user/json_user_loginCheck.action",
			data: {},
			dataType:"json",
			success: function(data){
				if(!data.resultFlag){
					//未登录
					reloadWindowUrl();
					
				}else{
					 //iframe层-父子操作
					 var index= layer.open({
						  type: 2,
						  area: ['800px', '600px'],//弹出层宽高
						  title: [title, 'font-size:16px;'],
						  fix: false, //不固定
						  maxmin: true,
						  content: url//加载页面
					  });
					return index;
				}
			}
		});
			
 }
 
 
 /**
  * 添加遮罩
  */
 function addCover2(){
 	var o = document.body;
 	var div = document.createElement("div");
 	var p = document.createElement("p");
 	var img = document.createElement("img");
 	div.setAttribute("class","edit_cover");
 	div.setAttribute("id","edit_cover");
 	img.setAttribute("src","images/loading.gif");
 	p.appendChild(img);
 	div.appendChild(p);
 	o.appendChild(div);
 }

 /**
  * 隐藏遮罩
  */
 function removeCover2(){
   var o = document.body;
   var div = document.getElementById("edit_cover");
   o.removeChild(div);
 }
 

</script>
</head>


<body>

 
  <header class="font0">
    <span class="head_sp1"></span>
    <span class="head_sp2">工作日志平台</span>
    <span class="head_sp3"><span id="dateSpan"></span><br><span id="timeSpan"></span><span id="xian" ></span><a id="changePassword">修改密码</a><a id="loginOut">退出</a></span>
    
  </header>
  
  <aside>
    <div class="per_info">
      <!-- <div class="tr"><a href="javaScript:editUserInfo()">个人信息</a>&#124<a id="changePassword">修改密码</a>&#124<a id="loginOut">退出</a></div> -->
      <a href="javaScript:editUserInfo()"><div class="photo">
       	  <s:if test='#session.USER.image!=null&&#session.USER.image!=""'>
	         <img src="<s:property value='#session.USER.image'/>">
         </s:if> 
         <s:else>           
            <img src="images/photo.jpg">
         </s:else>
      </div></a>
      <div class="name">
  		  <s:if test='#session.USER.name!=null&&#session.USER.name!=""'>
	    		<s:property value='#session.USER.name'/>
         </s:if>
       </div>
    </div>
    <ul class="menu">
    		<li ><a id="home" href="javaScript:loadNewPage('<%=basePath %>notice/notice_toHome.action');" onclick="changeHead('主页')" ><img src="images/iconfont-gongsi.png">主页</a></li>
    		<pb:pri privilege="show" module="company"><li><a href="javaScript:loadNewPage('<%=basePath %>company/company_companyList.action');" onclick="changeHead('公司管理')" ><img src="images/company.png">公司管理</a></li></pb:pri>
    		<pb:pri privilege="show" module="dept"><li><a href="javaScript:loadNewPage('<%=basePath %>dept/dept_listUI.action');" onclick="changeHead('部门管理')" ><img src="images/iconfont-guanlibumen.png">部门管理</a></li></pb:pri>
    		<pb:pri privilege="show" module="user"><li><a href="javaScript:loadNewPage('<%=basePath %>user/user_listUI.action');" onclick="changeHead('用户管理')" ><img src="images/iconfont-yonghuguanli.png">用户管理</a></li></pb:pri>
			<pb:pri privilege="show" module="project"><li><a href="javaScript:loadNewPage('<%=basePath %>project/project_projectList.action');" onclick="changeHead('项目管理')" ><img src="images/iconfont-xiangmuguanli.png">项目管理</a></li></pb:pri>
			<pb:pri privilege="show" module="task"><li><a href="javaScript:loadNewPage('<%=basePath %>task/task_taskList.action');" onclick="changeHead('任务管理')" ><img src="images/iconfont-c-userlog.png" >任务管理</a></li></pb:pri>
			<pb:pri privilege="show" module="role"><li><a href="javaScript:loadNewPage('<%=basePath %>role/role_listUI.action');" onclick="changeHead('角色管理')" ><img src="images/iconfont-jiaoseshezhi.png">角色管理</a></li></pb:pri>
			<pb:pri privilege="show" module="reportwarn"> <li><a href="javaScript:loadNewPage('<%=basePath %>reportwarn/reportwarn_reportwarnList.action');" onclick="changeHead('提醒报告')" ><img src="images/reportwarn.png">提醒报告</a></li></pb:pri>
			<pb:pri privilege="show" module="notice"><li><a href="javaScript:loadNewPage('<%=basePath %>notice/notice_listUI.action');" onclick="changeHead('公告管理')" ><img src="images/iconfont-gonggaoguanli.png">公告管理</a></li></pb:pri>
			<pb:pri privilege="show" module="log"><li><a href="javaScript:loadNewPage('<%=basePath %>log/log_logList.action');" onclick="changeHead('个人日志')" ><img src="images/iconfont-caozuorizhi.png">个人日志</a></li></pb:pri>
			<pb:pri privilege="show" module="privilege"><li><a href="javaScript:loadNewPage('<%=basePath %>privilege/privilege_listUI.action');" onclick="changeHead('权限管理')" >权限管理</a></li> </pb:pri>
			<pb:pri privilege="show" module="changelog"><li><a href="javaScript:loadNewPage('<%=basePath %>changelog/changelog_listUI.action');" onclick="changeHead('操作日志')" ><img src="images/changelog.png">操作日志</a></li></pb:pri>
			<li><a href="javaScript:loadNewPage('<%=basePath %>tease/tease_listUI.action');" onclick="changeHead('我要吐槽')" ><img src="images/tease.png">我要吐槽</a></li>
    </ul>
   
  </aside>
  
  <a class="flex_menu"><i class="iconfont icon-jiantouzuo"></i></a>
<!--   右部数据展示部分 start -->
<div class="main" id="mainDiv">

</div>

 <!--   右部数据展示部分 end --> 

</body>

</html>