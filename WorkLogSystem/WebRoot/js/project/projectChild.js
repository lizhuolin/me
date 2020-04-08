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
	
	$("#addPlan").click(function(){
		
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked");
			var id = $(checkedObj[0]).attr("value");
			addPlan(id);
		}
	});
	
	$('#checkPlan').click(function(){
		if(isCheckedOne()){
			var checkedObj = $("input[type='checkbox']:checked");
			var id = $(checkedObj[0]).attr("value");
			checkPlan(id);
		}
	});
	
	$("#delete").click(function() {
		deleteChild();
	});
	
	$("#backToproject").click(function(){
		backToproject();
	});
});

function backToproject(){
	loadNewPage('project/project_projectList.action');
	changeHead('项目管理');
}
function addPlan(id){
	openNewDialog('plan/plan_planEdit.action?tblProjectChild.projectChildRealId='+id,"添加计划");
}

function checkPlan(id){
	loadNewPage('plan/plan_planList4Child.action?tblProjectChild.projectChildRealId='+id);
	changeHead('子项目计划');
}
function deleteChild(){
	
	if(isChecked()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "project/json_projectchild_doDelete.action",
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
		openNewDialog('project/projectchild_projectEditChild.action', "添加子项目");
	}else{ 
		openNewDialog('project/projectchild_projectEditChild.action?tblProjectChild.projectChildRealId='+id, "编辑子项目");
	}
	
}

