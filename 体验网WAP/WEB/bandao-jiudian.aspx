﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bandao-jiudian.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.bandao_jiudian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
	    $(function () {
	        $("#navObj").load("nav.aspx", function () {
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
		<div class="in-nav jd-nav posR">
			<!--load begin-->
			<div id="fmnavObj"></div>
			<script>
			    $(function () {
			        $("#fmnavObj").load("tjNav.aspx", function () {
			            $(".in-nav-box li").eq(1).addClass("active");
			        });
			    });
			</script>
			<!--load end-->
			<!--load注释里面内容请开发时换用include引用-->
		</div>
        <div class="in-main">
			<h2 class="in-h2 jd-h2 icon"></h2>
            <h3 style="text-align:center"><asp:Literal ID="ltrName" runat="server"></asp:Literal></h3>
            <div class="in-slider">
			<asp:Literal ID="ltrImg" runat="server"></asp:Literal>
		</div>
            <div class="in-main-info">
            	<p><asp:Literal ID="ltrInfo" runat="server"></asp:Literal></p>
            </div>
			<ul class="in-it-list">
                <asp:Repeater ID="rptItemsList" runat="server">
                    <ItemTemplate>
				<li class="in-it-items">
						<img src="<%#PhotoList(Convert.ToString(Eval("photos"))) %>" class="in-it-img">
						<h3 class="in-it-title"><%#Eval("name") %><i class="icon icon-hot"></i></h3>
						<p class="in-it-text">配置：<%#Eval("facilities") %><br>价格：<%#Eval("price") %>元</p>
                        <p class="in-it-text"><%#BuyButton(Eval("Id").ToString())%></p>
				</li>
               </ItemTemplate></asp:Repeater>
			</ul>
		</div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
