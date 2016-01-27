// JavaScript Document
$(function(){
	$('.main_list1_next_icon,.main_list3_next_icon').toggle(function(){
			$(this).css({'background':'url(../images/xingcheng-icon4.png) no-repeat 0 21px','background-size':'25px 20px'});
			$(this).parent().next('div.main_list2:first').show();
		},function(){
	        $(this).css({'background':'url(../images/xingcheng-icon3.png) no-repeat 0 21px','background-size':'25px 20px'});
		$(this).parent().next('div.main_list2:first').hide();
			})
	})