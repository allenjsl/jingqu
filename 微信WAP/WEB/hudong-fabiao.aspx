<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hudong-fabiao.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.hudong_fabiao" %>
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
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
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
		
		<div class="xqyj-fb">
        	<table>
            	<tr>
                	<td width="25%;">图片：</td>
                    <td>
                        <asp:FileUpload ID="imgFileUpload" runat="server" /></td>
                    <td><span></span></td>
                </tr>
                <tr>
                	<td>标题：</td>
                    <td><input class="xqyj_input_title" type="text" name="title"></td>
                    <td></td>
                </tr>
                <tr>
                	<td>介绍：</td>
                    <td><textarea class="xqyj_are_nr" name="content"></textarea></td>
                    <td></td>
                </tr>
                <tr>
                	<td></td>
                    <td><asp:Button ID="btnSave" CssClass="xqyj_submit" runat="server" Text="提 交" OnClick="btnSave_Click" /></td>
                    <td></td>
                </tr>
            </table>
        </div>
	</div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
