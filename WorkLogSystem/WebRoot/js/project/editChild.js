var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"tblProjectChild.projectName":{
				required:true
			},"tblProjectChild.responsible.userId":{
				required:true
			},"tblProjectChild.projectChildStarttime":{
				required:true
			},"tblProjectChild.projectChildEndtime":{
				required:true
			},"tblProjectChild.projectChildTarget":{
				required:true
			}
			
		},
		messages:{
			"tblProjectChild.projectName":{
				required:"项目名称不能为空"
			},"tblProjectChild.responsible.userId":{
				required:"项目成员不能为空"
			},"tblProjectChild.projectChildStarttime":{
				required:"子项目预计开始时间必填"
			},"tblProjectChild.projectChildEndtime":{
				required:"子项目预计结束时间必填"
			},"tblProjectChild.projectChildTarget":{
				required:"子项目目标必填"
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
	if(!dateCompare($("#startTime5").val(),$("#endTime5").val()) || !dateCompare($("#startTime4").val(),$("#endTime4").val())){
		//$.messager.val("错误","请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！","error");
		opFail("请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！");
		return;
	}
	if($("#editForm").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_projectchild_edit.action",
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
	
	if(data1>data2){
		return false;
	}
	
	return true;
}