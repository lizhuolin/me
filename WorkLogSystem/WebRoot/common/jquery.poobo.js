/*
 * poobo js插件
 * Copyright (c) 2016 poobo

 * email: malei@poobo.com
 * Date: 2016-01-10
 */
;(function($, window, document, undefined) {
	/**
	 * savePath —— 必填，文件存放子目录，如headImg、orderImg等
	 * onUploadSuccess ——　选填，function(data)，data为返回结果
	 * onUploadError —— 选填，function(errorCode,errorMsg,errorString)
	 * opts —— 选填，自定义选项，根据uploadify官方用法
	 */
	$.fn.pooboFilePlugin=function(savePath,onUploadSuccess,onUploadError,opts){
//		alert(getJsessionid());
        var defaults={
            'swf':'uploadify/uploadify.swf',
            "fileObjName":"uploadFiles",
            'uploader':'json_fileoperate_FileOperateAction_uploadOneFileToTemp;jsessionid='+glocalMeId,
            //文件存放子目录，如headImg,orderImg等
            'formData':{'savePath':'temp'},
            "debug":false,
            "method":"post",
            'onUploadSuccess':function(file,data,response){
                alert('The file '+file.name+' was successfully uploaded with a response of '+response+':'+data);
                alert($(this).attr("id"));
            },
            'onUploadError':function(file,errorCode,errorMsg,errorString){
                if(errorString=="IO Error"){
              	  opFail("上传失败(错误码："+errorString+")");
                }
            }
        }
        $(this).uploadify($.extend({},defaults,{
            'formData':{'savePath':savePath},
            'onUploadSuccess':function(file,data,response){
            	onUploadSuccess(JSON.parse(data).resultData);
            },
            'onUploadError':function(file,errorCode,errorMsg,errorString){
            	onUploadError(errorCode,errorMsg,errorString);
            }
        },opts));
    }
	function getJsessionid(){
		getCookie('JSESSIONID');
	}
	function getCookie(c_name){
		var cookie=document.cookie;
		if(cookie.length>0){
			c_start=cookie.indexOf(c_name + "=")
			if(c_start!=-1){ 
				c_start=c_start + c_name.length+1 
				c_end=cookie.indexOf(";",c_start)
				if(c_end==-1) c_end=cookie.length
				return unescape(cookie.substring(c_start,c_end));
			}
		}
	}
	 
})(jQuery, window, document);