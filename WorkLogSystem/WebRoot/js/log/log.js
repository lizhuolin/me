$(function($) {
	// 弹出新的对话框页面
	$("#edit").click(function() {
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked:not([id]");
			var id = $(checkedObj[0]).attr("value");
			edit(id);
		}
		
		
	});
	$("#add").click(function(){
		add();
	})
	
	$("#delete").click(function(){
			deleteProject();
		
	});
	
	
	$("#check").click(function(){
		checkOut(id);
	});
});



function checkOut(id){
	openNewDialog('log/logDetail_logDetailList.action?tblLog.logId='+id,"项目工时详情");
	changeHead('项目管理');
}

function add(){
	openNewDialog('log/log_logEdit.action', "新建日志");

}

function edit(id){
	openNewDialog('log/log_logChange.action?tblLog.logId='+id, "编辑日志");
	
}

function deleteProject(){
	if(isChecked()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "log/json_log_delete.action",
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