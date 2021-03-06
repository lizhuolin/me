$(function($) {
	$("#edit").click(function() {

		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked:not([id]");
			var id = $(checkedObj[0]).attr("value");
			edit(id);
		}


	});

	
	$("#add").click(function() {
		edit("");
	});
	$("#delete").click(function() {
		deleteUser();
	});
	$("#reset").click(function() {
		resetPassword();
	});
	
});


function deleteUser(){
	
	if(isChecked2()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]

		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "user/json_user_userDelete.action",
				data: {"ids":getCheckedIdsStr()},
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
				}
			});
		});


	}
	
	
}

function edit(id){
	if(id==""){
		openNewDialog('user/user_editUI.action', "新增用户");
	}else{ 
		openNewDialog('user/user_editUI.action?user.userId='+id, "编辑用户");
	}

}



function resetPassword(){
	
	if(isChecked2()){
		layer.confirm('是否重置密码', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {	
			$.ajax({
				type: "POST",
				url: "user/json_user_userReset.action",
				data: {"ids":getCheckedIdsStr()},
				success: function(data){
					if(data.resultFlag){
						parent.$('.search_btn').click();
						//成功关闭
						successClose(data.resultMsg);
					}else{
						//失败提示
						failAlert(data);
					}
					//隐藏遮罩
				}
			});
		});
	}
}