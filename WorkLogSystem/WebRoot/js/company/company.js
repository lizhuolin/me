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
	
	$("#audit").click(function() {
		auditCompany();
	});
	$("#freeze").click(function() {
		freezeCompany();
	});
	$("#notfreeze").click(function() {
		notfreezeCompany();
	});
	$("#delete").click(function() {
		deleteCompany();
	});
	$("#find").click(function(){
		findAdmin(id);
	});
});

function deleteCompany(){
	
	if(isChecked2()){
		layer.confirm('是否删除', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "company/json_company_doCompanyDelete.action",
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


function find(){
	findAdmin(id);
}

function findAdmin(id){
	openNewDialog('company/company_companyFind.action?tblcompany.companyId='+id,"公司管理员详情");
}
function edit(id){
	if(id==""){
		openNewDialog('company/company_companyEdit.action', "新增公司");
	}else{ 
		openNewDialog('company/company_companyEdit.action?tblcompany.companyId='+id, "编辑公司");
	}
	
}
function auditCompany(){
	
	if(isChecked2()){
		layer.confirm('是否审核成功', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "company/json_company_audit.action",
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
function freezeCompany(){
	
	if(isChecked2()){
		layer.confirm('是否冻结公司', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "company/json_company_freeze.action",
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
function notfreezeCompany(){
	
	if(isChecked2()){
		layer.confirm('是否取消冻结公司', {
			btn : [ '是', '否' ]
		// 按钮
		}, function() {
			
			$.ajax({
				type: "POST",
				url: "company/json_company_notFreeze.action",
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

//点击事件，任务详情，跳转到action中的taskDetailList这个方法中
function checkOut8(id){
	openNewDialog('company/company_companyDetailList.action?tblcompany.companyId='+id,"公司详情");
	changeHead('公司管理');
}


