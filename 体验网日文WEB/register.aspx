<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Adpost.YCH.WEB.register" %>
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
<title>阳澄湖半岛--ログイン</title>
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
	<div class="Monver_register">
  <h2>新規取得会员<span id="close"></span></h2>
  <div class="register">
    <table>
      <tr>
        <td width="10%" align="right">用户名</td>
        <td width="50%"><input type="text" name="username" id="username"></td>
        <td width="40%"><div class="register_error" id="usernameTip_error"></div>
          <div class="register_true" id="usernameTip_true"></div></td>
      </tr>
      <tr>
        <td align="right">密码</td>
        <td><input type="password" name="userpwd" id="userpwd" /></td>
        <td><div class="register_error" id="userpwdTip_error"></div>
          <div class="register_true" id="userpwdTip_true"></div></td>
      </tr>
      <tr>
        <td align="right">确认密码</td>
        <td><input type="password" name="userpwd1" id="userpwd1" /></td>
        <td><div class="register_error" id="userpwd1Tip_error"></div>
          <div class="register_true" id="userpwd1Tip_true"></div></td>
      </tr>
      <tr>
        <td align="right">邮箱</td>
        <td><input type="text" name="usermail" id="usermail" /></td>
        <td><div class="register_error" id="usermailTip_error"></div>
          <div class="register_true" id="usermailTip_true"></div></td>
      </tr>
      <tr>
        <td align="right">来自</td>
        <td colspan="2"><select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');">
          </select>
          &nbsp;&nbsp;
          <select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');">
          </select>
          &nbsp;&nbsp; <span id="seachdistrict_div">
          <select id="seachdistrict" name="seachdistrict">
          </select>
          </span></td>
      </tr>
      <tr>
        <td></td>
        <td colspan="2">
            <asp:Button ID="btnSave" CssClass="submit_btn" runat="server" Text="提 交" OnClick="btnSave_Click" />
          <input type="reset" class="reset_btn" value="重 置" /></td>
      </tr>
    </table>
    <div class="register_bottom">
      <p>官方合作账号ログイン</p>
      <span><a href="#"><img src="images/parnter_login1.jpg" /></a><a href="#"><img src="images/parnter_login2.jpg" /></a><a href="#"><img src="images/parnter_login3.jpg" /></a></span> </div>
  </div>
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
<script type="text/javascript" src="js/zepto.min.js"></script> 


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

<!--选项卡-->
<script type="text/javascript">
    $(function () {
        $('.tabPanel ul li').click(function () {
            $(this).addClass('hit').siblings().removeClass('hit');
            $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
        })
    })
</script>



<!--アンケート-->
<script type="text/javascript">
    $(document).ready(function () {

        //幻灯片元素与类“menu_body”段与类“menu_head”时点击
        $("#firstpane .menu_body:eq(0)").show();
        $("#firstpane div.menu_head").click(function () {
            $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });

        //滑动与类“menu_body”的元素，当鼠标悬停段
        $("#secondpane .menu_body:eq(0)").show();
        $("#secondpane div.menu_head").mouseover(function () {
            $(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });

    });
</script>

<!--地区联动-->
<script src="js/Area.js" type="text/javascript"></script>
<script src="js/AreaData_min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
    });

    //得到地区码
    function getAreaID() {
        var area = 0;
        if ($("#seachdistrict").val() != "0") {
            area = $("#seachdistrict").val();
        } else if ($("#seachcity").val() != "0") {
            area = $("#seachcity").val();
        } else {
            area = $("#seachprov").val();
        }
        return area;
    }

    //根据地区码查询地区名
    function getAreaNamebyID(areaID) {
        var areaName = "";
        if (areaID.length == 2) {
            areaName = area_array[areaID];
        } else if (areaID.length == 4) {
            var index1 = areaID.substring(0, 2);
            areaName = area_array[index1] + " " + sub_array[index1][areaID];
        } else if (areaID.length == 6) {
            var index1 = areaID.substring(0, 2);
            var index2 = areaID.substring(0, 4);
            areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
        }
        return areaName;
    }
</script>

</body>
</html>

