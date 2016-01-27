$(function() {
	//url data function dataType
	function loadMeinv() {
		var data = 0;
		for (var i = 0; i < 25; i++) {//每次加载时模拟随机加载图片
			data = parseInt(Math.random() * 25);
			var html = "";
			html = '<li><div class="water_pic"><a href="#"><img src =images/flow_img'
				+ data + '.jpg></a></div><div class="water_user">'
				+ data + '</div><div class="water_main"><p>'+data+'</p><span class="flow_click">...[+]</span></div><div class="water_option"></div></li>';
			$minUl = getMinUl();
			$minUl.append(html);
		}
	}
	loadMeinv();
	//无限加载
	$(window).on("scroll", function() {
		$minUl = getMinUl();
		if ($minUl.height() <= $(window).scrollTop() + $(window).height()) {
			//当最短的ul的高度比窗口滚出去的高度+浏览器高度大时加载新图片
			//loadMeinv();//加载新图片
		}
	})
	function getMinUl() {//每次获取最短的ul,将图片放到其后
		var $arrUl = $("#container .col");
		var $minUl = $arrUl.eq(0);
		$arrUl.each(function(index, elem) {
			if ($(elem).height() < $minUl.height()) {
				$minUl = $(elem);
			}
		});
		return $minUl;
	}
	//点击更多加载
	$("#loadMeinvMOre").click(function() {
		$minUl = getMinUl();
		loadMeinv();
	});
	
})
