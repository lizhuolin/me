<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<script src="<%=basePath %>common/ajaxfileupload.js"></script>
 			<s:if test="tblLog==null">
        	<form id="form1" name="form" action="<%=basePath %>mobile/log/mobile_mobileEdit.action?date=<s:property value="date"/>" method="post" enctype="multipart/form-data">
             	<s:iterator value="projectList" status="s">
				 <div class="log_send">
               <p><span><input type="checkbox"/> 项目<samp>:</samp>
             		<!-- <input type="hidden" name="date" value="<s:property value="date"/>"/> -->
             		<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblProject.projectId" value="<s:property value='projectId'/>" /> 
					<s:property value='projectName'/>
					</span>
            		<span class="toRight">工时<samp>:</samp><select name="logDetailList[<s:property value="#s.index"/>].logTime" >
                    <option value="0" >0工时</option><option value="1">1工时</option>
            		<option value="2">2工时</option><option value="3">3工时</option>
            		<option value="4">4工时</option><option value="5">5工时</option>
            		<option value="6">6工时</option><option value="7">7工时</option>
            		<option value="8">8工时</option><option value="9">9工时</option>
            		<option value="10">10工时</option><option value="10">11工时</option>
            		<option value="10">12工时</option><option value="10">13工时</option>
            		<option value="10">14工时</option><option value="10">15工时</option>
            		<option value="10">16工时</option><option value="10">17工时</option>
            		<option value="10">18工时</option><option value="10">19工时</option>
            		<option value="10">20工时</option><option value="10">21工时</option>
            		<option value="10">22工时</option><option value="10">23工时</option>
            		<option value="10">24工时</option>
                    </select>
                   </span></p>
                 </div>
				 </s:iterator>
				 <s:iterator value="taskList" status="s">
                 <div class="log_send">

                 <p><span><input type="checkbox"/> 任务<samp>:</samp>
				<input type="hidden" name="tasklogDetailList[<s:property value="#s.index"/>].tblTask.taskId" value="<s:property value='taskId'/>" />
				<s:property value='taskMsg'/>
				</span>
				<span class="toRight"><i>任务工时</i><samp>:</samp>

					<select name="tasklogDetailList[<s:property value="#s.index"/>].logTime" >
					<option value="0" >0工时</option><option value="1">1工时</option>
            		<option value="2">2工时</option><option value="3">3工时</option>
            		<option value="4">4工时</option><option value="5">5工时</option>
            		<option value="6">6工时</option><option value="7">7工时</option>
            		<option value="8">8工时</option><option value="9">9工时</option>
            		<option value="10">10工时</option><option value="10">11工时</option>
            		<option value="10">12工时</option><option value="10">13工时</option>
            		<option value="10">14工时</option><option value="10">15工时</option>
            		<option value="10">16工时</option><option value="10">17工时</option>
            		<option value="10">18工时</option><option value="10">19工时</option>
            		<option value="10">20工时</option><option value="10">21工时</option>
            		<option value="10">22工时</option><option value="10">23工时</option>
            		<option value="10">24工时</option>
					</select>
				</span></p>
                 </div>
                 
				</s:iterator>
				<div class="log_send">
                 	<span><p><input type="checkbox"/> 其他<samp>:</samp>
                 	</span>
					<span class="toRight">工时<samp>:</samp>
                 	<select name="logDetail.logTime">
                 	<option value="0" >0工时</option><option value="1">1工时</option>
            		<option value="2">2工时</option><option value="3">3工时</option>
            		<option value="4">4工时</option><option value="5">5工时</option>
            		<option value="6">6工时</option><option value="7">7工时</option>
            		<option value="8">8工时</option><option value="9">9工时</option>
            		<option value="10">10工时</option><option value="10">11工时</option>
            		<option value="10">12工时</option><option value="10">13工时</option>
            		<option value="10">14工时</option><option value="10">15工时</option>
            		<option value="10">16工时</option><option value="10">17工时</option>
            		<option value="10">18工时</option><option value="10">19工时</option>
            		<option value="10">20工时</option><option value="10">21工时</option>
            		<option value="10">22工时</option><option value="10">23工时</option>
            		<option value="10">24工时</option>
                 	</select></p>
                 </div>
                  <div class="log_acc">
                 <p>日志附件：<a class="logFile">浏览<input type="file" name="image" id="image" onchange="ajaxFileUpload()" value="浏览"></a>
                 <input type="hidden" id="headImg" name="tblLog.logPicture" value="<s:property value='tblLog.logPicture'/>"></p>
                 <div id="showImg"></div>
                 <%-- <s:if test='tblLog.logPicture!=null&&tblLog.logPicture!=""'>
                 
	          		<img id="showImg" src="<%=basePath %><s:property value='tblLog.logPicture'/>" >
	         	</s:if><s:else> <img id="showImg"/></s:else>
	         	 <span id="showMsg"></span> --%>
                 
                 </div>
                 <div class="log_intro">
                 	<p><span>日志简介：</span></p><p><textarea type="text" name="tblLog.logMsg" rows="5" cols="30"></textarea></p>
		
                 </div>
                
                 <div class="log_upload">
                 <input type="button" value="上传" onclick="doSubmit('<s:property value="date"/>')">
                 </div>
            </form>
           </s:if>

           <s:else>
           <form id="form2" name="form" action="<%=basePath %>mobile/log/mobile_mobileEdit.action" method="post" enctype="multipart/form-data">
             	<!-- <input type="hidden" name="date" value="<s:property value="date"/>"/> -->
             	<s:iterator var="logdetail" value="logDetailList" status="s">
             	<!--<s:iterator value="logdetail">-->
             	
             	  <s:if test="null != tblProject">
				 <div class="log_send">
				 
               		<p><span>项目<samp>:</samp>
					<s:property value="tblProject.projectName"/>
					<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             		<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
					<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblProject.projectId" value="${logdetail.tblProject.projectId }"/>
					</span>
            		<span class="toRight">工时<samp>:</samp><select name="logDetailList[<s:property value="#s.index"/>].logTime" >
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
                   </span></p>
                  
                 </div>
                  </s:if>
                  <s:elseif test="null != tblTask">
                 <div class="log_send">
                  
                 <p><span>任务<samp>:</samp>
                 <input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblTask.taskId" value="${logdetail.tblTask.taskId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
             	
				<s:property value="tblTask.taskMsg"/>
				</span>
				<span  class="toRight">工时<samp>:</samp>
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
				</span></p>
				
                 </div>
                 </s:elseif>
                 <s:else>
                 <div class="log_send">
                  
                 <p><span>其它<samp>:</samp>
                 <input type="hidden" name="logDetailList[<s:property value="#s.index"/>].logDetailId" value="${logdetail.logDetailId }"/>
             	<input type="hidden" name="logDetailList[<s:property value="#s.index"/>].tblLog.logId" value="${logdetail.tblLog.logId }"/>
				</span>
				<span  class="toRight">工时<samp>:</samp>
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
				</span></p>
				
                 </div>
                 </s:else>
                <!--</s:iterator>-->
				</s:iterator>
                  <div class="log_acc">
                  <s:hidden name="tblLog.logId"/>
                  <s:hidden name="tblLog.logTime"/>
                  <s:hidden name="tblLog.createTime"/>
                  <s:hidden name="tblLog.tblUser.userId"/>
                  <s:hidden name="tblLog.tblCompany.companyId"/>
                  <s:hidden name="tblLog.dataStatus"/>
                  <s:hidden name="tblLog.comTime"/>
                 <p>日志附件：<a  class="logFile">浏览<input type="file" value="浏览"  name="image" id="image" onchange="ajaxFileUpload()"></a>
                 <input type="hidden" id="headImg" name="tblLog.logPicture" value="<s:property value='tblLog.logPicture'/>"></p>
                 <s:if test='tblLog.logPicture!=null && tblLog.logPicture!=""'>
                 
	          		<img id="updateShowImg" src="<%=basePath %><s:property value='tblLog.logPicture'/>" />
	         	</s:if><s:else> 暂无图片</s:else>
                 </div>

                 <div class="log_intro">
                 	<p><span>日志内容：</span></p><p><textarea type="text" name="tblLog.logMsg" rows="5" cols="30"><s:property value="tblLog.logMsg"/></textarea></p>

                 </div>
                
                  <div class="log_upload">
                 <input type="button" value="修改" onclick="update('<s:property value="date"/>')">
                 </div> 
            </form>
           </s:else>
           
           