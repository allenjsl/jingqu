$(function(){
	//左侧bar 与菜单的切换
	$(".nav li").click(function(){
		alert(1)
		$(".nav li").removeClass("active");
		$(this).addClass("active");
	});
	$(".in-nav-box li").click(function(){
		$(".in-nav-box li").removeClass("active");
		$(this).addClass("active");
	});
});