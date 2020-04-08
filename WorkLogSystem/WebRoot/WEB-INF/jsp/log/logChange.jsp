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
<script src="<%=basePath %>/js/log/changeLog.js?v1.0.3"></script>
<script type="text/javascript">
function ajaxFileUpload() {
    $.ajaxFileUpload({
            url:rooPath + '/fileoperate/fileoperate_fileUpload.action',//用于文件上传的服务器端请求地址
            secureuri:false,//一般设置为false
            fileElementId:'logUpload',//文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType: 'json',//返回值类型 一般设置为json
            data : {"childPath" : "log"},
            success: function (data, status){  //服务器成功响应处理函数
             if (typeof(data.error) != 'undefined') {
                     if (data.error != '') {
                    	 opFail(data.error);
                     } else {
                $("#headImg").val(data.logUploadPath);
            	$("#showImg").append("<div class='uploadFile'><img  src='"+rooPath + '/' + data.logUploadPath + "'/><a ><img class='delateImg' src="+rooPath+"/images/delate.png></a></div>");
            	$(".uploadFile>a").click(function(){
            		$(this).parent('.uploadFile').remove();
                });
             	opSuccess(data.message);
                     }
                 }
             	
            },
            error: function (data, status, e){//服务器响应失败处理函数
            	opFail(data.message);
            }
        });
    return false;
}
$(".uploadFile>a").click(function(){
	$(this).parent('.uploadFile').remove();
});
</script>
</head>
<body>
  <form id="editForm">
  <div class="edit">
    <ul>
   		<li>
			<s:hidden name="tblLog.logId"/>
    		<s:hidden name="tblLog.logTime"/>
    		<s:hidden name="tblLog.createTime"/>
    		<s:hidden name="tblLog.tblUser.userId"/>
    		<s:hidden name="tblLog.tblCompany.companyId"/>
    		<s:hidden name="tblLog.dataStatus"/>
    		<s:hidden name="tblLog.comTime"/>
        	<span><i>日志时间</i><samp>:</samp>
        	<input type="text" name="tblLog.logTime" value="${tblLog.logTime }" readonly="readonly"/>
        	</span>
       	</li>
       	<s:iterator var="logdetail" value="logDetailList" status="s">
       	<!--<s:iterator value="logdetail">-->
             <s:if test="null != tblProject">
             <li>
               	<span><i>项目</i><samp>:</samp>
				<input type="text" name="tblProject.projectName" value="${tblProject.projectName }" readonly="readonly"/>
				<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
				<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblProject.projectId" value="${logdetail.tblProject.projectId }"/>
				</span>
            	<span><i>工时</i><samp>:</samp>
            		<select name="logDetailList[<s:property value="#s.index"/>].logTime" >
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
                  <s:elseif test="null != tblTask">
                  <li>
                 <span><i>任务</i><samp>:</samp>
                 <input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblTask.taskId" value="${logdetail.tblTask.taskId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
				<s:property value="tblTask.taskMsg"/>
				</span>
				<span><i>工时</i><samp>:</samp>
					 <select name="logDetailList[<s:property value="#s.index"/>].logTime" >
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
                 <span><i>其它</i><samp>:</samp>
                 <input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             	 <input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
				</span>
				<span><i>工时</i><samp>:</samp>
					 <select name="logDetailList[<s:property value="#s.index"/>].logTime" >
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
				<!--</s:iterator>-->
				</s:iterator>
       			
			<li >
        		<span><i>日志内容</i><samp>:</samp>
        		<p><textarea id="logMsg"  type="text" name="tblLog.logMsg" ><s:property value="tblLog.logMsg"/></textarea></p>
        		
      			</span></li>
      		<li >
      			<span><i>文件</i><samp>:</samp>
	            <a class="logUpload_btn"><img id="add" src="<%=basePath %>images/adding.png"></a>
		        <input type="file" class="logUpload" name="logUpload" id="logUpload" onchange="ajaxFileUpload()"/>
	            <img src="<%=basePath %>images/loading.gif" id="loading" style="display: none;">
	           <input type="hidden" id="headImg" name="tblLog.logPicture"  value="<s:property value='tblLog.logPicture'/>"/>    
	   			 </span>  </li>
	    	<li id="showImg">
	    	<!-- <img/><a href=""></a> -->
	    	<s:if test='tblLog.logPicture!=null && tblLog.logPicture!=""'>
	    		<div class="uploadFile">
	    		<img id="showImg" src="<%=basePath %><s:property value='tblLog.logPicture'/>" width="50px" height="50px">
	    		<a ><img class="delateImg" src="<%=basePath %>images/delate.png"></a></div>
	    	</s:if>
            <s:else>暂无图片</s:else>
	    	</li>
    	</ul>
  	</div>
</form>

<div class="edit_btn"><a id="edit" >保存</a><a id="close" class="btn_cancel" >取消</a></div>
  
 <!-- 保存遮罩层-->
  <!--<div class="edit_cover"><p><img src="images/loading.gif"></p></div>-->

</body>
</html>
