<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<script>
  $(function(){
	 var formDom= document.getElementById("searchForm");
	  var input = document.createElement("input");
	  input.setAttribute("name","pageSize");
	  input.setAttribute("type","hidden");
	  input.setAttribute("value",$("#pageSizeId").val());
	  formDom.appendChild(input);
	  
	  
  });

  function changePageSize(){
		$("input[name='pageSize']").val($("#pageSizeId").val());
		$('.search_btn').click();
	}
</script>

 <div class="main_bottom">
      <div class="con_bottom">
        <div class="bottom_disc">
          <input type="hidden" value="<s:property value="pageList.totalPage"/>" id="totalPage">
       
          <span>当前页： <s:if test="pageList.totalPage==0">0</s:if><s:else><s:property value="pageList.pageNow"/></s:else>/<s:property value="pageList.totalPage"/></span>
          <span>
	            <a href="javaScript:changePage('-1',0)"><i class="iconfont icon-caretleft"></i></a>
	            <a href="javaScript:changePage('1',0)"><i class="iconfont icon-caretright"></i></a>
            
           </span>
           <span>每页显示<select id="pageSizeId" onchange="changePageSize()">
                    
                    <option <s:if test="pageList.pageSize==10" >selected="selected"</s:if>>10</option>
                    <option <s:if test="pageList.pageSize==20" >selected="selected"</s:if>>20</option>
                    <option <s:if test="pageList.pageSize==50" >selected="selected"</s:if>>50</option>
                    <option <s:if test="pageList.pageSize==100">selected="selected"</s:if>>100</option>
                    <s:if test="#maxPageSize>=1000">
	                    <option <s:if test="pageList.pageSize==1000">selected="selected"</s:if>>1000</option>
                    </s:if>
                   </select>条</span>
           
          <span>跳到<input type="text" id="jumpPage"></span>
        </div>
        <div class="search_btn"><a  href="javaScript:goPage()">GO</a></div>
      </div>
    </div> 