﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notice-list.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.notice_list" %>
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
	    $(function () {
	        $("#navObj").load("nav.aspx", function () {
	            $(".nav li").eq(7).addClass("active");
	        });
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
		<ul class="in-tab">
			<li class="borderBox"><a href="zixun-list.aspx">新闻资讯</a></li>
			<li class="borderBox active"><a href="notice-list.aspx">通知公告</a></li>
		</ul>
		<div class="in-main">
			<ul class="in-it-list">
                <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
				<li class="in-it-items in-it-zixun">
					<a href="zixun-view.aspx?Id=<%#Eval("Id") %>"><%#ImgSplit(Convert.ToString(Eval("imglist"))) %>
						<h3 class="in-it-title"><%#Eval("create_date","{0:yyyy-MM-dd}") %><i class="icon icon-hot"></i></h3>
						<time class="in-it-time"><%#Eval("webresume") %></time>
						<p class="in-it-text"><%#Eval("title") %></p>
					</a>
				</li>
                </ItemTemplate></asp:Repeater>
			</ul>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
        </form>
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>