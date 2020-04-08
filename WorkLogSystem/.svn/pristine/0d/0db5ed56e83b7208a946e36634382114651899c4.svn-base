$(function($) {
	$('#users').change(function(){
		searchForm();
	});
	$('#projectName').change(function(){
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
		   url: "mobile/project/mobile_ajaxprojectList4Mobile.action",
		   data:{"rowIndex": rowIndex},
		   dataType:"html",
		   success: function(data){
			   $("#projects").append(data);
			   setLoadingProgress();
		   }
		});

}

function searchForm(){
	$.ajax({
		   type: "POST",
		   url: "mobile/project/mobile_ajaxprojectList4Mobile.action",
		   data:$("#searchForm").serialize(),
		   dataType:"html",
		   success: function(data){
			   $("#projects").html(data);
			   setLoadingProgress();
		   }
		});
	
	
}






$('#users').change(function(){
	var userId = $(this).children('option:selected').val();
	$.ajax({
		url: "json_task_searchTaskByUserId.action?userId="+userId,
		dataType:'html',
		success: function(data){
			$("#projects").html(data);
		}
	});
});


