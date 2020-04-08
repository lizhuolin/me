function fun_onchange_menu_style(divID){
	$("#"+divID).addClass("active");
	$("#"+divID).siblings().removeClass("active");
}

/**
* 时间加N天
* @author hj
* @param inValue 时间值 格式：yyyy-MM-dd hh:mm:ss
* @param type 加减类型 y-年，m-月，d-日，h-时，mi-分，s-秒
* @param addi 加减数字 可以正，也可以负
* @param outFormat 输入格式 yyyy-MM-dd hh:mm:ss 可自定义
* @return String
*/
function getDataAdd(inValue,type,addi,outFormat){
	
	var re_date = "";
	var syear=0;
	var smonth=0;
	var sday=0;
	var shour=0;
	var smin=0;
	var sec=0;
	var sformat="yyyy";
	
	if (inValue.indexOf(" ")>0){
		var sdate=inValue.split(" ");
		var stmp1=sdate[0];
		var stmp2=sdate[1];
		if (stmp1.indexOf("-")>0){
			sdate=stmp1.split("-");
			syear=Number(sdate[0]);
			if (sdate.length>1){
				smonth=Number(sdate[1]); 
				sformat=sformat+"-"+"MM";
			}
			if (sdate.length>2){
				sday=Number(sdate[2]);  
				sformat=sformat+"-"+"dd";
			}
		}else{
			syear=Number(stmp1);   
		}
		if (stmp2.indexOf(":")>0){
			sdate=stmp2.split(":");
			shour=Number(sdate[0]);   
			sformat=sformat+" "+"hh";
			if (sdate.length>1){
				smin=Number(sdate[1]);   
				sformat=sformat+":"+"mm";
			}
			if (sdate.length>2){
				sec=Number(sdate[2]); 
				sformat=sformat+":"+"ss";
			}
		}else{
			shour=Number(stmp2);   
			sformat=sformat+" "+"hh";
		}
	}else{
		var sdate;
		if (inValue.indexOf("-")>0){
			sdate=inValue.split("-");
			syear=sdate[0];
			if (sdate.length>1){
				smonth=Number(sdate[1]); 
				sformat=sformat+"-"+"MM";
			}
			if (sdate.length>2){
				sday=Number(sdate[2]);  
				sformat=sformat+"-"+"dd";
			}
		}else{
			syear=Number(inValue);   
		}
	}

	 var dout;
	 if (type=="y"){
		 dout = new Date(syear+(addi),smonth-1,sday,shour,smin,sec);   
	 }else if (type=="m"){
		 dout = new Date(syear,smonth+(addi),sday,shour,smin,sec);     
	 }else if (type=="d"){
		dout = new Date(syear,smonth-1,sday+(addi),shour,smin,sec);    
	 }else if (type=="h"){
		 dout = new Date(syear,smonth-1,sday,shour+(addi),smin,sec); 
	 }else if (type=="mi"){
		 dout = new Date(syear,smonth-1,sday,shour,smin+(addi),sec); 
	 }else if (type=="s"){
		 dout = new Date(syear,smonth-1,sday,shour,smin,sec+(addi)); 
	 }
	 if (outFormat!=null && outFormat!="") sformat=outFormat;
	 re_date = dout.Format(sformat); 
	return re_date;
}


/****************************扩展日期Date 格式化、去左右空格函数、给指定日期加上指定时间**********************************************/

//JavaScript Document

//对Date的扩展，将 Date 转化为指定格式的String 
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function(fmt) 
{ //author: meizz 
	var o = { 
	"M+" : this.getMonth()+1, //月份 
	"d+" : this.getDate(), //日 
	"h+" : this.getHours(), //小时 
	"m+" : this.getMinutes(), //分 
	"s+" : this.getSeconds(), //秒 
	"q+" : Math.floor((this.getMonth()+3)/3), //季度 
	"S" : this.getMilliseconds() //毫秒 
	}; 
	if(/(y+)/.test(fmt)) 
	fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	for(var k in o) 
	if(new RegExp("("+ k +")").test(fmt)) 
	fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
	return fmt; 
} 

