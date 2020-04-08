<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<html>
<head lang = "en">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no;"> 
    <title>日志</title>
    <%@include file="/common/mobileCommon.jsp"%>
    <script src="<%=basePath %>js/mobile/log/edit.js"></script>  
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
 </head>

<body style="background-color:#f0f0f0">

	<div id="header_wrapper">
    	<div class="index_text">日志</div>
    	
    </div><!--header_wrapper结束-->
    
    <div id="body_wrapper">
    	<section>
        <div class="loa_date">
        	<div class="Calendar">
  				<div id="idCalendarPre" onclick="goNewPage('<%=basePath%>mobile/log/mobile_log.action?date=<s:property value="perMonth"/>')">&lt;&lt;</div>
  					<div id="idCalendarNext" onclick="goNewPage('<%=basePath%>mobile/log/mobile_log.action?date=<s:property value="nextMonth" />')">&gt;&gt;</div>
  						<span id="idCalendarYear"> <input id="dateId" name="date" value="${date }" style="border:0px;text-align: -webkit-center;" readOnly/><!--<s:property value="date"/>--></span>
					  <table cellspacing="0">
					    <thead>
					      <tr>
					        <td>日</td>
					        <td>一</td>
					        <td>二</td>
					        <td>三</td>
					        <td>四</td>
					        <td>五</td>
					        <td>六</td>
					      </tr>
					    </thead>
					    <tbody id="idCalendar">
					     <s:iterator value="dlogList" var="dlist" status="s">
					      <tr>
					      <s:iterator value="dlogList[#s.index]" var="detail" status="s2">
						      <td  <s:if test="dlogList[#s.index][#s2.index].tblLog!=null">
						      class="TaskOver"
						      </s:if>
						      <s:elseif test="dlogList[#s.index][#s2.index].day>0&&dlogList[#s.index][#s2.index].flag!=1">class="taskWait"</s:elseif>>
						      <s:if test="dlogList[#s.index][#s2.index].day>0">
						         <s:if test="dlogList[#s.index][#s2.index].flag==0">
						          	<a href="javascript:getLog4Today('<s:property value="dlogList[#s.index][#s2.index].year"/>-0<s:property value="dlogList[#s.index][#s2.index].month"/>-<s:property value="dlogList[#s.index][#s2.index].day"/>')"><s:property value="dlogList[#s.index][#s2.index].day"/></a>
							      </s:if>
							      <s:else>
							      <s:property value="dlogList[#s.index][#s2.index].day"/> 
							      </s:else>
						      </s:if>
						      </td>
					      </s:iterator>
					      
					      
					      </tr>
					     </s:iterator>
					    
					    
					    </tbody>
					  </table>
				</div>
	        </div>
        </section>
        
        <section>
         
          
          <div class="log_below"> </div>
        </section>
    </div><!--body_wrapper结束-->
   <%@include file="/common/mobileBelow.jsp"%>
    
</body>
</html>
