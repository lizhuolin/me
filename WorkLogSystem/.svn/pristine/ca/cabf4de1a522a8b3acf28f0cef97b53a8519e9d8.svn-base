$(function($) {
	$("#delete").click(function() {
		deleteRemind();
	});
	
});





function deleteRemind(){
	if(isChecked()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "reportwarn/json_reportwarn_delete.action",
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

