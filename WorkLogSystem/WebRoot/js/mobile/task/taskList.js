$(function($) {
	$('#users').change(function(){
		searchForm();
	});
	$('#taskMsg').change(function(){
		searchForm();
	});
	
		//滑动条事件
			   $(window).scroll(function () {
			        var scrollTop = $(this).scrollTop();
			        var scrollHeight = $(document).height();
			        var windowHeight = $(this).height();
			        if (scrollTop + windowHeight == scrollHeight) {
			      //此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作
			        var rowIndex = $(".data").length;
			        //redgiftList(page);
			        //$("#redgiftNextPage").attr('currentpage', page + 1);
			        getNextPageData(rowIndex);
			       }
			    });

			
	
	
	
});

function getNextPageData(rowIndex){
	$.ajax({
		   type: "POST",
		   url: "mobile/task/mobile_ajaxTaskList4Mobile.action",
		   data:{"rowIndex": rowIndex},
		   dataType:"html",
		   success: function(data){
			   $("#tasks").append(data);
		   }
		});

}

function searchForm(){
	$.ajax({
		   type: "POST",
		   url: "mobile/task/mobile_ajaxTaskList4Mobile.action",
		   data:$("#searchForm").serialize(),
		   dataType:"html",
		   success: function(data){
			   $("#tasks").html(data);
		   }
		});
	
	
}






/*$('#users').change(function(){
	var userId = $(this).children('option:selected').val();
	$.ajax({
		url: "json_task_searchTaskByUserId.action?userId="+userId,
		dataType:'html',
		success: function(data){
			alert("返回搜索结果："+data);
			$("#tasks").html(data);
		}
	});
});
*/

var slots={},c=document.getElementById('loadingProgress');

//window.hasLoaded = 0;
//window.loading = false;
window.ulp = ulp;

function setLoadingProgress(){
	var progresses = $(".loadingProgress");
	var nums = $(".loadedNum");
	var percents =  $(".taskProgress");
	//循环设置每一个进度
	for(var i=0; i<progresses.length;i++ ){
		slots={};
		ctx=progresses[i].getContext('2d');
		var value = percents[i].defaultValue;
		var num = value.split('%')[0];
		ulp(num,nums[i],ctx);
	}
	
}



function ulp(percent,loadedNum,ctx){
	var loading = true;
	var hasLoaded = 0;
    var i = 0, draw = null;
    draw = setInterval(function(){
    	
        if (hasLoaded > 100) {
            loading = false;
            clearInterval(draw);
            draw = null;
            return true;
        }

        if (i<=percent) {
            d(loadedNum,ctx,hasLoaded);
            i++;
            hasLoaded += 1;
        } else {
            clearInterval(draw);
            draw = null;
        }
    }, 20);
}

function d(lp,ctx,hasLoaded){
    /*var lp = document.getElementById('loadedNum');*/
    lp.innerHTML = hasLoaded+"%";
    var loaded = hasLoaded * 2 / 100 * Math.PI, cw = 102, hcw = 51;
    ctx.clearRect (0,0,cw,cw);
    ctx.beginPath();
    ctx.arc(hcw,hcw,hcw-4, 0, loaded, false);
    ctx.lineWidth = 8;
    ctx.strokeStyle = '#ff6000';
    ctx.stroke();
}
//ulp();