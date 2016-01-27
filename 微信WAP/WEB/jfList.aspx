<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jfList.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.jfList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假村</title>
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
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox bg-white">
	<!--inner-wrap begin-->
	<ul class="in-it-list sc-list pLR10">
    <asp:Repeater ID="rptItemsList" runat="server">
                    <ItemTemplate>
             <li class="in-it-items clearfix">
                <%#PhotoList(Convert.ToString(Eval("wapphoto"))) %>
                <h3 class="font16 ellipsis "><%#Eval("good_name") %></h3>
                <div class="in-it-time font-red">积分：<%#Eval("price") %></div>
                <a href="javascript:BuyIt('<%#Eval("id") %>')" class="dh-btn">立即兑换</a>
              </li>
              </ItemTemplate></asp:Repeater>
	</ul>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
<script>
    function BuyIt(Id) {
        if (confirm("是否确认兑换？")) {
            window.location = "InteralShowDetail.aspx?Id=" + Id;
        }
    }
</script>
    </form>
</body>
</html>
