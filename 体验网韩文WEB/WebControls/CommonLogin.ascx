<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonLogin.ascx.cs" Inherits="Adpost.YCH.WEB.WebControls.CommonLogin" %>
<!--로그인弹出层-->
<div id="Monver_login">
  <h2>会员로그인<span id="close"></span></h2>
  <div class="login">
    <div class="login_lt left">
      <table>
        <tr>
          <td colspan="2"><input type="text" class="login_input1"></td>
        </tr>
        <tr>
          <td colspan="2"><input type="password" class="login_input2"></td>
        </tr>
        <tr>
          <td><input type="checkbox">
            记住我的로그인<span class="login_reg">등록</span><span class="login_find"><a href="../login_find.aspx">找回密码</a></span></td>
          <td><span class="login_lt_btn">로그인</span></td>
        </tr>
      </table>
    </div>
    <div class="login_rt right">
      <table>
        <tr>
          <td colspan="3">官方合作账号로그인</td>
        </tr>
        <tr>
          <td><a href="#"><img src="/images/parnter_login1.jpg"></a></td>
          <td><a href="#"><img src="/images/parnter_login2.jpg"></a></td>
          <td><a href="#"><img src="/images/parnter_login3.jpg"></a></td>
        </tr>
        <tr>
          <td colspan="3"><img src="/images/parnter_login4.jpg" style="border:1px solid #DFDFDF; margin-top:10px;"></td>
        </tr>
      </table>
    </div>
  </div>
</div>

<!--등록弹出层-->
<div id="Monver_register">
  <h2>등록会员<span id="close"></span></h2>
  <div class="register">
    <table>
      <tr>
        <td width="10%" align="right">用户名</td>
        <td width="50%"><input type="text" id="username"></td>
        <td width="40%"><div class="register_error" id="usernameTip_error"></div>
          <div class="register_true" id="usernameTip_true"></div></td>
      </tr>
      <tr>
        <td align="right">密码</td>
        <td><input type="password" id="userpwd" /></td>
        <td><div class="register_error" id="userpwdTip_error"></div>
          <div class="register_true" id="userpwdTip_true"></div></td>
      </tr>
      <tr>
        <td align="right">确认密码</td>
        <td><input type="password" id="userpwd1" /></td>
        <td><div class="register_error" id="userpwd1Tip_error"></div>
          <div class="register_true" id="userpwd1Tip_true"></div></td>
      </tr>
      <tr>
        <td align="right">邮箱</td>
        <td><input type="text" id="usermail" /></td>
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
        <td colspan="2"><input type="submit" class="submit_btn" value="提 交" />
          <input type="reset" class="reset_btn" value="重 置" /></td>
      </tr>
    </table>
    <div class="register_bottom">
      <p>官方合作账号로그인</p>
      <span><a href="#"><img src="/images/parnter_login1.jpg" /></a><a href="#"><img src="/images/parnter_login2.jpg" /></a><a href="#"><img src="/images/parnter_login3.jpg" /></a></span> </div>
  </div>
</div>

<!--二维码弹出层-->
<div id="Monver_code">
	<h2>官方微信账号<span id="close1"></span></h2>
    <div class="code_main">
    	<img src="/images/code.png">
        <p>官方微信账号 : YCH-Peninsula</p>
    </div>
</div>