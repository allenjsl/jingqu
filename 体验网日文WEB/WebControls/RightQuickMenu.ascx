<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightQuickMenu.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.RightQuickMenu" %>
<div id="floatPanel">
	<div class="ctrolPanel-left">
    <<
    </div>
  <div class="ctrolPanel"> 
  	<a class="tianqi tianqi_over"></a>
    <div class="tianqi_open">
      <h2>WEATHER</h2>
      <div style="height:60px; overflow:hidden;">
      <iframe style="position:absolute; top:5px;" allowtransparency="true" frameborder="0" width="195" height="96" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=1&z=1&t=0&v=0&d=1&bd=0&k=&f=808080&q=0&e=1&a=1&c=54511&w=195&h=96&align=center"></iframe>
      </div>
    </div>
  	<a class="language language_over"></a>
    <div class="language_open">
      <h2>LANGUAGE</h2>
      <ul>
        <li><a href="htp://ychp.com.cn" target="_blank">汉语</a></li>
        <li><a href="http://202.102.25.155:8006" target="_blank">English </a></li>
        <li><a href="http://202.102.25.155:8005" target="_blank">日本語 </a></li>
        <li><a href="http://202.102.25.155:8004" target="_blank">한국어</a></li>
      </ul>
    </div>
    <a class="search search_over"></a>
    <div class="search_open">
      <h2>SEARCH</h2>
      <table>
        <tr>
          <td><input type="text" class="search_input"></td>
          <td style="vertical-align:bottom"><a href="#"><img src="/images/search_btn.png"></a></td>
        </tr>
      </table>
    </div>
    <a class="service service_over"></a>
    <div class="service_open">
      <h2>SERVICE ONLINE</h2>
      <ul>
        <li><a href="#">客服一</a></li>
        <li><a href="#">客服二 </a></li>
        <li><a href="#">客服三 </a></li>
      </ul>
    </div>
    <a class="arrow" href="#"></a> </div>
</div>