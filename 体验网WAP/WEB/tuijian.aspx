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
	<div class="hd-back font16"><i class="yc-box yc-icon yc-close"></i>
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
			$("#navObj").load("nav.aspx" ,function(){
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
			<div class="icon tj-banner posR"></div>
		</div>
		<div class="in-nav ms-nav posR">
			<!--load begin-->
			<div id="fmnavObj"></div>
			<script>
				$(function(){
					$("#fmnavObj").load("tjNav.aspx",function(){
						$(".in-nav-box li").eq(0).addClass("active");
					});
				});
			</script>
			<!--load end-->
			<!--load注释里面内容请开发时换用include引用-->
		</div>
		<div class="in-main">
			<h2 class="in-h2 ms-h2 icon"></h2>
			<ul class="in-it-list">
				<li class="in-it-items">
					<a href="meishi-view.aspx">
						<img src="../images/img_food.jpg" class="in-it-img">
						<h3 class="in-it-title">阳澄湖大闸蟹<i class="icon icon-hot"></i></h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="meishi-view.aspx">
						<img src="../images/img_food.jpg" class="in-it-img">
						<h3 class="in-it-title">阳澄湖大闸蟹</h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="meishi-view.aspx">
						<img src="../images/img_food.jpg" class="in-it-img">
						<h3 class="in-it-title">阳澄湖大闸蟹</h3>
						<p class="in-it-text">阳澄湖大闸蟹，又名金爪蟹，产于苏州阳澄湖...</p>
					</a>
				</li>
				<li class="in-it-items">
					<a href="meishi-view.aspx">
						<img src="../images/img_food.jpg" class="in-it-img">
						<h3 class="in-it-title">阳澄湖大闸蟹</h3>
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