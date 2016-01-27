<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-yj.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.user_yj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
	<div class="hd-title font24 bold">我的游记</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox bg-white">
	<!--inner-wrap begin-->
	<ul class="in-it-list sc-list pLR10">
        <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
		<li class="in-it-items">
			<a href="#">
                <img class="in-it-img" src="<%#Adpost.YCH.WAP.Common.NoPhotoDefault(Convert.ToString(Eval("coverphoto"))) %>">
				<h3 class="in-it-title"><%#Eval("title") %></h3>
				<div class="in-it-time"><%#Eval("create_userid") %></div>
				<div class="in-it-time"><%#Eval("create_date","{0:yyyy-MM-dd}") %></div>
			</a>
		</li>
                            </ItemTemplate>
                    </asp:Repeater>
	</ul>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
