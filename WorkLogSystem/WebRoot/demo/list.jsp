<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
<div class="content">
      <div class="con_btn">
   
      <button id="out">导出</button>
      <button id="edit">编辑</button>
     
      
     
      
      </div>
 <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
          <tr>
            <th><input type="checkbox" ></th>
            <th>ID</th>
            <th>姓名</th>
            <th>头像</th>
            <th>性别</th>
           <th >账号</th>
            <th>所属部门</th>
            <th>所属公司</th>
            <th>手机号</th>
            <th>电子邮箱</th>
            <th>备注</th>
          </tr>
          <tr>
            <td><input type="checkbox" ></td>
            <td>0</td>
            <td>张三</td>
            <td></td>
            <td>男</td>
            <td>001</td>
            <td>研发</td>
            <td>A</td>
            <td>110</td>
            <td>110@163.COM</td>
            <td></td>
          </tr>
          <tr>
            <td><input type="checkbox" ></td>
            <td>1</td>
            <td>李四</td>
            <td></td>
            <td>男</td>
            <td>002</td>
            <td>销售</td>
            <td>A</td>
            <td>112</td>
            <td>112@163.COM</td>
            <td></td>
          </tr>
           <tr>
            <td><input type="checkbox" ></td>
            <td>2</td>
            <td>王五</td>
            <td></td>
            <td>男</td>
            <td>003</td>
            <td>财务</td>
            <td>A</td>
            <td>119</td>
            <td>119@163.COM</td>
            <td></td>
          </tr>
          
        </table>
      </div>
      </div>
      
</body>
 
</html>
