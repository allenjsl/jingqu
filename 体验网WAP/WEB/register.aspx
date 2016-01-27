<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <!--header begin-->
<header class="header center">
	<div class="hd-back font16"><i class="yc-box yc-icon yc-close"></i>
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin-->
	<div id="navObj"></div>
	<script>
	    $(function () {
	        $("#navObj").load("nav.aspx", function () {
	            $(".nav li").eq(0).addClass("active");
	        });
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon dl-banner posR"></div>
            
		</div>
		<div class="register">
            <table>
            	<Tr>
                	<td align="right">用户名：</td>
                    <td><input type="text" class="register_input" name="username" id="username"><p id="usernameTip"></p></td>
                </Tr>
                <Tr>
                	<td align="right">密码：</td>
                    <td><input type="password" name="userpwd" class="register_input" id="userpwd"><p id="userpwdTip"></p></td>
                </Tr>
                <tr>
                	<td align="right">确认密码：</td>
                    <td><input type="password" name="userpwd1" class="register_input" id="userpwd1"><p id="userpwd1Tip"></p></td>
                </tr>
                <tr>
                	<td align="right">邮箱：</td>
                    <td><input type="text" name="usermail" class="register_input" id="usermail"><p id="usermailTip"></p></td>
                </tr>
                <tr>
                	<td colspan="2">
                        <asp:Button ID="btnRegister" CssClass="login_btn" runat="server" Text="提 交" OnClick="btnRegister_Click" /><input type="button" class="login_btn1" value="重 置"></td>
                </tr>
            </table>
        </div>
	</div>
    
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#username").blur(function () {
            if ($("#username").val() == "") {
                $("#usernameTip").html("用户名不能为空！");
            } else {
                $("#usernameTip").html("");
            }
        }).focus(function () {
            $("#usernameTip").html("请填写用户名");
        });

        //密码验证
        $("#userpwd").blur(function () {
            if ($("#userpwd").val() == "") {
                $("#userpwdTip").html("密码不能为空！");
            } else {
                $("#userpwdTip").html("");
            }
        }).focus(function () {
            $("#userpwdTip").html("仅填写字母和数字");
        });

        //确认密码验证
        $("#userpwd1").blur(function () {
            if (this.value != $("#userpwd").val() || this.value == "") {
                $("#userpwd1Tip").html("密码不一致！");
            } else {
                $("#userpwd1Tip").html("");
            }
        }).focus(function () {
            $("#userpwd1Tip").html("提示：密码保持一致");
        });

        //邮箱验证
        $("#usermail").blur(function () {
            var mailFor = /^[0-9a-zA-Z_]+@[0-9a-zA-Z]+\.[a-zA-Z]/
            if (!mailFor.test(this.value)) {
                $("#usermailTip").html("邮箱格式不正确！");
            } else {
                $("#usermailTip").html("");
            }
        }).focus(function () {
            $("#").html("请输入正确的邮箱");
        });

    });
</script>
    </form>
</body>
</html>
