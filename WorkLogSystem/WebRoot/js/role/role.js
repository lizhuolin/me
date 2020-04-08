$(function($) {
	// 弹出新的对话框页面
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
		deleteRole();
	});
	
});


function edit(id){
	
	if(id==""){
		openNewDialog('role/role_editUI.action', "新增角色");
	}else{ 
		openNewDialog('role/role_editUI.action?role.roleId='+id, "编辑角色");
	}
	
}



function deleteRole(){
	
	if(isChecked()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "role/json_role_delete.action",
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

