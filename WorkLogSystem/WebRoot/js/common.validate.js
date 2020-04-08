//联系电话(手机/电话皆可)验证   
$.validator.addMethod("isPhone",function(value,element){
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	var tel = /^\d{3,4}-?\d{7,9}$/;
	return this.optional(element)||(tel.test(value)||mobile.test(value));
},"请正确填写");

$.validator.addMethod("isTel",function(value,element){
	var length = value.length;
	var tel = /^\d{3,4}-?\d{7,9}$/;
	return this.optional(element)||(tel.test(value)||mobile.test(value));
},"请正确填写您的联系电话");

$.validator.addMethod("isCode",function(value,element){
	var length = value.length;
	var code = /^\d{10}$/;
	return this.optional(element)||(code.test(value));
},"请正确填写验证码");

$.validator.addMethod("isPostalcode",function(value,element){
	var length = value.length;
	var postalcode = /^\d{6}$/;
	return this.optional(element)||(postalcode.test(value));
},"邮政编码为6个数字");

////邮箱验证
//$.validator.addMethod("isEmail",function(value,element){
//	var length = value.length;
//	var email = /^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i;
//	return this.optional(element)||(email.test(value));
//},"请正确填写对方邮箱");

//联系方式(手机/固定电话/邮箱)
$.validator.addMethod("isContact",function(value,element){
	var length = value.length;
	var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	var tel = /^\d{3,4}-?\d{7,9}$/;
	var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	return this.optional(element)||(mobile.test(value)||tel.test(value)||email.test(value));
},"请填写您的联系方式");

//手机验证   
$.validator.addMethod("isMobile",function(value,element){
	var mobile = /^(((1([3]|[5]|[7]|[8])[0-9]{1}))+\d{8})$/;
	return this.optional(element)||(mobile.test(value));
},"请正确填写您的手机号码");
//手机验证，包括3-4-4格式   
$.validator.addMethod("isMobile344",function(value,element){
	var mobile = /^(((1([3]|[5]|[7]|[8])[0-9]{1}))+-?\d{4}-?\d{4})$/;
	return this.optional(element)||(mobile.test(value));
},"请正确填写您的手机号码");

//用户密码验证
$.validator.addMethod("isPassword",function(value,element){
	var password=/^[A-Za-z0-9]{6,}$/;
	return this.optional(element)||(password.test(value));
},"密码须为长度大于6的字母或数字");
//身份证号码
$.validator.addMethod("isIdcard",function(value,element){
	var password=/^[A-Za-z0-9]{18}$/;
	return this.optional(element)||(password.test(value));
},"须为18位");

//登陆名称
$.validator.addMethod("isLoginname",function(value,element){
	var password=/^[A-Za-z0-9]{4,16}$/;
	return this.optional(element)||(password.test(value));
},"登陆名须为长度为4-16位的字母或数字");


