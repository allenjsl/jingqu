<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>

</head>
<body>
<!--header begin-->
<header class="header center">
	<div class="hd-back font16">
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin-->
	<div id="navObj"></div>
	<script>
		$(function(){
			$("#navObj").load("nav.aspx",function(){
				$(".nav li").eq(1).addClass("active");
			});
		});
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon gl-banner posR"></div>
		</div>
		<ul class="in-tab">
			<li class="borderBox"><a href="gonglve-list.aspx">按线路推荐</a></li>
			<li class="active borderBox"><a href="youji-list.aspx">按游记推荐</a></li>
		</ul>
		<div class="in-main">
			<ul class="in-it-list">
				<li class="in-it-items ">
					<a href="youji-view.aspx">
						<img src="../images/img_zixun.jpg" class="in-it-img">
						<h3 class="in-it-title">景点一日游<i class="icon icon-hot"></i></h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="youji-view.aspx">
						<img src="../images/img_zixun.jpg" class="in-it-img">
						<h3 class="in-it-title">景点一日游</h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="youji-view.aspx">
						<img src="../images/img_zixun.jpg" class="in-it-img">
						<h3 class="in-it-title">景点一日游</h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="youji-view.aspx">
						<img src="../images/img_zixun.jpg" class="in-it-img">
						<h3 class="in-it-title">景点一日游</h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>