var index;
$(function($){
	 index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	
	//关闭
	$("#close").click(function(){
		parent.layer.close(index);
	});
	//选中一行/取消选中
	$(".checkedOne").click(function(){
		var obj = this.getElementsByTagName("input");
		var flag = $(obj[0]).prop("checked");
		if(flag){
			$(obj[0]).removeAttr("checked");
		}else{
			$(obj[0]).attr("checked", "checked");
		}
	});
	
	//全选/取消全选
	$("#checkedAll").click(function(){
		var flag = $(this).prop("checked");
		if(flag){
			$(".autoChecked").removeAttr("checked");
		}else{
			$(".autoChecked").attr("checked", "checked");
			$(".autoChecked").prop("checked", true);
		}
	});
	
	//查询条件过多可伸缩
	if($(".con_search").height()>70){
		$(".toggle").show();
	}
	
	$(".toggle").click(function(){
		if($(this).children("i").hasClass("icon-212102")){
			$(this).children("i").removeClass("icon-212102");
			$(this).children("i").addClass("icon-2121021");
			$(this).parent(".con_top").height("auto");
		}else{
			$(this).children("i").removeClass("icon-2121021");
			$(this).children("i").addClass("icon-212102");
			$(this).parent(".con_top").height(70);
		}
		
	});
	
	
	 $(".d_list").parent("span").height(30);
	
});


function scantoInput(obj){
	var length = $(obj).val().length;
	if(length === 15){
		var inputs = document.getElementsByTagName("input");
		if(inputs.length > 1){//批量操作
			for(var i = 0;i<inputs.length;i++){
				// 如果是最后一个，则再生成一行输入框
				if(i==(inputs.length-1)){
					//生成一行IMEI输入框
					autoAppend(obj);
					//下一个输入框聚焦
					inputs[i+1].focus();
					break;
				}else if(obj == inputs[i]){ //下一个输入框聚焦
					inputs[i+1].focus();
					break;
				}
			}
		}
	}
}

//生成一行输入框
function autoAppend(obj){
	$("#input_ul").append("<li class=\"batch_all\">" +
			"<span class=\"imei\"><input type=\"text\" name=\"imeiList\" oninput=\"scantoInput(this)\" maxlength=\"15\"  value=\"\"  onblur=\"isInstorage(this)\"/>" +
			"<label class=\"error\"></label></span>" +
			"<span class=\"imei\"><input type=\"text\" name=\"imeiList\" maxlength=\"15\" oninput=\"scantoInput(this)\" value=\"\" onblur=\"isInstorage(this)\"/>" +
			"<label class=\"error\"></label></span></li>");
}


/**
 * 打开新对话框
 */
function openNewDialog(url,title,width,height){
	 //iframe层-父子操作
	  layer.open({
		  type: 2,
		  area: [width||'800'+'px', height||'600'+'px'],//弹出层宽高
		  title: [title, 'font-size:16px;'],
		  fix: false, //不固定
		  maxmin: true,
		  content: url//加载页面
	  });
	
}
function openNewDialog2(url,title){
	//iframe层-父子操作
	layer.open({
		type: 2,
		area: ['800px', '600px'],//弹出层宽高
		title: [title, 'font-size:16px;'],
		fix: false, //不固定
		maxmin: true,
		zIndex: 19891016,
		content: url//加载页面
	});
	
}


function opSuccess(msg){
	layer.msg(msg, {icon: 1,time: 500});
}
function opFail(msg){
	layer.msg(msg, {icon: 2,time: 500});
}

/**
 * 父窗口操作成功提示
 */
function successClose(msg){
	 parent.layer.msg(msg, {shade: 0.1,time: 500})
	 parent.layer.close(index);
}
/**
 * 父窗口失败后提示并关闭
 */
function failClose(msg){
	 parent.layer.msg(msg, {shade: 0.1,time: 500})
	 parent.layer.close(index);
}

/**
 * 父窗口失败弹出
 */
function failAlert(msg){
	$.ajax({
		type: "POST",
		url: "json_permission_LoginController_checkLogin4Json",
		data: {},
		dataType:"json",
		success: function(data){
			if(!data.resultFlag){
				//未登录
				reloadWindowUrl();
				
			}else{
				 //iframe层-父子操作
				 var index= layer.open({
					  type: 2,
					  area: ['800px', '600px'],//弹出层宽高
					  title: [title, 'font-size:16px;'],
					  fix: false, //不固定
					  maxmin: true,
					  content: url//加载页面
				  });
				return index;
			}
		}
	});
}


//刷新地址栏
function  reloadWindowUrl(){
	location.reload();
}


/**
 * 搜索
 */
function searchForm(){
	$("#pageNow").val(1);
	 getNewData();
	
}

function getNewData(){
	$("#searchForm").submit();
}

function goPage(){
	changePage($("#jumpPage").val(),1);
}
function changePage(page,type){
	var totalPage=Number($("#totalPage").val());
	var pageNow=$("#pageNow").val();
	var newPageNow;
	if(type==1){
		newPageNow=page;
	}else{
		newPageNow=Number(pageNow)+Number(page);
	}
	
	//alert(newPageNow);
	if(newPageNow>(totalPage+1)){
		layer.msg("超过总页数");
		return;
	}
	if(newPageNow==(totalPage+1)){
		layer.msg("已是最后一页");
		return;
	}
	if(newPageNow<=0){
		layer.msg("已是第一页");
		return;
	}
	
	//layer.msg("执行了查询");
	$("#pageNow").val(newPageNow);
	getNewData();
}


$(function($){
    if(undefined!=$("#startTime")){
     $("#startTime").click(function(){
    	// laydate({elem: '#startTime'});
    	 WdatePicker();
	});
    }

   if(undefined!=$("#endTime")){
     $("#endTime").click(function(){
//    	 laydate({elem: '#endTime'});
    	 WdatePicker();
	});
   }
   if(undefined!=$("#startTime2")){
	   $("#startTime2").click(function(){
		   WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
	   });
   }
   
   if(undefined!=$("#endTime2")){
	   $("#endTime2").click(function(){
		   WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
	   });
   }
   
    if(undefined!=$("#monthTime")){
     $("#monthTime").click(function(){
		$("#monthTime").datepicker({dateFormat: "yy-mm-01"});
	});
   }
   
  
	//关闭缓存	 
    $.ajaxSetup ({ 
       cache: true //关闭AJAX相应的缓存 
     });  	    

});


function layerTitle(title){
	$(".layui-layer-title").html(title);
	
}

/**
 * 是否只选择了一个
 * @returns {Boolean}true --是，false--否
 */
function isCheckedOne(){
	if($("input:checked").length==0){
		layer.msg("至少选择一条数据");
		return false
	}else if($("input:checked").length>1){
		layer.msg("只能选择一条数据");
		return false;
	}else{
		return true;
	}
}

/**
 * 添加遮罩
 */
function addCover(){
	var o = document.body;
	var div = document.createElement("div");
	var p = document.createElement("p");
	var img = document.createElement("img");
	div.setAttribute("class","edit_cover");
	div.setAttribute("id","edit_cover");
	img.setAttribute("src","images/loading.gif");
	p.appendChild(img);
	div.appendChild(p);
	o.appendChild(div);
}

/**
 * 隐藏遮罩
 */
function removeCover(){
  var o = document.body;
  var div = document.getElementById("edit_cover");
  o.removeChild(div);
}
