<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html >
<html>
<head lang = "en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <title>注册</title>
    <script src="<%=basePath %>/js/jquery/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath %>common/ajaxfileupload.js"></script>
    <script src="<%=basePath %>js/layer/layer.js"></script>
    <script src="<%=basePath %>common/comm.js"></script>
    <script src="<%=basePath %>js/company/registe.js"></script>  
    <script src="<%=basePath %>js/jquery/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>/js/common.validate.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath %>/uploadify/jquery.uploadify.js"></script>
     <link href="<%=basePath%>css/registerStyle.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/mobileStyle.css" rel="stylesheet" type="text/css">
    
    <!-- 只需要引入自己独有的js即可    js统一放到js文件夹下面，并按模块建立单独文件夹-->
    <script src="<%=basePath %>/js/company/edit.js"></script> 
 </head>
<script type="text/javascript">

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
                    	//$("#showImg1").attr("src",rooPath + "/" +data.imagePath);
                    	$("#showImg1 img").remove();
                    	$("#showImg1 label").remove();
                    	$("#showImg1").append("<img  src="+ rooPath + "/" +data.imagePath + " width='50px' height='50px'/>"); 
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
                    	$("#showImg2 label").remove();
                     	$("#showImg2").append("<img  src="+ rooPath + "/" +data.imagePath + " width='50px' height='50px'/>");
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





    	$(function($){
    		$("#form").validate({
    			rules:{
    				"tblcompany.companyName":{
    					required:true,
    					isNickName:true,
    					remote: {
    						    url: "json_mobile_checkRegisteCompanyname.action",     //后台处理程序
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
    						    url: "json_mobile_checkRegisteCompanymobile.action",     //后台处理程序
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
    					"tblcompany.companyType":{
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
    					}
    			},
    			messages:{
    				"tblcompany.companyName":{
    					required:"必填",
    					/* isLoginname:"账号格式不正确,登陆名须为长度为4-16位的字母或数字！", */
    					remote:"已注册"
    				},
    				"tblcompany.companyMobile":{
    					required:"必填",
    					remote:"已注册"
    				},
    				"tblcompany.companyAdress":{
    					required:"必填"
    				},
    				/*"tblcompany.charter":{
    					required:"营业执照必选"
    				},*/
    				"tblcompany.companyAdmin":{
    					required:"必填"
    				},
    				"tblcompany.companyType":{
    					required:"必填"
    				},
    				"tblcompany.email":{
    					required:"必填",
    					emial:"邮箱格式错误"
    				},
    				"tblcompany.idcard":{
    					required:"必填",
    					isContact:"身份证格式错误"
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
    		
    	});
    	function formSubmit(){
    		if($("#form").validate().form()){
    			//显示遮罩
    			addCover();
    			$.ajax({
    				type: "POST",
    				url: "json_mobile_mobileRegiste.action",
    				data: $("#form").serialize(),
    				success: function(data){
    					if(data.resultFlag){
    						parent.$('.zc.btn').click();
    						//成功关闭
    						successClose("操作成功");
    						alert("注册成功！请等待平台管理员审核，管理员联系电话：18372154566");
    						location.assign("../user/mobile_loginUI.action");

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
    </script>
<body style="background-color:#f0f0f0">

	<div id="header_wrapper">
	<div class="title_button"><a  href="javascript:back()" ><img src="<%=basePath%>images/back.png"></a></div>
    	<div class="index_text">注册</div>
    	
    </div><!--header_wrapper结束-->
    <div id="body_wrapper">
        <section>
        	<div class="register_form">
            <form id="form" name="form" <%-- action="<%=basePath %>mobile/company/mobile_mobileEdit.action" --%> method="post" enctype="multipart/form-data">
            	<s:hidden name="tblcompany.companyId"/>
            	
            	<p><span>公司名称：</span><input type="text" name="tblcompany.companyName" value="${tblcompany.companyName }"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>服务类型：</span><input type="text" name="tblcompany.companyType" value="${tblcompany.companyType }"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>公司地址：</span><input type="text" name="tblcompany.companyAdress" value="${tblcompany.companyAdress }"></p>
            	<hr size="1" width="99%" color="#cacaca" noshade="noshade" />
               <%--  <p><span>营业执照：</span> <a href="javascript:;" class="file">浏览<input type="file" name="tblcompany.charter"  value="<s:property value='tblcompany.charter'/>"></a></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" /> --%>
                
          
                
                
                <!-- <hr size="1" width="100%" color="#cacaca" noshade="noshade" /> -->
                
                <p><span>公司电话：</span><input type="text" name="tblcompany.companyMobile" value="${tblcompany.companyMobile }"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
            	<!-- <p><span>公司LOGO：</span> <a href="javascript:;" class="file">浏览<input type="file" name="tblcompany.companyLogo"></a></p>
                <hr size="1" width="100%" color="#cacaca" noshade="noshade" /> -->
                
                  
               
                
                <p><span>管理员姓名：</span><input type="text" name="tblcompany.companyAdmin" value="${tblcompany.companyAdmin }"></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                
                <p><span>管理员邮箱:</span><input  type="text" name="tblcompany.email" value="${tblcompany.email }"/></p>
        		<hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>身份证:</span><input  type="text" name="tblcompany.idcard" value="${tblcompany.idcard }"/></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><span>公司简介：</span></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p><textarea type="text"rows="4" name="tblcompany.companyIntroduction"></textarea></p>
                <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p id="showImg1">
                <span>营业执照：</span>
               	 <a class="file">选择文件 <input type="file" name="image" id="image1" onchange="ajaxFileUpload()"/></a>
                	<input type="hidden" id="charter" name="tblcompany.charter" >
                	
                </p> 
                 <hr size="1" width="99%" color="#cacaca" noshade="noshade" />
                <p id="showImg2">
                 
            	<span>公司LOGO：</span>
            	 <a class="file">选择文件<input type="file" name="image" id="image2" onchange="ajaxFileUpload2()"/></a>
            	<input type="hidden"  id="companyLogo" name="tblcompany.companyLogo"  "/>
            	</p>
         </form>
            </div>
        </section>
        <section>
        	<div class="re_button">
            	<input id="zc.btn" type="button" value="注册" onClick="formSubmit()">
            </div>
        </section>
        </div><!--body_wrapper结束-->  
    

    </div><!--footer_wrapper结束-->
   
</body>
</html>
