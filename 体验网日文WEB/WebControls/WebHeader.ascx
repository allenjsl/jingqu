<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebHeader.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.WebHeader" %>
<header>
  	<!--nav菜单 BEGIN-->
    <nav>
      <!--logo BEGIN-->		
      <h1><a href="/Default.aspx" class="ajax"><img class="retina" src="/images/logo.jpg" width="285" height="125" /></a></h1>
      <!--主菜单 BEGIN-->	
      <div class="list-container">
        <ul>
          <li class="open-subnav travel-diary"> <a href="/about/about_introduce.aspx" data-target-subnav="travel-diary">半島概要</a> </li>
          <li class="open-subnav villas"> <a href="/traveling/travel_raiders_line.aspx" data-target-subnav="villas">多彩な旅</a> </li>
          <li class="open-subnav culinary-art"> <a href="/share/share_shadow.aspx" data-target-subnav="culinary-art">のんびり旅</a> </li>
          <li class="open-subnav well-being"> <a href="#" data-target-subnav="well-being">感想集</a> </li>
          <li class="open-subnav experiences"> <a href="/news/news_information.aspx" data-target-subnav="experiences">サービス</a> </li>
          <div class="list-last">
            <!--<p><span class="login">ログイン</span><span class="register">新規取得</span></p>-->
              <asp:Literal ID="ltrLoginInfo" runat="server"></asp:Literal> 
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
              <span class="ajax text underline">COME BACK
              <span class="u"></span>
              </span>
          </a> 
      </div>
    </nav>
    <!--nav菜单 END-->
    <!--子菜单 BEGIN-->
    <div class="subnavs">
      <!--半島概要 BEGIN-->
      <div class="subnav travel-diary count-2"> 
          <a  href="/about/about_introduce.aspx" class="ajax item num-0 noonu-atoll"> 
              <span class="title"> 
              	<span class="inner">半島一覧</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img1.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"> </span> 
          </a>
          <a href="/about/about_multivariate.aspx" class="ajax item num-1 history"> 
              <span class="title"> 
              	<span class="inner">多元半島</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img2.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a>
          <a href="/news/news_information.aspx" class="ajax item num-0 alchemists" style="display:none;"> 
              <span class="title"> 
              	<span class="inner">観光情報</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img3.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
          <a href="/news/news_notice.aspx" class="ajax item num-1 diving" style="display:none;"> 
              <span class="title"> 
              	<span class="inner">お知らせ</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img4.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
      </div>
      <!--半島概要 END-->
      <!--多彩な旅 BEGIN-->
      <div class="subnav villas count-5"> 
      
      <a href="/news/news_event.aspx" class="ajax item num-1 diving" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">イベント</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img6.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/about/about_scenic.aspx" class="ajax item num-1 history"> 
          <span class="title"> 
            <span class="inner">観光スッポト</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img7.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      
      <a href="/traveling/travel_food.aspx" class="ajax item num-2 garden-water-villas"> 
          <span class="title"> 
          	<span class="inner">食べる</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img8.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/traveling/travel_hotel.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">泊まる</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img9.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/traveling/travel_shopping.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">買う</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img10.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      <a href="/traveling/travel_entertainment.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">楽しむ</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img11.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/news/news_sale.aspx" class="ajax item num-3 art-recevoir" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">特価情報</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img12.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      </div>
      <!--多彩な旅 END-->
      <!--のんびり旅 BEGIN-->
      <div class="subnav culinary-art count-3"> 
      	<a href="/about/about_location.aspx" class="ajax item num-2 seaplane"> 
          <span class="title"> 
            <span class="inner">半島位置</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img13.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
       </a>
       <a href="/about/about_map.aspx" class="ajax item num-1 water-villas"> 
          <span class="title"> 
         	 <span class="inner">交通アクセス</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img14.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/trip/trip_line.aspx" class="ajax item num-5 diptyque" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">路線プラン</span> 
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
      <a href="/about/VisualTravel.aspx" class="ajax item num-0 island-villas"> 
          <span class="title"> 
            <span class="inner">バーチャルツアー</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img17.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--のんびり旅 END-->
      <!--感想集 BEGIN-->
      <div class="subnav well-being count-2"> 
      <a href="/share/share_video.aspx" class="ajax item num-3 bar-1947"> 
          <span class="title"> 
          	<span class="inner">ビデオリスト</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img18.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_shadow.aspx" class="ajax item num-0 white"> 
          <span class="title"> 
          	<span class="inner">光影メモ</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img19.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_blogs.aspx" class="ajax item num-1 white-bar" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">ツアー日記</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img20.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--感想集 END-->
      <!--サービス BEGIN-->
      <div class="subnav experiences count-5">
      <a href="/share/share_youke.aspx" class="ajax item num-0 alchemists"> 
          <span class="title"> 
          	<span class="inner">お客様センター</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img5.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_surveys.aspx" class="ajax item num-2 le-1947"> 
          <span class="title"> 
          	<span class="inner">アンケート</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img21.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_lodge.aspx" class="ajax item num-4 table-partage"> 
          <span class="title"> 
          	<span class="inner">お客様の声</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img22.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_qa.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">お問い合わせ</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img23.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/member/member_info.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">会員センター</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img24.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--サービス END-->
      <div class="subnav more"> </div>
    </div>
    <!--子菜单 END-->
     
  </header>