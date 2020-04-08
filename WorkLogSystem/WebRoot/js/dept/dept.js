$(function($) {
	$("#edit").click(function() {
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked");
			var id = $(checkedObj[0]).attr("value");
		    edit(id);
		}
		
		
	});
	$("#add").click(function() {
		edit("");
	});
	
	$("#delete").click(function() {
		deleteDept();
	});
	
});

function edit(id){
	if(id==""){
		openNewDialog('dept/dept_editUI.action', "新增部门");
	}else{ 
		openNewDialog('dept/dept_editUI.action?dept.deptId='+id, "编辑部门");
	}
	
}
function deleteDept(){
	
	if(isChecked2()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]

		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "dept/json_dept_deptDelete.action",
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
