$(function($) {
	// 弹出新的对话框页面
	$("#edit").click(function() {
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked:not([id]");
			var id = $(checkedObj[0]).attr("value");
			edit(id);
		}
		
		
	});
	
	
	$("#delete").click(function(){
			deleteProject();
		
	});
	
	$("#goback").click(function(){
		gobackPage();
	});
	
});

function gobackPage(){
	loadNewPage('project/project_projectList.action');
	changeHead('项目管理');
}
function edit(id){
	
	if(id==""){
		openNewDialog('plan/plan_planEdit.action', "新建计划");
	}else{ 
		openNewDialog('plan/plan_planEdit.action?tblPlan.planId='+id, "编辑计划");
	}
	
}

function deleteProject(){
	if(isChecked()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "plan/json_plan_delete.action",
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