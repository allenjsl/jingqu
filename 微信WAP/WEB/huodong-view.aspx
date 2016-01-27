<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="huodong-view.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.huodong_view" %>
<!doctype html>
<html lang="en">
<head id="Head1" runat="server">
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
	            $(".nav li").eq(4).addClass("active");
	        });
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon ts-banner posR"></div>
		</div>
		<div class="in-view-img paddingtop60">
			<asp:Literal ID="ltrImg" runat="server"></asp:Literal>
		</div>
		<div class="in-main vm-img">
        <!--
			<h3 class="font-blue normal">活动信息</h3>
			<div class="in-main-items posR">
				<label class="posA">活动地点：</label><asp:Literal ID="ltrAddress" runat="server"></asp:Literal>
			</div>
			<div class="in-main-items posR">
				<label class="posA">报名形式：</label><asp:Literal ID="ltract_registration" runat="server"></asp:Literal>
			</div>
			<div class="in-main-items posR">
				<label class="posA">联系方式：</label><asp:Literal ID="ltrprebookphone" runat="server"></asp:Literal>
			</div>
			
			<div class="in-main-items posR">
				<label class="posA">食餐标准：</label><asp:Literal ID="ltrambitus_restaurant" runat="server"></asp:Literal>
			</div>-->
            <div class="in-main-items posR">
				<label class="posA">活动费用：</label><asp:Literal ID="ltrpriceinfo" runat="server"></asp:Literal>
			</div>
            <div class="in-main-items posR">
				<label class="posA">活动介绍：</label>
			</div> <div><asp:Literal ID="ltrIntro" runat="server"></asp:Literal></div><!--
			<div class="in-main-items posR">
				<label class="posA">行程安排：</label><asp:Literal ID="ltract_process" runat="server"></asp:Literal>
			</div>-->
            <div class="in-main-items posR">
				本次活动已报名<asp:Literal ID="ltrJoinCount" runat="server"></asp:Literal>次，共<span style="color: #74CA31; font-size: 18px;"><asp:Literal ID="ltrJoinPeoNumber" runat="server"></asp:Literal></span>人
			</div>
			<div class="in-main-btn">
            <asp:PlaceHolder ID="phJoin" runat="server">
            <a href="huodong_baoming.aspx?Id=<%=Adpost.YCH.Utility.Utils.GetQueryStringValue("Id") %>" class="big-btn black">我要报名</a></asp:PlaceHolder>
				<a href="bandao-huodong.aspx" class="big-btn green">返回列表</a>
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