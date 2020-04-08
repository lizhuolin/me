<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/demo/demo.js"></script>


<form id="searchForm">
  <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/demo/demo_demoList.action"> 
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	          <span>条件1：<input type="text" name=""></span>
	         
	        </div>
	        <!--  需要提交的查询表单数据 end -->
	        
	        <div class="search_btn" onclick="searchForm();"><a class="fr">查询</a></div>
		 <a class="toggle"><i class="iconfont icon-212102"></i></a>
	      </div>
	</div> 
</form>  
     
<div class="content">
      <div class="con_btn">
   <!--  第四步：   自定义操作按钮 start -->
      <a id="add">新建</a>
      <a id="edit">编辑</a>
      <a id="ask">询问弹出</a>
      <a id="success">成功提示</a>
      <a id="fail">失败提示</a>
      <a id="normalAlert">普通提示</a>
      
      
     <!--     自定义操作按钮 end -->  
      
      </div>

      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
              <th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
           
            <th>名字</th>
           
          </tr>
          
          <s:iterator value="pageList.dataList">
          <tr class="checkedOne">
       	 <td><input type="checkbox" class="autoChecked"
						value="<s:property value='id' />"></td>
            <td><s:property value="name"/></td>
            </tr>
         </s:iterator>
          <!--   展示数据 end -->
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 