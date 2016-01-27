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
		$("#navObj").load("nav.aspx",function(){
			$(".nav li").eq(3).addClass("active");
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
		<div class="in-map">
			<img src="../images/jingdian_map.jpg" alt="">
		</div>
		<div class="in-jingdian-nav">
			<a href="jiudian-view.aspx" class="intro " title="介绍"></a>
			<a href="jiudian-map.aspx" class="map active"  title="地图"></a>
			<a href="jiudian-raider.aspx" class="raider"  title="攻略"></a>
			<a href="jiudian-room.aspx" class="room"  title="房型"></a>
			<a href="jiudian-share.aspx" class="share"  title="分享"></a>
			<a href="jiudian-comment.aspx" class="comment "  title="评论"></a>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>