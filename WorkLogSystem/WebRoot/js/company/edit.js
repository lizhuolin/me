//var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function($){

	$("#editForm").validate({
		rules:{
			"tblcompany.companyName":{
				required:true,
				isNickName:true,
				remote: {
					    url: "json_company_checkCompanyname.action",     //后台处理程序
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
					    url: "json_company_checkCompanymobile.action",     //后台处理程序
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
				remote:"该公司已注册"
			},
			"tblcompany.companyMobile":{
				required:"电话必填",
				remote:"该电话已被注册,请更换其他电话"
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
				email:"邮箱格式错误"
			},
			"tblcompany.idcard":{
				required:"身份证必填",
				isContact:"身份证格式错误"
			},
			"tblcompany.charter":{
				required:"营业执照必选"
			    
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

function ajaxFileUpload() {
    $.ajaxFileUpload({
            url:rooPath + '/fileoperate/fileoperate_imageUpload.action',//用于文件上传的服务器端请求地址
            secureuri:false,//一般设置为false
            fileElementId:'image1',//文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType: 'json',//返回值类型 一般设置为json
            data : {"childPath" : "company"},
            success: function (data, status){  //服务器成功响应处理函数
            	if (typeof(data.error) != 'undefined') {
                    if (data.error != '') {
                   	 opFail(data.error);
                    } else {
                    	$("#charter").val(data.imagePath);
                    	$("#showImg img").remove();
                     	$("#showImg").append("<img  src="+ rooPath + "/" +data.imagePath + " width='40px' height='30px'/>");
                     	opSuccess(data.message);
                    }
                }
             	
            },
            error: function (data, status, e){//服务器响应失败处理函数
            	opFail(data.message);
            }
        });
    return false;
}

function ajaxFileUpload2() {
    $.ajaxFileUpload({
            url:rooPath + '/fileoperate/fileoperate_imageUpload.action',//用于文件上传的服务器端请求地址
            secureuri:false,//一般设置为false
            fileElementId:'image2',//文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType: 'json',//返回值类型 一般设置为json
            data : {"childPath" : "company"},
            success: function (data, status){  //服务器成功响应处理函数
            	if (typeof(data.error) != 'undefined') {
                    if (data.error != '') {
                   	 opFail(data.error);
                    } else {
                    	$("#companyLogo").val(data.imagePath);
                    	$("#showImg2 img").remove();
                     	$("#showImg2").append("<img  src="+ rooPath + "/" +data.imagePath + " width='40px' height='30px'/>");
                     	opSuccess(data.message);
                    }
                }
             	
            },
            error: function (data, status, e){//服务器响应失败处理函数
            	opFail(data.message);
            }
        });
    return false;
}