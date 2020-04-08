var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#sub_form").validate({
		rules:{
			"tblProject.projectRemaks":{
				required:true
			}
			
			
		},
		messages:{
			"tblProject.projectRemaks":{
				required:"任务标题必填"
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
	if($("#sub_form").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_task_doTaskEdit.action",
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
