<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>

</head>
<body>
<!--header begin-->
<header class="header center">
	<div class="hd-back font16">
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
		$(function(){
			$("#navObj").load("nav.aspx" ,function(){
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
                	<td align="right">新密码：</td>
                    <td><input type="password" class="register_input" id="userpwd"><p id="userpwdTip"></p></td>
                </Tr>
                <Tr>
                	<td align="right">再次输入：</td>
                    <td><input type="password" class="register_input" id="userpwd1"><p id="userpwd1Tip"></p></td>
                </Tr>
                <tr>
                	<td colspan="2"><input type="button"  class="login_btn" value="下一步"></td>
                </tr>
            </table>
        </div>
	</div>
    
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
        $("#username").blur(function(){
			if($("#username").val()==""){
			   $("#usernameTip").html("用户名不能为空！");		   
			   }else{
				   $("#usernameTip").html("");	
				   }
			}).focus(function(){
				 $("#usernameTip").html("请填写用户名");
				});
		
    //密码验证
	$("#userpwd").blur(function(){
	   if($("#userpwd").val()==""){
		   $("#userpwdTip").html("密码不能为空！");		   
		   }else{
			   $("#userpwdTip").html("");
			   }
	   }).focus(function(){
		   $("#userpwdTip").html("仅填写字母和数字");
		   });
	
	//确认密码验证
	$("#userpwd1").blur(function(){
	   if(this.value != $("#userpwd").val() || this.value==""){
		   $("#userpwd1Tip").html("密码不一致！");		   
		   }else{
			   $("#userpwd1Tip").html("");
			   }
	   }).focus(function(){
		   $("#userpwd1Tip").html("提示：密码保持一致");
		   });
		   
	//邮箱验证
	$("#usermail").blur(function(){
	   var mailFor = /^[0-9a-zA-Z_]+@[0-9a-zA-Z]+\.[a-zA-Z]/
	   if(!mailFor.test(this.value)){
		   $("#usermailTip").html("邮箱格式不正确！");		   
		   }else{			   
			   $("#usermailTip").html("");
			   }
	   }).focus(function(){
		   $("#").html("请输入正确的邮箱");
		   });
	
	});
</script>
</body>
</html>