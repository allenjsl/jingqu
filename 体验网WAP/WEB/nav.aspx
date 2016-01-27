<ul class="nav">
	<li><a href="bandao-gaikuang.aspx" class="nav1 icon"></a></li>
	<li><a href="bandao-meishi1.aspx" class="nav2 icon"></a></li>
	<li><a href="paidui.aspx" class="nav3 icon"></a></li>
	<li><a href="hudong-list.aspx" class="nav4 icon"></a></li>
	<li><a href="bandao-huodong.aspx" class="nav5 icon"></a></li>
	<li><a href="tehui-list.aspx" class="nav6 icon"></a></li>
	<li><a href="visitor-zbxx.aspx" class="nav7 icon"></a></li>
	<li><a href="vistor-tsjy.aspx" class="nav8 icon"></a></li>
</ul>
<script>
$(function(){
	//左侧bar 与菜单的切换
	$(".nav li").click(function(){
		$(".nav li").removeClass("active");
		$(this).addClass("active");
	});
});
$(".yc-box").click(function () {
    if ($(this).hasClass("yc-close")) {
        $(".yc-box").removeClass("yc-close").addClass("yc-open");
        $(".nav").animate({ left: '-70px' }, 300);
        $(".inner-wrap").animate({ paddingLeft: '0px' }, 300);
    }
    else {
        $(".yc-box").removeClass("yc-open").addClass("yc-close");
        $(".nav").animate({ left: '0px' }, 300);
        $(".inner-wrap").animate({ paddingLeft: '70px' }, 300);
    }

});

</script>