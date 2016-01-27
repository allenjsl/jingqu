<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tehui-list.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.tehui_list" %>
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
			<div class="icon tk-banner posR"></div>
		</div>
		<div style="height:60px;">
			
			<!--load注释里面内容请开发时换用include引用-->
		</div>
		<div class="in-main">
			<ul class="th-list">
                <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
				<li class="posR"><img src="<%#Adpost.YCH.WAP.Common.NoPhotoDefault(Convert.ToString(Eval("photo"))) %>">
						<h3 class="in-it-title"><%#Eval("title") %><i class="icon icon-hot"></i></h3>
						<a class="posA" href="tehui-view.aspx?Id=<%#Eval("Id") %>">点击查看详情</a>
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