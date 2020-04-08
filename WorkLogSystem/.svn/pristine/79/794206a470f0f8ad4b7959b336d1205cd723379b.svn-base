<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 	
    	<s:iterator value="taskList" status="st" >
    	<section class="form" id="tasks">
    		<div class="data">
            <div class="task_plan">
            	<div class="dian">●</div>
            	<input type="text"  value="<s:property value="taskMsg"/>" readonly />
            </div>
            <a href="mobile/task/mobile_task_detailList.action?tblTask.taskId=<s:property value="taskId"/>">
            <div class="task_other">
            	<div class="other_left">
	            	<p><span>负责人:</span><input type="text" value="<s:property value="taskResponsible.name"/>"readonly></p>
	               	<p><span>任务目标：</span><input type="text" value="<s:property value="taskTarget" />"readonly></p>
	                <%-- <p><span>创建时间：</span><input type="text" value="<s:property value="createTime" />"readonly></p> --%>
	                <p><span>创建时间：</span><input type="text" name="tblTask.createTime"  value="<s:date name="createTime" format="yyyy-MM-dd"/>" readonly></p>
               	</div>
                
            <div class="other_right" >
    			<div class="splash-inner">
        		 <div class="loading-circle" >
        	<p><span id="loadedNum" class="loadedNum"><s:property  value="taskProgress"/></span></p>
            		<s:if test="#st.odd">
            			<canvas class="mask" id="loadingProgress" ></canvas>
            		</s:if>
            		<s:else>
            		<canvas class="mask1" id="loadingProgress1" width="100" height="100"></canvas>
            		</s:else>
           			
           			
        			</div>
    			</div>
			</div>
            </div></a>
         </div>
         </section>
		</s:iterator>
