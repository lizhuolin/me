var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"role.roleName":{
				required:true
			},
			"role.isEffect":{
				required:true
			},
			"role.dataPrivilege":{
				required:true
			}

		},
		messages:{
			"role.roleName":{
				required:"角色名必填"
			},
			"role.isEffect":{
				required:"角色状态必选"
			},
			"role.dataPrivilege":{
				required:"数据权限必选"
			}
		}
		,success : function(label) {
			//label.addClass("success").text("输入正确");
		}
		//,errorPlacement : function(error, element) {
			//error.appendTo(element.next("span").next("span"));
		//}
		,onkeyup : false
		});
	
	//弹出页面
	
	/*$("#edit").click(function(){
		treeLoad();
		//formSubmit();
		submitTree();
	 });*/
});




$(function(){
	treeLoad();
	$("#edit").click(function(){
		submitTree();
	});
});


/**
 * 初始化权限树
 */
function treeLoad() {
	
	$.ajax({
		type: "POST",
		//url: "jsonArray_permission_PermissionAction_rolePermissionTree",
		url: "jsonArray_role_rolePrivilegeTree.action",
		data: {"role.roleId":$("#roleId").val()},
		dataType:"json",
		success: function(resultData){
				var setting = {
						data : {
							simpleData : {
								enable : true,
								idKey : "id",
								pIdKey : "pId",
								rootPId : null
							}
						},
						check : {
							enable : true,
							chkStyle : "checkbox",
							chkboxType : {
								"Y" : "ps",
								"N" : "ps"
							}
						},
						callback : {
							onCheck : zTreeOnCheck
						}
					};
					tree = $.fn.zTree.init($("#roleTree"), setting,resultData);
		}
	});
	
	
	
}


//checkbox选中后的回调
function zTreeOnCheck(event, treeId, treeNode) {
	var nodes = tree.getCheckedNodes(true);
	var names = "";
	for (var int = 0; int < nodes.length; int++) {
		names = names + nodes[int].name + ',';
	}
//	names = names.substring(0, names.length - 1);
//	$("#warehouseAreas").val(names);
};

function submitTree(){
	if($("#editForm").validate().form()){
	var treeObj = $.fn.zTree.getZTreeObj("roleTree");
	var nodes = treeObj.getCheckedNodes(true);
     var v="";
     for(var i=0;i<nodes.length;i++){
       v=","+nodes[i].id+v ;
     }
     v=v.substring(1, v.length);
     
   //显示遮罩
		addCover();
 	$.ajax({
		type: "POST",
		url: "json_role_doRolePermissionEdit.action?"+$("#editForm").serialize(),
		data: {"privilegeIds":v,},
		success: function(data){
			//隐藏遮罩
			removeCover();
			if(data.resultFlag){
				parent.searchForm();
				//成功关闭
				successClose("操作成功");
			}else{
				//失败提示
				failAlert(data);
			}
		}
	});
	}
}


