<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<link rel="shortcut icon" type="image/ico" href="/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<jsp:include page="/common/sys_common.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>
<script src="<%=basePath %>/js/bg.js" type="text/javascript"></script>
<script type="text/javascript">
//name 是html表单专用于区别各组 chechbox 的属性， 不要用id(必须唯一)或者其它属性
function getValues() {
    var aV = getCheckboxValues("a");
    var bV = getCheckboxValues("b");

    var result = "a组选中值: " + (aV=="" ? "未选中任何值" : aV) + "\n" +
        "b组选中值: " + (bV == "" ? "未选中任何值" : bV);

    alert(result);
}

function getCheckboxValues(name) {
    return $(":checkbox[name="+name+"]:checked").map(function(){  
        return $(this).val(); 
    }).get().join(",");
}

function chkAll(obj) {
    var name = $(obj).attr("name");
    //也许你觉得我写得太复杂， 但jquery 版本众多， 可以学点东西总是好的
    //1. jquery 1.6 以上
    //$(":checkbox[name=" + name.substring(0, 1) + "]").prop("checked", $(obj).prop("checked"));
    //2. jquery 1.6 以下
    //$(":checkbox[name=" + name.substring(0, 1) + "]").attr("checked", $(obj).attr("checked"));
    //3. 通用写法
    $(":checkbox[name=" + name.substring(0, 1) + "]").each(function () {
        this.checked = obj.checked;
    });
}	
</script>

<!-- 第一步：只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
<script src="<%=basePath %>/js/project/projectPerson.js?v1.0.5"></script>

<form id="searchForm">
   <input type="hidden" name="pageNow" id="pageNow" value="<s:property value="pageList.pageNow"/>"/>
   <input type="hidden" id="actionUrl" value="<%=basePath %>/project/project_projectList.action"/>
	 <div class="main_top">
	     <!-- 第二步：写自己查询需要的数据  需要提交的查询表单数据 start -->
	      <div class="con_top">
		 <a class="toggle"><i class="iconfont icon-212102"></i></a>
	      </div>
	</div> 
</form>  
	<h5>项目组成员列表</h5>
	<div class="con_btn">
		<input  type="hidden"  name="tblProject.projectId" value="${tblProject.projectId }"/>
         <a id="deleteFromPrj" onclick="doDelete('<s:property value='tblProject.projectId'/>')">移出项目</a>
         <a id="goback" >返回</a>
         </div>
     <div class="con_disc">
        <table border="1" bordercolor="#ccc">
        
        	<tr>
            	<th><input type="checkbox" name="aAll" onclick="chkAll(this)"  ></th>
            	<th>姓名</th>
            	<td>头像</td>
            	<th>电话号码</th>
            	<th>性别</th>
          </tr>
           <s:iterator value="project_userList" >
          
          <tr>
           
            <td><input type="checkbox" name="a" value="<s:property value="userId"/>"></td>
            <td align="center"><s:property value="name"/></td>
            <td> 
		      <s:if test='image!=null && image!=""'>
		      <img id="showImg" src="<%=basePath %><s:property value='image'/>" width="50px" height="50px">
		      </s:if>
		      <s:else>暂无图片</s:else>
		    </td>
            <td align="center"><s:property value="mobile"/></td>
            <td align="center"><s:if test="sex==0" >男</s:if><s:elseif test="sex==1">女</s:elseif><s:else></s:else></td>
         </tr>
         </s:iterator>
        </table> 
     </div>
      <div class="con_btn">
   <!--  第四步：   自定义操作按钮 start -->
      <h5>公司员工列表</h5>
      <a id="addPerson"  onclick="addProjectPerson('<s:property value="tblProject.projectId"/>')">添加成员</a>
     <!--     自定义操作按钮 end -->  
      
      </div>
	 <div class="con_disc">
        <table border="1" bordercolor="#ccc">
        <tr>
            	<th><input type="checkbox" name="bAll" onclick="chkAll(this)"  ></th>
            	<th>姓名</th>
            	<td>头像</td>
            	<th>电话号码</th>
            	<th>性别</th>
          </tr>
         <s:iterator value="userList" status="s">
          <tr>
           <td><input type="checkbox" name="b" value="<s:property value="userId"/>"/></td><td><s:property value="name"/></td>
           <td> 
		      <s:if test='image!=null && image!=""'>
		      <img id="showImg" src="<%=basePath %><s:property value='image'/>" width="50px" height="50px">
		      </s:if>
		      <s:else>暂无图片</s:else>
		      </td>
           <td><s:property value="mobile"/></td>
           <td align="center"><s:if test="sex==0" >男</s:if><s:elseif test="sex==1">女</s:elseif><s:else></s:else></td>
         </tr>
          </s:iterator>
          <!--   展示数据 end -->
          
          
        </table>
      </div>
    
<!--<jsp:include page="/common/page.jsp"></jsp:include>-->
<%-- <script type="text/javascript" src="<%=basePath %>/js/css-control.js"></script>--%>
<script src="<%=basePath %>common/comm.js" type="text/javascript"></script> 