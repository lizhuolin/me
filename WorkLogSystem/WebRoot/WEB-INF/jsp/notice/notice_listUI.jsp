<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 
<script src="<%=basePath %>js/jquery.museum.js"></script>
<script>
$(document).ready(function(){
	$.museum($('.con_disc img'));
});
</script>
<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/notice/notice.js"></script>

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/notice/notice_listUI.action">
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">
	         <span>公告标题：<s:textfield name="notice.noticeTitle"/></span>
	          <input id="hiddenText" type="text" style="display:none" /><%--防止enter刷新当前页面 --%>
	         
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
      <!-- <a id="out">导出</a> -->
      <pb:pri privilege="add" module="notice">
		  <a id="add">新增</a> 
		</pb:pri>
		<pb:pri privilege="edit" module="notice">
		  <a id="edit">编辑</a>
		</pb:pri>
		<pb:pri privilege="delete" module="notice">
		 <a id="delete">删除</a>
		</pb:pri>
      
      
      
     
      
      
     <!--     自定义操作按钮 end -->  
      
      </div>

      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
            <th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
            <th>用户名称</th>
            <s:if test="#session.USER.isUserPlatform">
            <th>公司名称</th>
            </s:if>
             <th>公告标题</th>
            <th>公告创建时间</th>
           
            <th>公告备注</th>
            <th>推送开始时间</th>
            <th>推送结束时间</th>
            <th>公告创建人</th>
            <th>公告图片</th>
          </tr>
          
        
          
          <s:iterator value="pageList.dataList" >
          <s:if test="dataStatus==1">
          <tr>
            <th class="checkedOne"><input type="checkbox" class="autoChecked" value="<s:property value="noticeId"/>"></th>
            <td><s:property value="tblUser.name"/></td>
             <s:if test="#session.USER.isUserPlatform">
            <td><s:property value="tblCompany.companyName"/></td>
            </s:if>
             <td><s:property value="noticeTitle"/></td>
            <td><s:date name="noticeCreatetime" format="yyyy-MM-dd"/></td>
            
           <td><s:property value="noticeIntroduction"/></td>
            <%-- <td><s:property value="noticeMsg" escape="false"/></td> --%>
            
            
            <td><s:date name="noticeStartTime" /></td>
            <td><s:date name="noticeEndTime" /></td>
            <td><s:property value="noticeCreaterId"/></td>
            <td>
            <s:if test='image!=null && image!=""'>
            <img id="showImg" src="<%=basePath %><s:property value='image'/>" width="50px" height="50px">
            </s:if>
		    <s:else>暂无图片</s:else>
            </td>
          </tr>
          </s:if>
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 