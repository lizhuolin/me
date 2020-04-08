$(function(){
	
	
//首页js  *******start
	
	$(".menu>li>a").click(function(){
		if($(this).children("i").hasClass("icon-you")){
			$(this).children("i").removeClass("icon-you");
			$(this).children("i").addClass("icon-circle_down_on");
			$(this).siblings("ul").slideDown("slow");
			$(this).parent("li").siblings("li").find("i").removeClass("icon-circle_down_on");
			$(this).parent("li").siblings("li").find("i").addClass("icon-you");
			$(this).parent("li").siblings("li").children("ul").slideUp("slow");
		}else{
			$(this).children("i").removeClass("icon-circle_down_on");
			$(this).children("i").addClass("icon-you");
			$(this).siblings("ul").slideUp("slow");
			$(this).siblings("ul").children("li").removeClass("select");
		}
		
	});
	
	$(".sub_menu>li>a").click( function(){
	    $(this).parent("li").addClass("select");
		$(this).parents("li").siblings("li").removeClass("select");
	});
	
	$(".flex_menu").click( function(){
		if($(this).children("i").hasClass("icon-jiantouzuo")){
			$(this).animate({left:"0"},500);
			$(this).siblings("aside").animate({left:"-300px"},500);
			$(this).children("i").removeClass("icon-jiantouzuo");
			$(this).children("i").addClass("icon-jiantouyou");
			$(".main").css("padding-left",0);
			$(".main_top").width("100%");
			$(".main_bottom").width("100%");
		}else{
			$(this).animate({left:"260px"},500);
			$(this).siblings("aside").animate({left:"0"},500);
			$(this).children("i").removeClass("icon-jiantouyou");
			$(this).children("i").addClass("icon-jiantouzuo");
			$(".main").css("padding-left",280);
		}
	})
	
	//首页js  *******end
	
	
	
});
