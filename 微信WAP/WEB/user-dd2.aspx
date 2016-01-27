<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-dd2.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.user_dd2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
		<a href="user-center.aspx">
			
		</a>
	</div>
	<div class="hd-title font24 bold">我的订单</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox bg-white">
	<!--inner-wrap begin-->
	<div class="uc-wrap borderBox">
		<div class="my-order">
        	<ul>
            	<li><a href="user-dd.aspx"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==0?" class=\"on\"":"" %>>酒店订单</a></li>
                <li><a href="user-dd.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.美食 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.美食?" class=\"on\"":"" %>>美食订单</a></li>
                <li><a href="user-dd.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.购物订单 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.购物订单?" class=\"on\"":"" %>>购物订单</a></li>
                <li><a href="user-dd.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.娱乐 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.娱乐?" class=\"on\"":"" %>>娱乐订单</a></li>
                <li><a href="user-dd.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.线路 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.线路?" class=\"on\"":"" %>>线路订单</a></li>
                <li><a href="user-dd.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.景点 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.景点?" class=\"on\"":"" %>>景点订单</a></li>
                <li><a href="user-dd2.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.活动 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.活动?" class=\"on\"":"" %>>活动订单</a></li>
            </ul>
        </div>
        <div style="clear:both;"></div>
        <ul class="in-it-list sc-list pLR10">
            <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
            <li class="in-it-items">
                    <h3 class="in-it-title"><%#Eval("productname") %></h3>
                    <div class="in-it-time">&yen;<%#Eval("realamount") %></div>
                    <div class="in-it-time"><%#Eval("code") %></div>
                    <div class="in-it-time"><%#Eval("childrennum")%>份</div>
                    <div class="in-it-time"><%#Eval("num") %>人</div>
                    <div class="my-del"><%#Op(Eval("id").ToString(),(Adpost.YCH.BLL.订单状态)Convert.ToInt32(Eval("orderstatus"))) %></div>
            </li>
                            </ItemTemplate>
                    </asp:Repeater>
        </ul>
	</div>
	
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>

