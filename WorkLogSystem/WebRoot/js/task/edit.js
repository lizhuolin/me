var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			
			/*remote: {
			    url: "json_user_checkUsername.action",     //后台处理程序
			    type: "post",               //数据发送方式
			    dataType: "json",           //接受数据格式   
			    data: {                     //要传递的数据
			        "user.userId": function() {
			            return $("#userId").val();
			        }
			    },*/
			
			"tblTask.tblCompany":{
				required:true
			},
			"tblTask.taskMsg":{
				required:true
			},
			"tblTask.taskStartTime":{
				required:true
			},
			"tblTask.taskEndTime":{
				required:true
			},
			"tblTask.taskLevel":{
				required:true
			},
			"tblTask.taskTarget":{
				required:true
			},
			"tblTask.taskResponsible":{
				required:true
			},
			"tblTask.taskProgress":{
				required:true
			},
			"tblTask.taskTime":{
				isNumber:true,
				required:true
			}/*,
			"tblTask.isPush":{
				required:true
			}*/
			
			
		},
		messages:{
			"tblTask.tblCompany":{
				required:"公司必填"
			},"tblTask.taskStartTime":{
				required:"计划开始时间必填"
			},"tblTask.taskEndTime":{
				required:"计划完成时间必填"
			},"tblTask.taskLevel":{
				required:"任务等级必填"
			},"tblTask.taskTarget":{
				required:"任务目标必填"
			},"tblTask.taskResponsible":{
				required:"指派人必选"
			},"tblTask.taskProgress":{
				required:"完成度必填"
			},"tblTask.taskTime":{
				required:"工时必填"
			},"tblTask.taskMsg":{
				required:"任务名称必填"
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
	
	if(!dateCompare($("#startTime").val(),$("#endTime").val()) || !dateCompare($("#startTime3").val(),$("#endTime3").val())){
		//$.messager.val("错误","请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！","error");
		opFail("请检查日期两个参数中是否其中一个为空值，或者查询的截止日期大于起始日期错误！");
		return;
	}
	
	if($("#editForm").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_task_doTaskEdit.action",
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
	
	if(data1==""){
		if(data2!=""){
			return false;
		}
		
	}else if(data2==""){
		if(data1!=""){
			return false;
		}
	}
	if(data1>data2){
		return false;
	}
	
	return true;
}