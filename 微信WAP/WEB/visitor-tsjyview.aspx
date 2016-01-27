<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitor-tsjyview.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.visitor_tsjyview" %>

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
	<div class="hd-back font16">
		<a href="javascript:void(0);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin--><!--
		<div class="in-nav yk-nav posR">
			<div id="fmnavObj">
            	<ul class="in-nav-box posA">
                    <li class="borderBox"><a href="visitor.aspx">功能介绍</a></li>
                    <li class="borderBox"><a href="visitor-wjdc.aspx">问卷调查</a></li>
                    <li class="borderBox"><a href="visitor-cjwt.aspx">常见问答</a></li>
                    <li class="borderBox active"><a href="visitor-tsjy.aspx">投诉建议</a></li>
                    <li class="borderBox"><a href="visitor-zbxx.aspx">周边信息</a></li>
                </ul>
            </div>
		</div>
			-->
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->

        <div class="cjwt">
           <table>
           		<tr>
                	<td width="15%">类别</td>
                    <td><input type="radio" name="lb" value="1">投诉&nbsp;&nbsp;&nbsp;<input type="radio" name="lb" value="2" checked="checked">建议</td>
                </tr>
                <tr>
                	<td rowspan="2">对象</td>
                    <td><select class="lodge_select1" name="ddlType" id="ddlType" onchange="ChangHotspotList(document.getElementById('hotspotId'),this.options[this.selectedIndex].value,0)"><option value="1">景点</option><option value="6">酒店</option><option value="3">餐馆</option></select></td>
                </tr>
                <tr>
                	<td><select class="lodge_select1" name="hotspotId" id="hotspotId"><%=strScenicsList %></select></td>
                </tr>
                <tr>
                	<td>标题</td>
                    <td><input type="text" name="title" class="tsjy-input2"></td>
                </tr>
                <tr>
                	<td>内容</td>
                    <td><textarea name="remark"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2" align="center"><asp:Button ID="btnSubmit" CssClass="login_btn1" runat="server" Text="提 交" OnClick="btnSubmit_Click" /></td>
                </tr>
           </table>
        </div>	

	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->

<script src="../js/utils.js" type="text/javascript"></script>
    </form>
</body>
</html>
