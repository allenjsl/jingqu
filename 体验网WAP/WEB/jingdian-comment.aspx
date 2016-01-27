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
		$("#navObj").load("nav.aspx",function(){
			$(".nav li").eq(1).addClass("active");
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
		<div class="in-box-top"></div>
		<div class="in-main in-raidar">
			<h3 class="font-blue normal">评论和游记</h3>
			<p class="in-raidar-p font12">在此发表您对本景点的看法。感谢您的参与！</p>
			<form action="">
				<div class="form-items">
					<input type="radio" name="commentName" checked>评论
					<input type="radio" name="commentName">游记
				</div>
				<div class="form-items">
					<input type="text" placeholder="请输入标题">
				</div>
				<div class="form-items">
					<textarea name="" id="" cols="30" rows="10"  placeholder="请输入内容"></textarea>
				</div>
				<div class="form-btn">
					<a href="#" class="big-btn green">发表</a>
					<a href="#" class="big-btn black">取消</a>
				</div>
			</form>
		</div>
		<div class="in-jingdian-nav">
			<a href="jingdian-view.aspx" class="intro" title="介绍"></a>
			<a href="jingdian-map.aspx" class="map "  title="地图"></a>
			<a href="jingdian-raider.aspx" class="raider "  title="攻略"></a>
			<a href="jingdian-tickt.aspx" class="tickt"  title="门票"></a>
			<a href="jingdian-share.aspx" class="share"  title="分享"></a>
			<a href="jingdian-comment.aspx" class="comment active"  title="评论"></a>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>