<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

 <div class="main_bottom">
      <div class="con_bottom">
        <div class="bottom_disc">
          <input type="hidden" value="<s:property value="pageList.totalPage"/>" id="totalPage">
        
          <span>当前页： <s:if test="pageList.totalPage==0">0</s:if><s:else><s:property value="pageList.pageNow"/></s:else>/<s:property value="pageList.totalPage"/></span>
          <span>
	            <a href="javaScript:changePage('-1',0)"><i class="iconfont icon-caretleft"></i></a>
	            <a href="javaScript:changePage('1',0)"><i class="iconfont icon-caretright"></i></a>
            
           </span>
          <span>跳到<input type="text" id="jumpPage"></span>
        </div>
        <div class="search_btn"><a  href="javaScript:goPage()">GO</a></div>
      </div>
    </div> 