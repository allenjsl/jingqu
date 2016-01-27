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
		<div class="in-slider">
			<img src="../images/jingdian_slide1.jpg" alt="">
		</div>
		<div class="in-main in-main-view">
		    <h3 class="font-blue normal">奥特兰斯购物村</h3>
		    <div class="in-text">
		    	江苏省苏州阳澄湖半岛旅游度假区（以下简称度假区）位于苏州工业园区东北部、阳澄湖南岸，由湖心岛、东半岛、西半岛和小西湖组成，三面环湖，自然风光优美，人文景观优良，交通区位优越，规划总面积20.84平方公里，其中陆地面积13.04平方公里，水域面积7.8平方公里。度假区立足“精品高端和绿色生态”的发展定位，围绕“国家级旅游度假区和现代化、国际化、园林化的新型滨水休闲养生度假胜地”的发展目标，将打造成为集高端养生养老、精品会议和主题度假酒店、主题文化娱乐、特色商业、生态农业、生态居住等多功能于一体的综合性新型旅游度假胜地。
		    	度假区内道路、桥梁、绿化、驳岸及市政配套设施建设全部到位，已建成国家4A级旅游景区重元寺、五星级澜廷度假酒店、商旅半岛酒店、苏州首条环湖休闲观光自行车道、莲池湖公园、植物景观园、阳澄食街、浦田现代生态农业园、阳澄农庄及浅水湾商业街等。2010年，度假区被列为“苏州市服务业发展重点集聚区”，2011年获批为首批苏州“市级旅游度假区”和“江苏省旅游度假（实验）区
		    </div>
		</div>
		<div class="in-jingdian-nav">
			<a href="jingdian-view.aspx" class="intro active" title="介绍"></a>
			<a href="jingdian-map.aspx" class="map"  title="地图"></a>
			<a href="jingdian-raider.aspx" class="raider"  title="攻略"></a>
			<a href="jingdian-tickt.aspx" class="tickt"  title="门票"></a>
			<a href="jingdian-share.aspx" class="share"  title="分享"></a>
			<a href="jingdian-comment.aspx" class="comment"  title="评论"></a>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>