$.validator.addMethod("isNumber",function(value,element,param){

	var number = /^\d*$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"您输入的不是数字");


jQuery.validator.addMethod("isNewPassword", function(value, element) {
	return $("#password").val()!=$("#newpassword").val();
}, "新密码不能和原密码一致");


//用户昵称验证
$.validator.addMethod("isNickName",function(value,element){
	var nickname=/^[\u0391-\uFFE5\w]+$/;
	var number = /^\d{5,14}$/;
	var length=value.length;
	var newLength=0;
	if(!number.test(length)){
		for(var i=0;i<value.length;i++){
			if(value.charCodeAt(i)>127){
				newLength = parseInt(newLength)+2;
			}else{
				newLength++;
			}
		}
	}
	return this.optional(element)||(nickname.test(value)&&newLength<=14&&newLength>=3);
},"不规范（须为长度不超过14位的中英文、数字或下划线）");
//项目名称验证
$.validator.addMethod("isProjectName",function(value,element){
	var nickname=/^[\u0391-\uFFE5\w]+$/;
	var number = /^\d{5,14}$/;
	var length=value.length;
	var newLength=0;
	if(!number.test(length)){
		for(var i=0;i<value.length;i++){
			if(value.charCodeAt(i)>127){
				newLength = parseInt(newLength)+2;
			}else{
				newLength++;
			}
		}
	}
	return this.optional(element)||(nickname.test(value)&&newLength<=24&&newLength>=3);
},"不规范（须为长度不超过24位的中英文、数字或下划线）");
//用户名长度验证
$.validator.addMethod("loginName",function(value,element){
	var number = /^\d{4,26}$/;
	var length=value.length;
	var newLength=0;
	if(!number.test(length)){
		for(var i=0;i<value.length;i++){
			if(value.charCodeAt(i)>127){
				newLength = parseInt(newLength)+2;
			}else{
				newLength++;
			}
		}
	}
	return this.optional(element)||(newLength<=26&&newLength>=4);
},"昵称须为长度不超过14位的中英文、数字或下划线(一个中文算2位)");

//验证用户名第一个是否为字母或者数字
$.validator.addMethod("firstOfLoginName",function(value,element){
	var checkNumber = /^[A-Za-z0-9]$/;
	var firstChar = value.charAt(0);
	return this.optional(element)||(checkNumber.test(firstChar));
},"用户名的第一个必须为数字或者字母");

//验证码
$.validator.addMethod("isImgCode",function(value,element){
	var imgCode=/^\d{4}$/;
	return this.optional(element)||(imgCode.test(value));
},"验证码格式不正确");

//QQ号码
$.validator.addMethod("isQQNumber",function(value,element){
	var qqNumber=/^\d{5,10}$/;
	return this.optional(element)||(qqNumber.test(value));
},"请输入正确的QQ号码");

//图片格式
$.validator.addMethod("isImage",function(value,element){
	var sign=false;
	var passfix=new Array("jpg","gif","png","jpeg");
	var fix=value.substring(value.lastIndexOf('.')+1,value.length).toLowerCase();
	for(var i=0;i<passfix.length;i++){
		if(passfix[i]==fix){
			sign=true;
			break;
		}
	}
	return this.optional(element)||(sign);
},"图片格式不正确，正确类型包括(jpg,gif,png,jpeg)");


//年-月-日格式时间不能小于今天
$.validator.addMethod("isStartToday",function(value,element){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth()+1;
	var date=now.getDate();
	var s1=""+year+month+date;
	var arr=value.split("-");
	var s2="";
	for(var i=0;i<arr.length;i++){
		s2+=arr[i];
	}
	var b=parseInt(s1)<=parseInt(s2)?true:false;
	return this.optional(element)||b;
},"该日期不能小于今天");

//年-月-日格式时间大于或等于指定时间
$.validator.addMethod("minDate",function(value,element,param){
	var arr1=value.split("-");
	var s1="";
	for(var i=0;i<arr1.length;i++){
		s1+=arr1[i];
	}
	var arr2=param.split("-");
	var s2="";
	for(var i=0;i<arr2.length;i++){
		s2+=arr2[i];
	}
	b=parseInt(s1)>=parseInt(s2)?true:false;
	if($.trim(param)==""){
		b=true;
	}
	return this.optional(element)||b;
},"结束日期不能小于开始日期");


//年-月-日格式时间不能小于今天 Kevin
$.validator.addMethod("isTodayTime",function(value,element){
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth()+1;
	var date=now.getDate();
	var s1=""+year+"/"+month+"/"+date;
	var s2=value;
	var s3=s2.replace(/-/g, "/");
	var b;
	//alert(s2+'===='+s3+'+++++'+Date.parse(s3)+'---'+Date.parse(s1));
	if (Date.parse(s2.replace(/-/g, "/") ) >= Date.parse(s1.replace(/-/g, "/")) ){
		b = true;
	}  else{
		b = false;
	}
	//var b=parseInt(s1)<=parseInt(s2)?true:false;
	return this.optional(element)||b;
},"该日期不能小于今天");
//验证上报日志日期不能超过今天
$.validator.addMethod("isLogTime",function(value,element){
	
},"该日期不能超过今天");
//结束时间不能小于开始时间  Kevin
$.validator.addMethod("isEndTime",function(value,element,param){
	var s0="#"+param;
	var s1=$(s0).val();
	var s2=value;
	var b;
	if (Date.parse(s2.replace(/-/g, "/") ) >= Date.parse(s1.replace(/-/g, "/")) ){
		b = true;
	}  else{
		b = false;
	}
	return this.optional(element)||b;
},"结束日期不能小于开始日期");

//判断充值金额
$.validator.addMethod("isRechange",function(value,element,param){
	var number = /^\d*[.]?\d*$/;
	var b;
	if(value>500){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"单笔充值金额不能超过500且只能为数字");

//判断充值金额
$.validator.addMethod("pricePercent",function(value,element,param){

	var number = /^\d*[.]?\d{1,2}$/;
	var b;
	if(value>100){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"分润比例不能超过100%且只能为数字类型");

$.validator.addMethod("discountPrice",function(value,element,param){

	var number = /^\d*[.]?\d*$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"优惠价格不能小于0且只能为数字类型");

$.validator.addMethod("returnsDays",function(value,element,param){

	var number = /^\d*$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"您输入的不是数字");

$.validator.addMethod("exchageDays",function(value,element,param){

	var number = /^\d*$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"您输入的不是数字");

$.validator.addMethod("isbankcode",function(value,element,param){

	var number = /^\d*$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"您输入的不是数字");

jQuery.validator.addMethod("isName",function(value,element){
	return this.optional(element)|| /^[\u4e00-\u9fa5\u0391_\uFFE5\w]+$/.test(value);
},"由中文,字母,数字,下划线,-,@和.组成");


//分润级别只能为整数
$.validator.addMethod("ruleLevel",function(value,element,param){

	var number = /^([1-9]|10)$/;
	var b;
	if(value<0){
		b = false;
	}else{
		b = true;
	}
	return this.optional(element)||(number.test(value))&&b;
},"请输入为整数的数字");


jQuery.validator.addMethod("isMoney", function(value, element) {
	var reg = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
	var flag=reg.test(value);
	if(flag){
		if(value<=0){
			flag=false;
		}
	}
	return this.optional(element) || (flag);
}, "请正确填写金额");

//最低充值金额
jQuery.validator.addMethod("minChargeMoney", function(value, element) {
	var reg = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
	var flag=reg.test(value);
	if(flag){
		if(value<0.01){
			flag=false;
		}
	}
	return this.optional(element) || (flag);
}, "充值金额不能低于0.01");

jQuery.validator.addMethod("length", function(value, element, param) {
	alert(param);
	var number = /^\d*$/;
	var length = value.length;
	var b;
	if(value.length === param){
		b = true;
	}else{
		b = false;
	}
	return this.optional(element)||(number.test(value))&&b;
},"请输入15位数字");

//正整数
jQuery.validator.addMethod("positiveInteger", function(value, element) {
	var reg = /^[1-9]\d*$/;
	var flag=reg.test(value);
	return this.optional(element) || (flag);
}, "不是正整数");

//正整数
jQuery.validator.addMethod("isBankNumber", function(value, element) {
	var reg = /^\d{16}|\d{19}$/;
	var flag=reg.test(value);
	return this.optional(element) || (flag);
}, "不是银行账号");

//非负数
jQuery.validator.addMethod("nonnegativeNumber",function(value,element){
	var reg=/^\d*(\.\d*)?$/,
		flag=reg.test(value);
	return this.optional(element)||(flag);
}, "请输入非负数");
