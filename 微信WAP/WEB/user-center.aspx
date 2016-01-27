<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-center.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.user_center" %>

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
	<div class="hd-back font16">
		<a href="javascript:history.back()">
			<i class="icon icon-back"></i>返回
		</a>
	</div>
	<div class="hd-title font24 bold">会员中心</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--inner-wrap begin-->
	<div class="uc-wrap borderBox"></div>
	<div class="inner-wrap borderBox uc-wrap">
		<div class="in-nav user-nav posR" style="text-align: center;">
			<a href="#" class="posR"><asp:Literal ID="ltrImg" runat="server"></asp:Literal>
				<span class="user-name"><asp:Literal ID="ltrNickName" runat="server"></asp:Literal></span>
                <span class="qd-btn posA"><asp:Literal ID="ltrRegistrationTex" runat="server"></asp:Literal></span>
			</a>
		</div>
	</div>
	<ul class="user-list pLR10 ">
		<li class="posR"><span class="jf-num posA"><a href="jifen.aspx">积分：<asp:Literal ID="ltrJiFen" runat="server"></asp:Literal></a></span><a href="user-info.aspx"><i class="icon icon-info"></i>个人信息<i class="icon icon-arrow posA"></i></a></li>
		<li><a href="user-dd.aspx"><i class="icon icon-dingdian"></i>我的订单<i class="icon icon-arrow posA"></i></a></li>
		<li><a href="user-sc.aspx"><i class="icon icon-sc"></i>我的收藏<i class="icon icon-arrow posA"></i></a></li>
		<li><a href="user-xl.aspx"><i class="icon icon-xl"></i>我的线路<i class="icon icon-arrow posA"></i></a></li>
		<li><a href="user-yj.aspx"><i class="icon icon-yj"></i>我的游记<i class="icon icon-arrow posA"></i></a></li>
        <li><a href="user-gy.aspx"><i class="icon icon-yj"></i>我的光影<i class="icon icon-arrow posA"></i></a></li><asp:PlaceHolder ID="phJF" runat="server" Visible="false">
		<li><a href="jfList.aspx"><i class="icon icon-yhj"></i>积分商城<i class="icon icon-arrow posA"></i></a></li></asp:PlaceHolder>
	</ul>
	<div class="user-btn">
		<a href="Logout.aspx" class="btn-close">退　出</a>
	</div>
	<address class="font8 center user-address">Copyright © 2014 Yangcheng lake peninsula ONLINE; All Rights Reserved.</address>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
