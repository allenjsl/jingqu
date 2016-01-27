<ul class="in-nav-box posA">
	<li class="borderBox"><a href="bandao-gaikuang.aspx">半岛概况</a></li>
	<li class="borderBox"><a href="bandao-jingdian.aspx">景点介绍</a></li>
	<li class="borderBox"><a href="bandao-jiaotong.aspx">交通信息</a></li>
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