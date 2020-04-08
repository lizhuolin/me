$(function($) {
	// 弹出新的对话框页面
	$("#edit").click(function() {
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked:not([id]");
			var id = $(checkedObj[0]).attr("value");
			//alert(id);
			editTask(id);
		}
				
	});
	$("#add").click(function() {
		editTask("");
	});
	
	$("#delete").click(function() {
		deleteTask();
		
	});	
});


function deleteTask(){
	
	if(isChecked2()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "task/json_task_doTaskDelete.action",
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


function editTask(id){
	
	if(id==""){
		openNewDialog('task/task_taskEdit.action', "新增任务");
	}else if(id){ 
		openNewDialog('task/task_taskEdit.action?tblTask.taskId='+id, "编辑任务");
	}else{
		
		return editTask;
	}
	
}


//点击事件，任务详情，跳转到action中的taskDetailList这个方法中
function checkOut9(id){
	openNewDialog('task/task_taskDetailList.action?tblTask.taskId='+id,"任务详情");
	changeHead('任务管理');
}







