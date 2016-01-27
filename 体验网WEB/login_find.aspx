<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_find.aspx.cs" Inherits="Adpost.YCH.WEB.login_find" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang="en"> <!--<![endif]-->
<head runat="server">
<meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>阳澄湖半岛--登录</title>
<link href="css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="css/public.css">

<script type="text/javascript" src="js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="js/html5shiv.js"></script> 

</head>
<body class="anchor-destination section-experiences page-experiences-single lang-en" data-permanent-class="anchor-destination lang-en">
<form id="form1" runat="server">
<div id="main">
    
<div class="header-mask"></div>
<uc2:WebHeader ID="WebHeader1" runat="server" />
            
<section class="scroll">
    <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
    <div class="text">Scroll down to discover more</div>
</section>

<!--主体内容 BEGIN--> 
<section class="page">
            
                

<section class="login_body">
	<div class="Monver_login">
  <h2>找回密码<span id="close"></span></h2>
  <div class="login">
    <div class="login_lt left">
      <table>
        <tr>
          <td width="15%">邮箱：</td>
          <td><input type="text" name="txtEmail" class="login_input3" ></td>
        </tr>
        <tr>
          <td colspan="2">重置密码将发送到您的邮箱中，请注意查收！</td>
        </tr>
        <tr>
          <td></td>
          <td><asp:Button ID="btnResetPassword" runat="server" Text="找回密码" 
                  CssClass="login_lt_btn" onclick="btnResetPassword_Click"></asp:Button></td>
        </tr>
      </table>
    </div>
    <div class="login_rt right">
      <table><!--
        <tr>
          <td colspan="3">官方合作账号登录</td>
        </tr>
        <tr>
          <td><a href="#"><img src="images/parnter_login1.jpg"></a></td>
          <td><a href="#"><img src="images/parnter_login2.jpg"></a></td>
          <td><a href="#"><img src="images/parnter_login3.jpg"></a></td>
        </tr>-->
        <tr>
          <td colspan="3"><img src="/images/about_img24.jpg" width="348px" style="border:1px solid #DFDFDF; margin-top:10px;"></td>
        </tr>
      </table>
    </div>
  </div>
  <div style="clear:both;"></div>
</div>
	<div style="clear:both;"></div>

</section>





<div style="clear:both;"></div>

<section class="go-top">
	<a href="#" class="anchor top-of-page"><span class="animated-picto"><img width="69" height="61" src="images/home.png" alt="" /></span><span class="separator"></span><span class="text">回到顶部</span></a>
</section>
<uc3:WebFooter ID="WebFooter1" runat="server" />

            </section>
<!--主体内容 END--> 
</div>
</form> 
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/oneself.js"></script>

<script type="text/javascript" src="js/default.randheli.min1.js"></script>
<script>
    var app = null;

    $(function () {
        app = new App(
			null,
			{
			    section: 'experiences',
			    page: 'experiences-single',
			    env: 'production',
			    base_url: 'index.htm',
			    header_open: 'default',
			    is_tablet: false,
			    fixedTop: 0,
			    is_mobile: false
			}
		);
    });
</script>


</body>
</html>
