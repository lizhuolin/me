var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			   "notice.noticeTitle":{
				required:true,
				//isNickName:true
			  }
				
			},
			messages:{
				"notice.noticeTitle":{
					required:"公告标题必填",
					//isNickName:"公司标题格式错误"
				}
				
			}
		,success : function(label) {
			//label.addClass("success").text("输入正确");
		}
		//,errorPlacement : function(error, element) {
			//error.appendTo(element.next("span").next("span"));
		//}
		,onkeyup : false
		});
	
	//弹出页面
	$("#edit").click(function(){
		formSubmit();
	 });
});




function formSubmit(){
	if(!dateCompare($("#startTime4").val(),$("#endTime4").val())){
		//$.messager.val("错误","请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！","error");
		opFail("请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！");
		return;
	}
	if($("#editForm").validate().form()){
		
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_notice_edit.action",
			data: $("#editForm").serialize(),
			success: function(data){
				if(data.resultFlag){
					parent.$('.search_btn').click();
					//成功关闭
					successClose("操作成功");
					
				}else{
					//失败提示
					failAlert(data);
				}
				//隐藏遮罩
				removeCover();
			}
		});
	}
}
function dateCompare(data1,data2){
	
	if(data1==""){
		if(data2!=""){
			return false;
		}
		
	}else if(data2==""){
		if(data1!=""){
			return false;
		}
	}
	if(data1>data2){
		return false;
	}
	
	return true;
}