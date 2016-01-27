<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hudong-list.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.hudong_list" %>
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
	            $(".nav li").eq(6).addClass("active");
	        });
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon th-banner posR"></div>
		</div>
		<div class="in-box-top"></div>
		<div class="in-main in-box-b-20">
			<div class="xqyj">
            	<a href="hudong-fabiao.aspx">发表</a>
            </div>
		</div>
		<ul class="hd-list">
			<asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
			<li class="big posR">
				<a href="#">
					<img width="405" height="185" src="<%#Adpost.YCH.WAP.Common.NoPhotoDefault(Convert.ToString(Eval("photoaddress"))) %>">
				</a>
				<div class="posA hd-text">
					<p><%#Eval("photoname") %></p><p><%#Eval("create_user_id")%></p>
				</div>
			</li>
			 </ItemTemplate>
                    </asp:Repeater>
		</ul>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
    </form>
<script src="../js/utils.js" type="text/javascript"></script>
</body>
</html>