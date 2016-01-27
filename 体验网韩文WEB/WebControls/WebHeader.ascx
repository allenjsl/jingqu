<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebHeader.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.WebHeader" %>
<header>
  	<!--nav菜单 BEGIN-->
    <nav>
      <!--logo BEGIN-->		
      <h1><a href="/Default.aspx" class="ajax"><img class="retina" src="/images/logo.jpg" width="285" height="125" /></a></h1>
      <!--主菜单 BEGIN-->	
      <div class="list-container">
        <ul>
          <li class="open-subnav travel-diary"> <a href="/about/about_introduce.aspx" data-target-subnav="travel-diary">인상이 반도</a> </li>
          <li class="open-subnav villas"> <a href="/traveling/travel_raiders_line.aspx" data-target-subnav="villas">찬연하다 여정</a> </li>
          <li class="open-subnav culinary-art"> <a href="/share/share_shadow.aspx" data-target-subnav="culinary-art">여행 계획</a> </li>
          <li class="open-subnav well-being"> <a href="#" data-target-subnav="well-being">마음이 도장</a> </li>
          <li class="open-subnav experiences"> <a href="/news/news_information.aspx" data-target-subnav="experiences">맑은 마음 서비스</a> </li>
          <div class="list-last">
            <!--<p><span class="login">로그인</span><span class="register">등록</span></p>-->
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
      <!--인상이 반도 BEGIN-->
      <div class="subnav travel-diary count-2"> 
          <a  href="/about/about_introduce.aspx" class="ajax item num-0 noonu-atoll"> 
              <span class="title"> 
              	<span class="inner">반도 종람하다.</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img1.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"> </span> 
          </a>
          <a href="/about/about_multivariate.aspx" class="ajax item num-1 history"> 
              <span class="title"> 
              	<span class="inner">다원 반도</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img2.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a>
          <a href="/news/news_information.aspx" class="ajax item num-0 alchemists" style="display:none;"> 
              <span class="title"> 
              	<span class="inner">뉴스</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img3.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
          <a href="/news/news_notice.aspx" class="ajax item num-1 diving" style="display:none;"> 
              <span class="title"> 
              	<span class="inner">알림 공고</span> 
              </span> 
              <span class="picture retina" style="background-image:url('/images/about_img4.jpg');"> 
              	<img class="retina" height="100%" /> 
              </span> 
              <span class="separator"></span> 
          </a> 
      </div>
      <!--인상이 반도 END-->
      <!--찬연하다 여정 BEGIN-->
      <div class="subnav villas count-5"> 
      
      <a href="/news/news_event.aspx" class="ajax item num-1 diving" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">특색 활동</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img6.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/about/about_scenic.aspx" class="ajax item num-1 history"> 
          <span class="title"> 
            <span class="inner">여행지 추천</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img7.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      
      <a href="/traveling/travel_food.aspx" class="ajax item num-2 garden-water-villas"> 
          <span class="title"> 
          	<span class="inner">음식 -</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img8.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/traveling/travel_hotel.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">호텔 -</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img9.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/traveling/travel_shopping.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">쇼핑 -</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img10.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      <a href="/traveling/travel_entertainment.aspx" class="ajax item num-3 art-recevoir"> 
          <span class="title"> 
          	<span class="inner">게임 -</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img11.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/news/news_sale.aspx" class="ajax item num-3 art-recevoir" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">특혜 정보</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img12.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> <span class="separator">
          </span> 
      </a>
      </div>
      <!--찬연하다 여정 END-->
      <!--천천히 좀 주문하여 만들다 BEGIN-->
      <div class="subnav culinary-art count-3"> 
      	<a href="/about/about_location.aspx" class="ajax item num-2 seaplane"> 
          <span class="title"> 
            <span class="inner">반도 위치</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img13.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
       </a>
       <a href="/about/about_map.aspx" class="ajax item num-1 water-villas"> 
          <span class="title"> 
         	 <span class="inner">교통 안내</span> 
          </span> <span class="picture retina" style="background-image:url('/images/about_img14.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a> 
      <a href="/trip/trip_line.aspx" class="ajax item num-5 diptyque" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">일정 계획</span> 
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
            <span class="inner">가상 여행</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img17.jpg');"> 
            <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--천천히 좀 주문하여 만들다 END-->
      <!--마음이 도장 BEGIN-->
      <div class="subnav well-being count-2"> 
      <a href="/share/share_video.aspx" class="ajax item num-3 bar-1947"> 
          <span class="title"> 
          	<span class="inner">동영상 모음</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img18.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_shadow.aspx" class="ajax item num-0 white"> 
          <span class="title"> 
          	<span class="inner">조명 기록</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img19.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_blogs.aspx" class="ajax item num-1 white-bar" style="display:none;"> 
          <span class="title"> 
          	<span class="inner">반도 여행기</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img20.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--마음이 도장 END-->
      <!--맑은 마음 서비스 BEGIN-->
      <div class="subnav experiences count-5">
      <a href="/share/share_youke.aspx" class="ajax item num-0 alchemists"> 
          <span class="title"> 
          	<span class="inner">여행객 센터</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img5.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_surveys.aspx" class="ajax item num-2 le-1947"> 
          <span class="title"> 
          	<span class="inner">설문 조사</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img21.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_lodge.aspx" class="ajax item num-4 table-partage"> 
          <span class="title"> 
          	<span class="inner">의견 제의</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img22.jpg');"> 
          	<img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/share/share_qa.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">문제에 해답을</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img23.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      <a href="/member/member_info.aspx" class="ajax item num-5 diptyque"> 
          <span class="title"> 
          	<span class="inner">회원 센터</span> 
          </span> 
          <span class="picture retina" style="background-image:url('/images/about_img24.jpg');"> 
         	 <img class="retina" height="100%" /> 
          </span> 
          <span class="separator"></span> 
      </a>
      </div>
      <!--맑은 마음 서비스 END-->
      <div class="subnav more"> </div>
    </div>
    <!--子菜单 END-->
     
  </header>