<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebHeader.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.WebHeader" %>
<header>
  	<!--nav菜单 BEGIN-->
    <nav>
      <!--logo BEGIN-->		
      <h1><a href="/Default.aspx" class="ajax"><img class="retina" src="/images/logo.jpg" width="285" height="125" /></a></h1>
      <!--主菜单 BEGIN-->	
      <div class="list-container">
        <ul>
          <li class="open-subnav travel-diary"> <a href="/about/about_introduce.aspx" data-target-subnav="travel-diary">印象半岛</a> </li>
          <li class="open-subnav villas"> <a href="/traveling/travel_raiders_line.aspx" data-target-subnav="villas">缤纷旅程</a> </li>
          <li class="open-subnav culinary-art"> <a href="/share/share_shadow.aspx" data-target-subnav="culinary-art">悠程订制</a> </li>
          <li class="open-subnav well-being"> <a href="#" data-target-subnav="well-being">心情印记</a> </li>
          <li class="open-subnav experiences"> <a href="/news/news_information.aspx" data-target-subnav="experiences">旅游服务</a> </li>
          <div class="list-last">
            <!--<p><span class="login">登录</span><span class="register">注册</span></p>-->
              <asp:Literal ID="ltrLoginInfo" runat="server"></asp:Literal>              
            <p><a href="http://zw.sip-ych.com" target="_blank">半岛政务网</a></p>
            <p><a href="http://weibo.com/u/3207429340" target="_blank"><img src="../images/mark1.png"></a><span class="code"><img src="../images/mark2.png"></span><span class="code1"><img src="../images/mark3.png"></span></p>
            <asp:PlaceHolder ID="phLanguage" runat="server" Visible="false">
<div class="list-city">
                <a href="http://www.sip-ych.com/Default.aspx" target="_blank" alt="中文网"><img src="/images/language-hy.jpg" alt="中文网"></a>
                <a href="http://hy.sip-ych.com/Default.aspx" target="_blank" alt="Korean"><img src="/images/language-hhy.jpg" alt="Korean"></a>
                <a href="http://ry.sip-ych.com/Default.aspx" target="_blank" alt="Japanese"><img src="/images/language-ry.jpg" alt="Japanese"></a>
                <a href="http://yy.sip-ych.com/Default.aspx" target="_blank" alt="English"><img src="/images/language-yy.jpg" alt="English"></a>
            </div>
            </asp:PlaceHolder>

          </div>
        </ul>
        <span class="arrow">
        	<span class="inner"></span>
        </span> 
        </div>
      <!--主菜单 END-->
      <!--菜单右侧控制展开和收缩 BEGIN-->
      <div class="handle"> 
          <i class="cross"> 
              <span class="bar bar-1"></span> 
              <span class="bar bar-2"></span> 
          </i> 
          <i class="list"> </i> 
      </div>
      <div class="reserve"> 
          <a target="_blank" href="javascript:history.go(-1);">
              <span class="ajax text underline">返回
              <span class="u"></span>
              </span>
          </a> 
      </div>
    </nav>
    <!--nav菜单 END-->
    <!--子菜单 BEGIN-->
    <div class="subnavs">
      <!--印象半岛 BEGIN-->
      <div class="subnav travel-diary count-4"> 
          <a  href="/about/about_introduce.aspx" class="ajax item num-0 noonu-atoll"> 
              <span class="title"> 
              	<span class="inner">半岛纵览</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img1.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"> </span> 
          </a>
          <a href="/about/about_multivariate.aspx" class="ajax item num-1 history"> 
              <span class="title"> 
              	<span class="inner">多元半岛</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img2.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a>
          <a href="/news/news_information.aspx" class="ajax item num-0 alchemists"> 
              <span class="title"> 
              	<span class="inner">新闻资讯</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img3.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
          <a href="/news/news_notice.aspx" class="ajax item num-1 diving"> 
              <span class="title"> 
              	<span class="inner">通知公告</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img4.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
      </div>
      <!--印象半岛 END-->
      <!--缤纷旅程 BEGIN-->
      <div class="subnav villas count-7"> 
      
      <a href="/news/news_event.aspx" class="ajax item num-1 diving"> 
          <span class="title"> 
          	<span class="inner">特色活动</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img6.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/about/about_scenic.aspx" class="ajax item num-1 history"> 
          <span class="title"> 
            <span class="inner">景点推荐</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img7.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      
      <a href="/traveling/travel_food.aspx" class="ajax item num-2 garden-water-villas"> 
          <span class="title"> 
          	<span class="inner">美食推荐</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img8.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/traveling/travel_hotel.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">酒店推荐</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img9.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/traveling/travel_shopping.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">购物推荐</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img10.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      <a href="/traveling/travel_entertainment.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">娱乐推荐</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img11.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/news/news_sale.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">特惠信息</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img12.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      </div>
      <!--缤纷旅程 END-->
      <!--悠程订制 BEGIN-->
      <div class="subnav culinary-art count-4"> 
      	<a href="/about/about_location.aspx" class="ajax item num-2 seaplane"> 
          <span class="title"> 
            <span class="inner">半岛位置</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img13.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
       </a>
       <a href="/about/about_map.aspx" class="ajax item num-1 water-villas"> 
          <span class="title"> 
         	 <span class="inner">交通指南</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img14.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/trip/trip_line.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">行程规划</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img15.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
       <!--<a href="/traveling/travel_traffic.aspx" class="ajax item num-3 art"> 
          <span class="title"> 
            <span class="inner">导览图</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img4.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
       <a href="/traveling/travel_raiders_line.aspx" class="ajax item num-0 island-villas"> 
          <span class="title"> 
            <span class="inner">旅游攻略</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img16.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>-->
      <a href="javascript:void(0)" onclick="javascript:window.open('/about/VisualTravel.aspx')" class="ajax item num-0 island-villas"> 
          <span class="title"> 
            <span class="inner">虚拟游</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img17.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--悠程订制 END-->
      <!--心情印记 BEGIN-->
      <div class="subnav well-being count-3"> 
      <a href="/share/share_video.aspx" class="ajax item num-3 bar-1947"> 
          <span class="title"> 
          	<span class="inner">视频集锦</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img18.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_shadow.aspx" class="ajax item num-0 white"> 
          <span class="title"> 
          	<span class="inner">光影记录</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img19.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_blogs.aspx" class="ajax item num-1 white-bar"> 
          <span class="title"> 
          	<span class="inner">半岛游记</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img20.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--心情印记 END-->
      <!--澄心服务 BEGIN-->
      <div class="subnav experiences count-5">
      <a href="/share/share_youke.aspx" class="ajax item num-0 alchemists"> 
          <span class="title"> 
          	<span class="inner">游客中心</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img5.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_surveys.aspx" class="ajax item num-2 le-1947"> 
          <span class="title"> 
          	<span class="inner">问卷调查</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img21.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_lodge.aspx" class="ajax item num-4 table-partage"> 
          <span class="title"> 
          	<span class="inner">投诉建议</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img22.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_qa.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">问题解答</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img23.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/member/member_info.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">会员中心</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img24.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--澄心服务 END-->
      <div class="subnav more"> </div>
    </div>
    <!--子菜单 END-->
     
  </header>