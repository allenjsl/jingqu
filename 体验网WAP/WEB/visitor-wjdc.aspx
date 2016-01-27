<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitor-wjdc.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.visitor_wjdc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
	<div class="hd-back font16"><i class="yc-box yc-icon yc-close"></i>
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
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
	<!--load begin-->
		<div class="in-nav yk-nav posR">
			<!--load begin-->
			<div id="fmnavObj">
            	<ul class="in-nav-box posA">
                    <li class="borderBox"><a href="visitor.aspx">功能介绍</a></li>
                    <li class="borderBox active"><a href="visitor-wjdc.aspx">问卷调查</a></li>
                    <li class="borderBox"><a href="visitor-cjwt.aspx">常见问答</a></li>
                    <li class="borderBox"><a href="visitor-zbxx.aspx">周边信息</a></li>
                </ul>
            </div>
			
			<!--load end-->
			<!--load注释里面内容请开发时换用include引用-->
		</div>
			
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->

		<div class="index-class">
        	<div class="wjdt">
				<ul>
                <asp:Repeater ID="rptList" runat="server">
                <ItemTemplate><li><span><%#Eval("starttime", "{0:yyyy-MM-dd}")%></span><a href="visitor-wjdcview.aspx?Id=<%#Eval("id") %>"><%#Eval("name")%></a></li></ItemTemplate>
                </asp:Repeater>
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
