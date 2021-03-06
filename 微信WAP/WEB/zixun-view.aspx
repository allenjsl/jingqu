﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zixun-view.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.zixun_view" %>
<!doctype html>
<html lang="en">
<head runat="server">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
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
	    $("#navObj").load("nav.aspx", function () {
	        $(".nav li").eq(7).addClass("active");
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon zx-banner posR"></div>
		</div>
		<div class="in-slider">
			<asp:Literal ID="ltrImg" runat="server"></asp:Literal>
		</div>
		<div class="in-main in-main-view">
		    <h3 class="font-blue normal"><asp:Literal ID="ltrTitle" runat="server"></asp:Literal></h3>
		    <div class="in-text">
		    	<asp:Literal ID="ltrNewsInfo" runat="server"></asp:Literal>
		    </div>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
    </form>
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>