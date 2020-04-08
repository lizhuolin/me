var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"privilege.privilegeName":{
				required:true
			}

		},
		messages:{
			"privilege.privilegeName":{
				required:"权限名必选"
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
	if($("#editForm").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_privilege_edit.action",
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



