$(function(){
	changeCss();
	
	
	 $(".tog_icon").click(function(){
		  $(this).toggleClass("up");
		  $(this).toggleClass("down");
		  $(this).siblings(".ord_pro").slideToggle();
	  });
	
	
});

$(window).resize(function(){
	changeCss();
});

function changeCss(){
	

	var as_height = $(window).height()-120;
	$("aside").height(as_height);
	
	var c_width = $(".ord_type").width()+100;
	var m_width = $(".con_disc>table").width()+100;
	var w_width = $(window).width()-280;
	var l_width = $(window).width();
	
	$(".con_btn").width($(".con_disc>table").width());
	
	
		if($(".main").find("table").length>0){
			if(m_width < w_width){
				$(".main").width(w_width);
				$(".main_top").width(w_width);
				$(".main_bottom").width(w_width);
			}else{
				$(".main").width(m_width);
				$(".main_top").width(m_width);
				$(".main_bottom").width(m_width);
			}
		}else{
			if(c_width < w_width){
				$(".main_top").width(w_width);
				$(".main_bottom").width(w_width);
			}else{
				$(".main").width(c_width);
				$(".main_top").width(c_width);
				$(".main_bottom").width(c_width);
			}
		}
		
	
	if(m_width < l_width){
		$(".list_top").width(l_width);
		$(".list_bottom").width(l_width);
	}else{
		$(".list_top").width(m_width);
		$(".list_bottom").width(m_width);
	}

	
}