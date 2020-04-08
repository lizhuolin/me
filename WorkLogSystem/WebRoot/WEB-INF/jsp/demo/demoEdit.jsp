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
<script src="<%=basePath %>js/demo/edit.js"></script>  
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
     <li>
        <span><i>姓名</i><samp>:</samp>
        <input  type="text" name="demo.name" value="${demo.name }"/><samp></samp>
          <div class="d_list"></div>
        </span>
      </li>
       <%--
          <li>
        <span><i>年龄</i><samp>:</samp>
        <input  type="text"  /><samp></samp>
          <div class="d_list"></div>s
        </span>
      </li>
   
     <li>
        <span><i>订单属性</i><samp>:</samp>
        <input class="red_border" type="text" readonly /><samp>(单位：kb)</samp><label class="error">请输入内容</label>
          <div class="d_list"></div>
        </span>
        <span><i>订单类型</i><samp>:</samp><select><option>请选择</option></select></span>
      </li>
        
      <li>
        <span><i>订单属性</i><samp>:</samp>
          <span class="prop_sp">
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单属性</em>
            <em><input type="checkbox" />订单属性</em>
            <em><input type="checkbox" />订单属性</em>
          </span>
        </span>
        <span><i>订单类型</i><samp>:</samp>
          <span class="prop_sp">
            <em><input type="radio" />订单</em>
            <em><input type="radio" />订单</em>
            <em><input type="radio" />订单属性</em>
            <em><input type="radio" />订单属性</em>
          </span>
      </li>
      <li>
        <span><i>订单新属性</i><samp>:</samp><a class="upload_btn">选择文件</a>
          <input type="file" />
          <div class="files">
            <input class="file_name" value="租赁平台测试问题_A1.0_20160105">
            <a class="file_del"></a>
          </div>
        </span>
        <span class="spec_item"><i>订单类</i><samp>:</samp><input type="password" /><label>hahaha</label></span>
      </li>
      <li>
        <span><i>订单属性</i><samp>:</samp>
        <textarea></textarea><label class="require_lab"></label>
        </span>
        <span><i>订单属性</i><samp>:</samp>
          <input class="spec_input" type="checkbox" />
          
            <input class="middle" type="text" /><label class="require_lab"></label>
          
        </span>
      </li>
      
      <li>
        <span class="in_line"><i>角色管理</i><samp>:</samp> 
          <span>
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单</em>
            <em><input type="checkbox" />订单属性</em>
          </span>
         </span>
      </li>
     
      <li>
        <span><i>请选择</i><samp>:</samp><a class="upload_btn">浏览<input type="file" /></a><a class="upload_btn">预览</a>
          
        </span>
        
      </li>
      <li>
        <span><i>订单属性</i><samp>:</samp><div class="d_list1"><span class="tree_icon_dept"></span><span class="tree_icon_emp"></span></div></span>
      </li>
        --%>
    </ul>
  </div>
</form>


  <div class="edit_btn"><a id="edit">保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
