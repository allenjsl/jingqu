<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-info_Upload.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.user_info_Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/jquery-1.6.1.min.js" type="text/javascript"></script>
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
	<div class="hd-title font24 bold">个人信息</div>
	<a class="hd-user icon" href="user-center.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--inner-wrap begin-->
	<div class="uc-wrap borderBox"></div>
	<dl class="user-list pLR10 clearfix">
		<dt class="userImg borderBox"><a href="user-info.aspx">头像</a></dt>
		<dd class="borderBox userImg"><asp:Literal ID="ltrImg" runat="server"></asp:Literal><i class="icon icon-arrow posA"></i></dd>
		<dt>新头像</dt>
		<dd class="borderBox"><asp:FileUpload ID="imgFileUpload" runat="server" /></dd>
	</dl>
    <dl>
    	<div class="member_card"><asp:Button ID="btnSave" runat="server" 
                CssClass="submit_btn" Text="提 交" onclick="btnSave_Click" /></div>
    </dl>
</div>
            
<div id="cxc"></div>  
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
    </form>
</body>
</html>
