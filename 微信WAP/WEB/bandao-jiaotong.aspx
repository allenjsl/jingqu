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
			$("#navObj").load("nav.aspx" ,function(){
				$(".nav li").eq(0).addClass("active");
			});
		});
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon fm-banner posR"></div>
		</div>
		<div class="in-nav jt-nav posR">
			<!--load begin-->
			<div id="fmnavObj"></div>
			<script>
				$(function(){
					$("#fmnavObj").load("fmNav.aspx",function(){
						$(".in-nav-box li").eq(2).addClass("active");
					});
				});
			</script>
			<!--load end-->
			<!--load注释里面内容请开发时换用include引用-->
		</div>
		<div class="in-main">
			<h2 class="in-h2 jt-h2 icon"></h2>
			<div class="in-text">
					<h2 class="font-green font16 normal lineheight150">客车</h2>
					<p>
					1.【沙家浜】
					苏州汽车北站有直达沙家浜的中巴。如果自己开车前往，可以从沪宁高速至乍家苏出口，朝苏州方向行至常熟，进入常熟市区以后，按照指示牌，便可以到达沙家浜。<br><br>

					2.【阳澄湖镇】
					在苏州汽车北站，乘69路公交车可以直达阳澄湖镇。对于自驾车的游客，先走沪宁高速到苏州工业园区出口，进入312国道，直行进入马鞍山路，然后进入民权路，按照指示牌前行，可以直达阳澄湖镇。
<br><br>
					3.【昆山巴城】
					杭州的汽车东站，每天都有6班直达昆山的快客；也可以从苏州北站转车，那里有直达昆山的中巴。然后在昆山长途客车站或是火车站，坐117路公交车就可以直达巴城。自驾车者，可以沿着沪宁高速至苏州出口，然后往东进入312国道，直行便可进入昆山巴城。
<br>
				</p>
			</div>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>