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
		deleteNotice();
	});
	
});

function edit(id){
	if(id==""){
		openNewDialog('notice/notice_editUI.action', "添加公告");
	}else{ 
		openNewDialog('notice/notice_editUI.action?notice.noticeId='+id, "编辑公告");
	}
	
}
function deleteNotice(){
	
	if(isChecked2()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]

		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "notice/json_notice_noticeDelete.action",
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
