//var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"tblcompany.companyName":{
				required:true,
				isNickName:true,
				remote: {
					    url: "json_company_checkRegisteCompanyname.action",     //后台处理程序
					    type: "post",               //数据发送方式
					    dataType: "json",           //接受数据格式   
					    data: {                     //要传递的数据
					        "tblcompany.companyId": function() {
					            return $("#companyId").val();
					        }
					    }
				}
			},
			"tblcompany.companyMobile":{
				required:true,
				isPhone:true,
				remote: {
					    url: "json_company_checkRegisteCompanymobile.action",     //后台处理程序
					    type: "post",               //数据发送方式
					    dataType: "json",           //接受数据格式   
					    data: {                     //要传递的数据
					        "tblcompany.companyId": function() {
					            return $("#companyId").val();
					        }
					    }
				}
			},
				"tblcompany.companyAdress":{
					required:true
				},
					/*"tblcompany.charter":{
						required:true
					},*/
				"tblcompany.companyAdmin":{
					required:true
				},
				"tblcompany.email":{
					required:true,
					email:true
				},
				"tblcompany.idcard":{
					required:true,
					isIdcard:true
				},
				"tblcompany.charter":{
				    required:true
				}
		},
		messages:{
			"tblcompany.companyName":{
				required:"账号必填",
				remote:"公司已注册"
			},
			"tblcompany.companyMobile":{
				required:"电话必填",
				remote:"电话已注册"
			},
			"tblcompany.companyAdress":{
				required:"公司地址必填"
			},
			/*"tblcompany.charter":{
				required:"营业执照必选"
			},*/
			"tblcompany.companyAdmin":{
				required:"公司管理员必填"
			},
			"tblcompany.email":{
				required:"邮箱必填",
				emial:"邮箱格式错误"
			},
			"tblcompany.idcard":{
				required:"身份证必填",
				isContact:"身份证格式错误"
			},
			"tblcompany.charter":{
				required:"营业执照必选",
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
	/*$("#register").click(function(){
		doRegister();
	});*/
	
	$(".btn_cancel").click(function(){
		location.assign("../user/user_loginUI.action");
	});
	
});





function formSubmit(){
	if($("#editForm").validate().form()){
		//显示遮罩
		addCover();
		$.ajax({
			type: "POST",
			url: "json_company_edit.action",
			data: $("#editForm").serialize(),
			success: function(data){
				if(data.resultFlag){
					parent.$('.search_btn').click();
					//成功关闭
					successClose("操作成功");
					location.assign("../user/user_loginUI.action");
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
function doRegister(){
	if($("#editForm").validate().form()){
	   addCover();
		$.ajax({
			type: "POST",
			url: "json_company_doRegister.action",
			data: $("#editForm").serialize(),
			success: function(data){
				if(data.resultFlag){
					//成功提示
					//successClose("注册成功");
					alert("注册成功！请等待平台管理员审核，管理员联系电话：18372154566");
					location.assign("../user/user_loginUI.action");
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