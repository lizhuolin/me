var overList;
var fullYear=new Date().getFullYear();
var month=new Date().getMonth();
$(function($){
//    	drawTemp( $("#dateId").val());
    	getLog4Today($("#dateId").val());
    	
    });
  
  function drawTemp(data){
	    //ajax请求后台返回已写日志的天
	  jQuery.ajax({
				type: "POST",
				url: rooPath+"/log/json_log_findDateList.action",
				data: {"date":data},
				dataType:'json',
				success: function(data){
					if(data.resultFlag){
						overList=data.resultData;
					 var cale = new Calendar("idCalendar", {
						    Year: fullYear,//显示年
				            Month: month+1,
					        SelectDay: new Date().setDate(10),
					        onSelectDay: function(o){ o.className = "onSelect"; },
					        taskOver: function(o){ o.className = "taskOver"; },
					        taskWait: function(o){ o.className = "taskWait"; },
					        onToday: function(o){ o.className = "onToday"; },
					        onFinish: function(){
					            $("#idCalendarYear").html(this.Year); 
					            $("#idCalendarMonth").html(this.Month);
					            
					            if(isNowMonth(new Date().getFullYear(), new Date().getMonth()+1, this.Year, this.Month)){
					            	//如果是当月
					            	for(var i = 0; i <jQuery("#dateId").val().split("-")[2]; i++){
						            	this.Days[i+1].innerHTML = '<a href="javascript:getLog4Today(\''+this.Year+'-'+this.Month+'-'+(i+1)+'\')">' + (i+1) + '</a>';           
						             }
					            }else{
					            	var d = new Date(this.Year, this.Month, 0);
//					            	alert(d.getDate());
					            	for(var i = 0; i <d.getDate(); i++){
					            		this.Days[i+1].innerHTML = '<a href="javascript:getLog4Today(\''+this.Year+'-'+this.Month+'-'+(i+1)+'\')">' + (i+1) + '</a>';      
					            	}
					            	
					            }
					            
					        }  
					    });
					    $("#idCalendarPre").click("click",function(){ 
					    	 jQuery("#dateId").val(cale.Year+'-'+(cale.Month-1)+'-'+'01');
					    	 var d = new Date(cale.Year, cale.Month-2, 1);
					    	 fullYear = d.getFullYear();
					    	 month = d.getMonth();
					    	 
					    	drawTemp(jQuery("#dateId").val());
//					    	cale.PreMonth(); 
					    	});
					    $("#idCalendarNext").click("click",function(){ 
					    	if(isNowMonth(new Date().getFullYear(), new Date().getMonth()+1, cale.Year, cale.Month+1)){
	                               //是当月
						    		jQuery("#dateId").val(cale.Year+'-'+(cale.Month+1)+'-'+new Date().getDay());
						    }else{
						    	jQuery("#dateId").val(cale.Year+'-'+(cale.Month+1)+'-'+'01');
						    }
					    	
					    	 var d = new Date(cale.Year, cale.Month, 1);
					    	 fullYear = d.getFullYear();
					    	 month = d.getMonth();
					    	 alert(jQuery("#dateId").val());
					    	 drawTemp(jQuery("#dateId").val());
//					    	cale.NextMonth(); 
					    	});
					}
				}
			});
	    
  }
  function goNewPage(url){
	  window.location.href=url;
  } 
 
    
    
    function getLog4Today(data){
    	jQuery("#dateId").val(data);
    	jQuery.ajax({
			type: "POST",
			url: rooPath+"/mobile/log/mobile_logDetail.action",
			data: {"date":data},
			dataType:'html',
			success: function(data){
				jQuery(".log_below").html(data);
			}
		});
    	
    }
    
    

    function ajaxFileUpload() {
        $.ajaxFileUpload({
                url:rooPath + '/fileoperate/fileoperate_imageUpload.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'image',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                data : {"childPath" : "log"},
                success: function (data, status){  //服务器成功响应处理函数
                	 if (typeof(data.error) != 'undefined') {
                         if (data.error != '') {
                        	 opFail(data.error);
                         } else {
                        	$("#headImg").val(data.imagePath);
                        	$("#showImg").append("<div class='uploadFile'><img  src='"+rooPath + '/' + data.imagePath + "'/></div>");
                        	$(".uploadFile>a").click(function(){
                        		$(this).parent('.uploadFile').remove();
                            });
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
  //提交表单
  function doSubmit(date){
  		//提交表单
  	//	document.write("运行了？");
  		//$("#form").submit();
//  		document.forms[0].submit();
  			$.ajax({
  				type: "POST",
  				url: rooPath + "/mobile/log/mobile_mobileEdit.action?date="+date,
  				data: $("#form1").serialize(),
  				success: function(data){
  					opSuccess("保存成功");
  					setTimeout(function(){location.replace(rooPath + "/mobile/log/mobile_log.action?date="+date);},500);
  				}
  			});
//  		getLog4Today(data);
  }
 //更新
  function update(date){
	  $.ajax({
			type: "POST",
			url: rooPath + "/mobile/log/mobile_mobileEdit.action",
			data: $("#form2").serialize(),
			success: function(data){
				opSuccess("保存成功");
				setTimeout(function(){
					location.replace(rooPath + "/mobile/log/mobile_log.action?date="+date);},500);  
			}
		});
  }

  function isNowMonth(nowY,nowM,oY,oM){
	  
	  if(nowY==oY&&nowM==oM){
		  return true;
	  }else{
		  return false;
	  }
  }  


