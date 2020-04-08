var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"tblProject.projectName":{
				required:true,
				isProjectName:true,
				remote: {
					    url: "json_project_checkProjectname.action",     //后台处理程序
					    type: "post",               //数据发送方式
					    dataType: "json",           //接受数据格式   
					    data: {                     //要传递的数据
					        "tblProject.projectId": function() {
					            return $("#projectId").val();
					        }
					    }
				}
			},
				"tblProject.projectRemaks":{
					required:true
				},
					/*"tblcompany.charter":{
						required:true
					},*/
				"tblProject.projectTarget":{
					required:true
				},"tblProject.projectStartTime":{
					required:true
				},"tblProject.projectEndTime":{
					required:true
				}
		},
		messages:{
			"tblProject.projectName":{
				required:"项目名称必填",
				remote:"该项目名称已被使用，请换项目名称"
			},
			"tblProject.projectRemaks":{
				required:"项目备注必填"
			},
			/*"tblcompany.charter":{
				required:"营业执照必选"
			},*/
			"tblProject.projectTarget":{
				required:"项目目标必填"
			},"tblProject.projectStartTime":{
				required:"项目预计开始时间必填"
			},"tblProject.projectEndTime":{
				required:"项目预计结束时间必填"
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
	$("#edit").click(function(){
		formSubmit();
	 });
	
});




function formSubmit(){
	if(!dateCompare($("#startTime5").val(),$("#endTime5").val()) || !dateCompare($("#startTime4").val(),$("#endTime4").val())){
		//$.messager.val("错误","请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！","error");
		opFail("请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！");
		return;
	}
	if($("#editForm").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_project_edit.action",
			data: $("#editForm").serialize(),
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
				removeCover();
			}
		});
	}
}

function dateCompare(data1,data2){
	
	if(data1>data2){
		return false;
	}
	
	return true;
}