<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-info.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.user_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
		<dd class="borderBox userImg"><a href="user-info_Upload.aspx"><asp:Literal ID="ltrImg" runat="server"></asp:Literal><i class="icon icon-arrow posA"></i></a></dd>
		<dt><a href="#">名字</a></dt>
		<dd class="borderBox"><a href="user-info.aspx"><asp:Literal ID="ltrName" runat="server"></asp:Literal><i class="icon icon-arrow posA"></i></a></dd>
		<dt><a href="#">邮箱</a></dt>
		<dd class="borderBox"><a href="user-info.aspx"><asp:Literal ID="ltrEmail" runat="server"></asp:Literal><i class="icon icon-arrow posA"></i></a></dd>
	</dl>
	<dl class="user-list pLR10 clearfix">
		<dt><a href="user-info.aspx">性别</a></dt>
		<dd class="borderBox"><a href="user-info.aspx"><asp:Literal ID="ltrSex" runat="server"></asp:Literal><i class="icon icon-arrow posA"></i></a></dd>
	</dl>
	<!--inner-wrap end-->
     <dl>
    	<div class="member_card">
        	<img src="../CommonPage/GetVipCard.ashx?TrueName=<%=TrueName %>&CardNo=<%=CardNo %>">
        </div><asp:PlaceHolder ID="phGetCard" runat="server">
    	<div class="member_card_btn">点击领取会员卡</div></asp:PlaceHolder>
    </dl>
</div>
        <!--会员卡申请弹出层-->
<div id="Monver_card">
    <h2>会员卡申请<span id="close"></span></h2>
    <div class="fload-card">
    <table>
      <tr>
        <td width="25%" align="right">真实姓名:</td>
        <td width="50%"><input type="text" name="truename"></td>
      </tr>
     <tr>
        <td width="25%" align="right">手机号码:</td>
        <td width="50%"><input type="text" name="mobilePhone"></td>
      </tr>
      <tr>
        <td colspan="2"><asp:Button ID="btnGetVipCard" runat="server" CssClass="submit_btn" Text="提 交" OnClick="btnGetVipCard_Click" />
          <input type="reset" class="reset_btn" value="重 置" /></td>
      </tr>
    </table>
    <div class="register_img"><img src="../images/MemberCard1.png"><p>消费前向服务员出示此卡</p></div>
  </div>
  
            </div>
            
<div id="cxc"></div>  
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
<script>
    $(document).ready(function () {
        $(".member_card_btn").click(function () {
            Popuplayer({
                LayerId: "Monver_card",//层ID
                Masklayer: "cxc",//遮罩层ID
                CloseID: "close",//退出id
                Fun: function () { } //关闭时是否回调函数
            });
        });

        $(".submit_btn").click(function () {
            $(".fload-card table").hide();
            $(".register_img").show();
        })
    });
</script>
    </form>
</body>
</html>
