
/* top 버튼 */
$(document).ready(function(){
	view_topBtn();
	function view_topBtn(){
		$(window).scroll(function(){
			if ($(window).scrollTop() > 0)
			{
				$('#topBtn').fadeIn('fast');
			} else {
				$('#topBtn').fadeOut('fast');
			}
		});
	}

	$('.viewTopArea').click(function(){
		$('html, body').stop().animate({scrollTop:0}, 500);
		return false;
	});
});

//메뉴 마우스 오버 이벤트
$(document).ready(function(){
	var $cate_m = $(".gnb_nav > ul.cate_m > li");	
	$cate_m.find('.sub_menu').children('ul').addClass('sm_dep1');
	$cate_m.find('.sub_menu').children('ul').children('li').children('ul').addClass('sm_dep2');
	$cate_m.find('.sub_menu').children('ul').children('li').children('ul').children('li').children('ul').addClass('sm_dep3');

	$(".gnb_nav > ul.cate_m > li").each(function( index ){
		var $sub_back = $(this).children(".sub_back");
		var $sub_menu = $sub_back.children(".sub_menu");
		var $sm_dep1 = $sub_menu.children(".sm_dep1");
		var $sm_dep2 = $sm_dep1.children().children(".sm_dep2");
		var $sm_dep3 = $sm_dep2.children().children(".sm_dep3");
	  	var $sm_height = $sub_menu.outerHeight();

		$(this).on( "mouseenter", function(e){// 공통 처리
	    	$(this).children("a").addClass("on");
			$sub_back.stop().css({height:$sm_height - 1});
			$sub_back.css('border-bottom','1px solid #e5e5e5');
			$sub_menu.stop().fadeIn('easeInQuart');

			//=================================================================
			//메인 메뉴 위치 조정
			//=================================================================
			//메인
			if ( $(this).parent().attr("id") == 'cate_m_main' ){
				//subMenu 넓이
				var liWidthSum = 0;
				$(this).children('div').children('div').children('ul').children('li').each(function(index2){
					if(index2 > 0) {
						liWidthSum = liWidthSum + ($(this).width()+parseInt($(this).css("margin-right"), 10));	
					}
				});
				
				var leftSpace = $("h1").width();
				
			  if(liWidthSum > 693 && liWidthSum < 901) {
                  leftSpace = leftSpace - (liWidthSum - 693);
              }else if(liWidthSum > 900 && liWidthSum < 1205) {
                  leftSpace = 0;
                  $(this).children('div').children('div').children('ul').css('float','right');
              }else if(liWidthSum > 1204){
                  leftSpace = leftSpace - (liWidthSum - 693);
                  $(this).children('div').children('div').children('ul').css('float','right');
              }

			$cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace-95);
             
			}
		});
		$(this).on( "mouseleave", function(e){// 공통 처리
			$(this).children("a").removeClass("on");
			$sub_back.stop().css({height:0});
			$sub_back.css('border-bottom','0');
			$sub_menu.css('display','none');
		});

	});

	//Top Menu -> 상단 메뉴 드롭다운
	$(".header_dropmemu").mouseover(function(){
		$(this).children(".btn").addClass("on");
		$(this).children("span").siblings("a").addClass("on");
		$(this).children("div").stop().slideDown('fast');
  });
	$(".header_dropmemu").mouseleave(function(){
		$(this).children(".btn").removeClass("on");
		$(this).children("div").stop().slideUp('fast');
  });
	$(".header_dropmemu > .list").mouseover(function(){
		$(this).siblings("span").children("a").addClass("on");
  });
	$(".header_dropmemu > .list").mouseleave(function(){
		$(this).siblings("span").children("a").removeClass("on");
  });

});

