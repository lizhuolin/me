<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
  <%@ taglib prefix="pb" uri="http://http://www.poobo.com//tags/privilege-1.0" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
 

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/plan/planList4Child.js?v1.0.5"></script>
<link rel="shortcut icon" type="image/ico" href="/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>">
   <input type="hidden" id="actionUrl" value="<%=basePath %>/plan/plan_planList4Child.action">
   <script type="text/javascript" src="${basePath}js/jquery/jquery-1.10.2.min.js"></script>
    <link href="${basePath}css/skin1.css" rel="stylesheet" type="text/css" />
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
	        <div class="con_search">

	        	<span><input  type="hidden" name="tblProjectChild.projectChildRealId" value="${tblProjectChild.projectChildRealId }"/></span>
	          <span>名称：<s:textfield type="text" name="tblPlan.planName"/></span>
	         <!--<span>计划负责人：<input type="text" name="tblPlan.planManager.name"/></span>-->
			<input id="hiddenText" type="text" style="display:none" />
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
      <a  href="<%=basePath %>plan/plan_exportExcel4ProjectChild.action?tblProjectChild.projectChildRealId=<s:property value="tblProjectChild.projectChildRealId"/>">导出</a>
      		<a id="edit">编辑</a>
           <a id="delete">删除</a>
           <a id="goback" onclick="gobackPage('<s:property value='tblProject.projectId'/>')">返回</a>
     	   <!--<a id="goback">返回</a>  -->
      
     <!--     自定义操作按钮 end -->  
      
      </div>

      <div class="con_disc">
        <table border="1" bordercolor="#ccc">
         
         
          <!--  第五步： 展示数据 start -->
          
          
          <tr>
          	<th><input type="checkbox" class="autoChecked" id="checkedAll"></th>
            <th>名称</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>实际开始</th>
            <th>实际结束</th>
            <th>计划目标</th>
            <th>计划进度</th>
            <th>计划状态</th>
            <th>计划等级</th>
            <th>计划内容</th>
            <th>计划工时</th>
            <th>备注</th>
            <th>负责人</th>
            <th>创建人</th>
            <th>操作</th>
          </tr>
          
         <s:iterator value="pageList.dataList" >
          
          <tr>
          	<s:if test='projectProgress=="100"'><th></th></s:if>
            <s:else><td><input type="checkbox" class="autoChecked" value="<s:property value="planId"/>"></td></s:else>
            <td align="center"><s:property value="planName"/></td>
           <td align="center"><s:date name="planStartTime" format="yyyy-MM-dd "/></td>
           <td align="center"><s:date name="planEndTime" format="yyyy-MM-dd "/></td>
           <td align="center"><s:date name="planRealStartTime" format="yyyy-MM-dd "/></td>
           <td align="center"><s:date name="planRealEndTime" format="yyyy-MM-dd "/></td>
           <td align="center"><s:property value="planTarget"/></td>
           <td align="center"><s:property value="projectProgress"/>%</td>
           <td align="center"><s:if test="planStatus==0" >未开始</s:if><s:elseif test="planStatus==1">进行中</s:elseif><s:else>已结束</s:else></td>
           <td align="center"><s:if test="planClass==0" >低</s:if><s:elseif test="planClass==1">一般</s:elseif><s:else>高</s:else></td>
           <td align="center"><s:property value="planMsg"/></td>
           <td align="center"><s:property value="planTime"/></td>
           <td align="center"><s:property value="planRemarks"/></td>
           <td align="center"><s:property value="planManager.name"/></td>
           <td align="center"><s:property value="planCreater.name"/></td>
                                <td align="center">
                                    
                                </td>
          </tr>
        
          
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
</div>
    
<jsp:include page="/common/page.jsp"></jsp:include>
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 