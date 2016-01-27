<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jifen.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.jifen" %>

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
	<table class="jf-tab">
		<tr>
			<th>编号</th>
			<th>类型</th>
			<th>日期</th>
			<th>积分</th>
			<th>详情</th>
		</tr>
		<asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                    <tr>
                    	<td><%#Container.ItemIndex+1 %></td>
                        <td><%#(Adpost.YCH.BLL.订单类型)Eval("billtype")%></td>
                        <td><%#Eval("currentdate","{0:yyyy-MM-dd}")%></td>                        
                        <td><%#((Adpost.YCH.BLL.订单类型)Eval("billtype"))== Adpost.YCH.BLL.订单类型.积分兑换?Eval("outnum"):Eval("innum")%></td>
                        <td><%#Eval("absract")%></td>
                    </tr>
                    </ItemTemplate>
                    </asp:Repeater>
	</table>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
