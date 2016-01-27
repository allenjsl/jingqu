<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Adpost.YCH.WEB.login" %>
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
<title>阳澄湖半岛--Sign in</title>
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
  <h2>会员Sign in<span id="close"></span></h2>
  <div class="login">
    <div class="login_lt left">
      <table>
        <tr>
          <td colspan="2"><input type="text"  name="username" class="login_input1"></td>
        </tr>
        <tr>
          <td colspan="2"><input type="password" name="userpwd" class="login_input2"></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="cbRember" value="1">
            记住我的Sign in<span class="login_reg">Registration</span><span class="login_find"><a href="login_find.aspx">找回密码</a></span></td>
          <td>
              <asp:LinkButton ID="lbtnLogin" runat="server" CssClass="login_lt_btn" OnClick="lbtnLogin_Click">Sign in</asp:LinkButton></td>
        </tr>
      </table>
    </div>
    <div class="login_rt right">
      <table>
       
        <tr>
          <td colspan="3"><img src="images/parnter_login4.jpg" style="border:1px solid #DFDFDF; margin-top:10px;"></td>
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
<uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
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

