<ul class="in-nav-box posA">
	<li class="borderBox"><a href="bandao-meishi1.aspx">美食推荐</a></li>
	<li class="borderBox"><a href="bandao-jiudian1.aspx">酒店推荐</a></li>
	<li class="borderBox"><a href="bandao-gouwu1.aspx">购物推荐</a></li>
	<li class="borderBox"><a href="bandao-yule1.aspx">娱乐推荐</a></li>
	<li class="borderBox"><a href="bandao-xianlu1.aspx">线路推荐</a></li>
    <li class="borderBox"><a href="bandao-jingdian1.aspx">景点推荐</a></li>
	<!--<li class="borderBox"><a href="bandao-huodong.aspx">最新活动</a></li>-->
</ul>
<script>
$(function(){
	//左侧bar 与菜单的切换
	$(".in-nav-box li").click(function(){
		$(".in-nav-box li").removeClass("active");
		$(this).addClass("active");
	});
});
</script>