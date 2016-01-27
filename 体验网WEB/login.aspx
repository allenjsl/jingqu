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
<html class="no-js" lang="en" xmlns:wb="http://open.weibo.com/wb"> <!--<![endif]-->
<head runat="server">
<meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>阳澄湖半岛--登录</title>
<link href="css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="css/public.css">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script><!--
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" charset="utf-8" data-appid="<%=QQAppid %>" data-redirecturi="<%=Request.Url.AbsoluteUri %>" data-callback="true"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=<%=WBAppid %>&debug=true" type="text/javascript" charset="utf-8"></script>-->
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
  <h2>会员登录<span id="close"></span></h2>
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
            记住我的登录<span class="login_reg">注册</span><span class="login_find"><a href="login_find.aspx">找回密码</a></span></td>
          <td><asp:Button ID="btnLogin" runat="server" CssClass="login_lt_btn" OnClick="lbtnLogin_Click" Text="登录" /></td>
        </tr>
      </table>
    </div>
    <div class="login_rt right">
      <table><!--
        <tr>
          <td colspan="3">官方合作账号登录</td>
        </tr>
        <tr>
          <td><div id="wb_connect_btn" ></div></td>       
          <td><span id="qqLoginBtn"></span></td>
        </tr>    -->
        <tr>
          <td colspan="3"><img src="/images/about_img24.jpg" width="348px" style="border:1px solid #DFDFDF; margin-top:10px;"></td>
        </tr>
      </table>
    <script type="text/javascript">
        /*
        WB2.anyWhere(function (W) {
            W.widget.connectButton({
                id: "wb_connect_btn",
                type: '3,2',
                callback: {
                    login: function (o) { //登录后的回调函数
                        alert("login: " + o.screen_name)
                    },
                    logout: function () { //退出后的回调函数
                        alert('logout');
                    }
                }
            });
        });
        */
        </script>
       
        <script type="text/javascript">
         /*
           //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中  
           QC.Login({  
               //btnId：插入按钮的节点id，必选  
               btnId: "qqLoginBtn",
               //用户需要确认的scope授权项，可选，默认all  
               scope:"all",  
               //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S  
               size: "A_M"
           }, function(reqData, opts){//登录成功  
               //根据返回数据，保存数据  
               QC.Login.fillUserInfo(opts['btnId'], reqData);
               //昵称
               nickname = QC.String.escHTML(reqData.nickname);
               //头像
               head = reqData.figureurl_qq_2;
               //用户身份的唯一标识
               var strOpenId = "";
               //令牌 
               var strAccessToken = "";
               QC.Login.getMe(function (openId, accessToken) {
                   strOpenId = openId;
                   strAccessToken = accessToken;
                   //保存用户数据，并登陆                   
                   $.ajax({
                       type: "post",
                       cache: false,
                       url: "/CommonPage/OAuthLogin.ashx?Target=<%=Target%>&LoginType=QQ&openId=" + strOpenId + "&accessToken=" + strAccessToken + "&head=" + head + "&nickname=" + escape(nickname),
                   dataType: "json",
                   success: function (ret) {
                       //ajax回发提示
                       if (ret.result != "0") {
                           alert(ret.msg);
                           window.location.href = "/member/member_info.aspx";
                       } else {
                           alert(ret.msg);
                       }
                   },
                   error: function () {
                       tableToolbar._showMsg(tableToolbar.errorMsg);
                       $("#btnSave").text("保 存");
                       PageJsDataObj.BindBtn();
                   }
               });
                });  
           }, function(opts){//注销成功  
               alert('QQ登录 注销成功');  
           }  
        );  
        */
    </script>
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

