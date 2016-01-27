<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Adpost.YCH.WEB.Default" %>
<%@ Register Src="~/WebControls/WebHeader.ascx" TagPrefix="uc1" TagName="WebHeader" %>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en">
<![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8" lang="en">
<![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9" lang="en"> 
<![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head runat="server">
<meta charset="UTF-8">
<title>양청 반도 리조트</title>
<link href="css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="css/style.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="css/public.css">
<script type="text/javascript" src="js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="js/html5shiv.js"></script>
</head>
<body class="anchor-destination section-index page-index lang-en" data-permanent-class="anchor-destination lang-en">
<form id="form2" runat="server">
<div id="main">
  <div class="header-mask"></div>
    <uc1:WebHeader runat="server" ID="WebHeader" />
  <!--背景图片-->
  <section class="top">
    <span class="animated-picto" data-picto-step-height="85" data-picto-steps-count="3">
      <img class="retina no-top" width="85" height="255" src="images/loader.png" alt="" />
    </span>
  </section>
  <!--背景图片-->
  <section class="scroll">
    <span class="arrow">
      <span class="bar bar-2"></span>
      <span class="bar bar-3"></span>
    </span>
  </section>
  <section class="page">
    <section class="schedules-container">
      <section class="schedules">
        <div class="items">
            <asp:Repeater ID="rptImg" runat="server">
        <ItemTemplate>
        <a data-timestamp="1403686800" data-duration="5500" data-image-top="<%#Eval("imgPath") %>" data-image-top-theme="dark" href="#" class="item ajax">
            <span class="inner">
              <span class="display">Early sunshine</span>
              <span class="hour"><%=DateTime.Now.ToString("hh:MM") %></span>
              <span class="title"><%#Eval("title") %></span>
              <i>
                <span class="bar bar-1"></span>
                <span class="bar bar-2"></span>
              </i>
            </span>
          </a>
        </ItemTemplate>
        </asp:Repeater>
        <asp:PlaceHolder ID="phNoData" runat="server" Visible="false">
          <a data-timestamp="1403686800" data-duration="5500" data-image-top="images/banner04.jpg" data-image-top-theme="dark" href="#" class="item ajax">
            <span class="inner">
              <span class="display">Early sunshine</span>
              <span class="hour">11:00</span>
              <span class="title">阳澄湖半岛度假酒店</span>
              <i>
                <span class="bar bar-1"></span>
                <span class="bar bar-2"></span>
              </i>
            </span>
          </a>
          <a data-timestamp="1403690400" data-duration="5500" data-image-top="images/banner03.jpg" data-image-top-theme="light" href="#" class="item ajax">
            <span class="inner">
            <span class="display">Radiant morning</span>
            <span class="hour">12:00</span>
            <span class="title">阳澄湖半岛度假酒店</span>
            <i>
              <span class="bar bar-1"></span>
              <span class="bar bar-2"></span>
            </i>
            </span>
          </a>
          <a data-timestamp="1403694000" data-duration="5500" data-image-top="images/banner02.jpg" data-image-top-theme="light" href="#" class="item ajax">
            <span class="inner">
              <span class="display">Midday lights</span>
              <span class="hour">13:00</span>
              <span class="title">阳澄湖半岛度假酒店</span>
              <i>
                <span class="bar bar-1"></span>
                <span class="bar bar-2"></span>
              </i>
            </span>
          </a>
          <a data-timestamp="1403730000" data-duration="11000" data-image-top="images/banner01.jpg" data-image-top-theme="light" href="#" class="item ajax">
            <span class="inner">
              <span class="display"></span>
              <span class="hour">23:00</span>
              <span class="title">阳澄湖半岛度假酒店</span>
              <i>
                <span class="bar bar-1"></span>
                <span class="bar bar-2"></span>
              </i>
            </span>
          </a>
            </asp:PlaceHolder>
        </div>
      </section>
    </section>
  </section>
</div>
</form>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/default.randheli.min.js"></script>
<script>
    var app = null;
    $(function () {
        app = new App(
                null,
                {
                    section: 'index',
                    page: 'index',
                    env: 'production',
                    base_url: '#',
                    header_open: 'open',
                    is_tablet: false,
                    is_mobile: false
                });
    });
</script>

</body>
</html>